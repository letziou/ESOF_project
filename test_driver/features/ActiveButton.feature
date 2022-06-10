Feature: ActiveButton

    This button should active or deactivate an alarm

    Scenario: Alarm is set as not active
        Given the app is running
        When I tap the "active" button
        Then the alarm should become active

    Scenario: Alarm is set as active
        Given the app is running
        When I tap the "active" button
        Then the alarm should become inactive