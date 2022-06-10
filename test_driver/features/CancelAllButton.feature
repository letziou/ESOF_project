Feature: CancelAllButton

  This button should cancel all the notifications that are currently scheduled 

  Scenario: There are several scheduled notifications
    Given the app is running
    When I tap the "Cancel All Notifications" button
    Then all notifications should be deleted