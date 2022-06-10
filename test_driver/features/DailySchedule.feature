Feature: DailyScheduleCreation

    Scenario: Daily Schedule is empty
        Given the app is running
        And the current "day" is "Segunda"
        When the "aggLectures[Segunda]" is empty
        Then I expect the "Content" to be "Não possui aulas à Segunda."

    Scenario: Daily Schedule has one class
        Given the app is running
        And the current "day" is "Quarta"
        Then I expect the "Content" to be "aggLectures[Quarta]"

