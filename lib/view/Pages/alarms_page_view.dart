import 'package:flutter/gestures.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:uni/model/app_state.dart';
import 'package:uni/model/entities/lecture.dart';
import 'package:flutter/material.dart';
import 'package:uni/view/Widgets/page_title.dart';
import 'package:uni/view/Widgets/request_dependent_widget_builder.dart';
import 'package:uni/view/Widgets/row_container.dart';

/// Manages the 'schedule' sections of the app
class AlarmPageView extends StatefulWidget {
  AlarmPageView(
      {Key key,
      @required this.tabController,
      @required this.daysOfTheWeek,
      @required this.aggLectures,
      @required this.scheduleStatus,
      this.scrollViewController});

  final List<String> daysOfTheWeek;
  final List<List<Lecture>> aggLectures;
  final RequestStatus scheduleStatus;
  final TabController tabController;
  final ScrollController scrollViewController;

  @override
  State<StatefulWidget> createState() => AlarmPageViewState(
      this.tabController,
      this.daysOfTheWeek,
      this.aggLectures,
      this.scheduleStatus,
      this.scrollViewController);
}

class AlarmPageViewState extends State<AlarmPageView> {
  final List<String> daysOfTheWeek;
  final List<List<Lecture>> aggLectures;
  final RequestStatus scheduleStatus;
  final TabController tabController;
  final ScrollController scrollViewController;
  final List<int> times = List.filled(99, 10);
  final List<bool> active = List.filled(99, false);

  final Icon unactiveIcon =
      Icon(Icons.notifications, color: Color.fromARGB(50, 110, 33, 14));
  final Icon activeIcon =
      Icon(Icons.notifications, color: Color.fromARGB(255, 110, 33, 14));
  final Icon notify =
      Icon(Icons.warning, color: Color.fromARGB(255, 110, 33, 14));
  final Icon alarm = Icon(Icons.alarm);

  AlarmPageViewState(this.tabController, this.daysOfTheWeek, this.aggLectures,
      this.scheduleStatus, this.scrollViewController);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData queryData = MediaQuery.of(context);

    return Column(children: <Widget>[
      ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: <Widget>[
          PageTitle(name: 'Alarmes'),
          TabBar(
            controller: tabController,
            isScrollable: true,
            tabs: createTabs(queryData, context),
          ),
        ],
      ),
      Expanded(
          child: TabBarView(
        controller: tabController,
        children: createSchedule(context),
      )),
      Align(
        alignment: Alignment.bottomRight,
        child: createAllTimePicker(context,
            Theme.of(context).textTheme.headline3.apply(fontSizeDelta: -2)),
      )
    ]);
  }

  /// Returns a list of widgets empty with tabs for each day of the week.
  List<Widget> createTabs(queryData, BuildContext context) {
    final List<Widget> tabs = <Widget>[];
    for (var i = 0; i < daysOfTheWeek.length; i++) {
      tabs.add(Container(
        color: Theme.of(context).backgroundColor,
        width: queryData.size.width * 1 / 3,
        child: Tab(key: Key('schedule-page-tab-$i'), text: daysOfTheWeek[i]),
      ));
    }
    return tabs;
  }

  List<Widget> createSchedule(context) {
    final List<Widget> tabBarViewContent = <Widget>[];
    for (int i = 0; i < daysOfTheWeek.length; i++) {
      tabBarViewContent.add(createScheduleByDay(context, i));
    }
    return tabBarViewContent;
  }

  /// Returns a list of widgets for the rows with a singular class info.
  List<Widget> createScheduleRows(lectures, BuildContext context, day) {
    final List<Widget> scheduleContent = <Widget>[];
    for (int i = 0; i < lectures.length; i++) {
      final Lecture lecture = lectures[i];
      scheduleContent.add(alarmSlot(
        context,
        lecture.subject,
        lecture.room,
        lecture.startTime,
        lecture.typeClass,
        i + day * 10,
      ));
    }
    return scheduleContent;
  }

  Widget Function(dynamic daycontent, BuildContext context) dayColumnBuilder(
      int day) {
    Widget createDayColumn(dayContent, BuildContext context) {
      return Container(
          key: Key('schedule-page-day-column-$day'),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: createScheduleRows(dayContent, context, day),
          ));
    }

    return createDayColumn;
  }

  Widget createScheduleByDay(BuildContext context, int day) {
    return RequestDependentWidgetBuilder(
      context: context,
      status: scheduleStatus,
      contentGenerator: dayColumnBuilder(day),
      content: aggLectures[day],
      contentChecker: aggLectures[day].isNotEmpty,
      onNullContent:
          Center(child: Text('Não possui aulas à ' + daysOfTheWeek[day] + '.')),
      index: day,
    );
  }

  Widget alarmSlot(BuildContext context, String subject, String rooms,
      String begin, String typeClass, int place) {
    return RowContainer(
        child: Container(
      padding:
          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 22.0, right: 22.0),
      child: createScheduleSlotRow(
          context, subject, rooms, begin, typeClass, place),
    ));
  }

  Widget createScheduleSlotRow(BuildContext context, String subject,
      String rooms, String begin, String typeClass, int place) {
    return Container(
        key: Key('schedule-slot-time-${begin}'),
        margin: EdgeInsets.only(top: 3.0, bottom: 3.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: createScheduleSlotPrimInfo(
              context, subject, rooms, begin, typeClass, place),
        ));
  }

  List<Widget> createScheduleSlotPrimInfo(BuildContext context, String subject,
      String rooms, String begin, String typeClass, int place) {
    final subjectTextField = createTextField(
        subject,
        Theme.of(context).textTheme.headline3.apply(fontSizeDelta: -2),
        TextAlign.left);
    final typeClassTextField = createTextField(
        ' (' + typeClass + ')',
        Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -4),
        TextAlign.left);
    final alarmTextPicker = createTimePicker(context,
        Theme.of(context).textTheme.headline4.apply(fontSizeDelta: 5), place);
    return [
      Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              subjectTextField,
              typeClassTextField,
            ],
          ),
        ],
      ),
      alarmTextPicker,
      createScheduleSlotPrimInfoColumn(createActiveButton(place))
    ];
  }

  Widget createTextField(text, style, alignment) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }

  Widget createTimePicker(context, style, place) {
    return RichText(
      text: TextSpan(
        text: null,
        children: active[place]
            ? [
                TextSpan(
                    text: times[place].toString() + ' min',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        showMaterialNumberPicker(
                          context: context,
                          title: 'Pick Timer',
                          maxNumber: 59,
                          minNumber: 0,
                          selectedNumber: 0,
                          onChanged: (value) =>
                              setState(() => times[place] = value),
                        );
                      },
                    style: style),
              ]
            : [TextSpan(text: 'No alarm', style: style)],
      ),
    );
  }

  Widget createAllTimePicker(context, style) {
    return IconButton(
      icon: alarm,
      tooltip: 'change time',
      onPressed: () {
        showMaterialNumberPicker(
          context: context,
          title: 'Pick Timer',
          maxNumber: 59,
          minNumber: 0,
          selectedNumber: 0,
          onChanged: (value) =>
              setState(() => times.fillRange(0, times.length, value)),
        );
      },
    );
  }

  Widget createActiveButton(place) {
    return IconButton(
      icon: active[place] ? activeIcon : unactiveIcon,
      onPressed: () {
        try {
          setState(() {
            active[place] = !active[place];
          });
        } catch (e) {
          print(e);
        }
      },
    );
  }

  Widget createScheduleSlotPrimInfoColumn(elements) {
    return Container(child: elements);
  }
}
