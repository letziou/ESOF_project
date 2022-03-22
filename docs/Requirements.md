## Requirements

The following are some mandatory requirements needed by the user as to take advantage of our module, in no particular order.
- A working phone.
- The UNI app installed on said phone.
- An internet connection.
- Enrollment in any UP institution as a student.
- Enrollment on any number of classes, by the student.
- An already designated timetable by the UP-institution faculty, to the student.

Other requirements that are needed by us, as the developers of the module, are as follows.
- Access to the students timetable through the SIGARRA API.
- Access to the UNI application API.

### Use case model 

 <p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC13T1/blob/main/images/UseCaseView.png"/>
</p>

Description for each use case:

|||
| --- | --- |
| *Name* | Set up notifications |
| *Actor* |  Student | 
| *Description* | The student can select which classes to receive notifications on and modify them in terms of how much time ahead and the reception of a sound or not. |
| *Preconditions* | - The student has UNI app installed. <br> - The student is enrolled in FEUP. <br> - The student is enrolled in one or more classes. |
| *Postconditions* | - The student receives a notification warning them that his next class will start in the time span defined by him. |
| *Normal flow* | 1. The student accesses the UNI app and selects the notifications option. <br> 2. The app shows the list of classes the student is enrolled in. <br> 3. The student can select which classes to receive a notification.<br> 4. The student may change how much time ahead of schedule to receive the notifications. <br> 5. The student can modify the notification in relation to receiving a ping or not. <br> 6. The app tracks the current time from the internet in order to send the notification. |
| *Alternative flows and exceptions* | 1. If in step 6 of the normal flow the access to the internet isn’t possible the app should track the device’s clock. |

### User stories

### Domain model