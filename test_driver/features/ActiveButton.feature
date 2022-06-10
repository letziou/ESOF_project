Feature: ActiveButton

    This button should active or deactivate an alarm

    Scenario: Alarm is set as not active
        When I tap the "active" button
        Then the alarm should become active

    Scenario: Alarm is set as active
        When I tap the "active" button
        Then the alarm should become inactive
