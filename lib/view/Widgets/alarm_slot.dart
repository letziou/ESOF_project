import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:uni/view/Widgets/row_container.dart';

class AlarmSlot extends StatelessWidget {
  final String subject;
  final String rooms;
  final String begin;
  final String typeClass;
  final int alarmBase = 10;
  final Icon unactiveIcon =
      Icon(Icons.notifications, color: Color.fromARGB(50, 110, 33, 14));
  final Icon activeIcon =
      Icon(Icons.notifications, color: Color.fromARGB(255, 110, 33, 14));
  final Icon notify =
      Icon(Icons.warning, color: Color.fromARGB(255, 110, 33, 14));

  AlarmSlot({
    Key key,
    @required this.subject,
    @required this.typeClass,
    @required this.rooms,
    @required this.begin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RowContainer(
        child: Container(
      padding:
          EdgeInsets.only(top: 10.0, bottom: 10.0, left: 22.0, right: 22.0),
      child: createScheduleSlotRow(context),
    ));
  }

  Widget createScheduleSlotRow(context) {
    return Container(
        key: Key('schedule-slot-time-${this.begin}'),
        margin: EdgeInsets.only(top: 3.0, bottom: 3.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: createScheduleSlotPrimInfo(context),
        ));
  }

  List<Widget> createScheduleSlotPrimInfo(context) {
    final subjectTextField = createTextField(
        this.subject,
        Theme.of(context).textTheme.headline3.apply(fontSizeDelta: -2),
        TextAlign.left);
    final typeClassTextField = createTextField(
        ' (' + this.typeClass + ')',
        Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -4),
        TextAlign.left);
    final roomTextField = createTextField(
        this.rooms,
        Theme.of(context).textTheme.headline4.apply(fontSizeDelta: -4),
        TextAlign.left);
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
      createTimePicker(context, alarmBase,
          Theme.of(context).textTheme.headline4.apply(fontSizeDelta: 5)),
      createScheduleSlotPrimInfoColumn(roomTextField)
    ];
  }

  Widget createTextField(text, style, alignment) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: style,
    );
  }

  Widget createTimePicker(context, alarm, style) {
    return RichText(
      text: TextSpan(
        text: alarm.toString() + ' mins',
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            showMaterialNumberPicker(
                context: context,
                title: 'Pick Timer',
                minNumber: 1,
                maxNumber: 59,
                selectedNumber: 1,
                onChanged: (value) => alarm = value);
          },
        style: style,
      ),
    );
  }

  Widget createScheduleSlotPrimInfoColumn(elements) {
    return Container(child: elements);
  }
}
