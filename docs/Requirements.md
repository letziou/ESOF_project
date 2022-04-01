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
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC13T1/blob/main/images/UseCaseview.png?raw=true"/>
</p>

Description for each use case:

|||
| --- | --- |
| *Name* | Set up notifications |
| *Actor* |  Student | 
| *Description* | The student can select which classes to receive notifications. |
| *Preconditions* | - The student has UNI app installed. <br> - The student is enrolled in FEUP. <br> - The student is enrolled in one or more classes. |
| *Postconditions* | - The student receives a notification warning them that his next class will start. |
| *Normal flow* | 1. The student accesses the UNI app and selects the notifications option. <br> 2. The app shows the list of classes the student is enrolled in. <br> 3. The student can select which classes to receive notification from. <br> 4. After choosing which classes the Student wants to receive notifications from, he confirms them by selecting an apply button. <br> 5. The app tracks the current time from the internet in order to send the notification. |
| *Alternative flows and exceptions* | Cancel Button - If in step 4 of the normal flow the Student chooses the cancel button the app returns to the notifications menu without changes. <br> No Internet Connection - If in step 5 of the normal flow the access to the internet isn’t possible the app should track the device’s clock. |

<br><br>

|||
| --- | --- |
| *Name* | Removing notifications |
| *Actor* |  Student | 
| *Description* | The Student can remove a notification he previously set. |
| *Preconditions* | - The student has UNI app installed. <br> - The student is enrolled in FEUP. <br> - The student is enrolled in one or more classes. <br> - The student has at least one notification set up on the UNI app. |
| *Postconditions* | - The student no longer receives the notification. |
| *Normal flow* | 1. The student accesses the UNI app and selects the notifications option. <br> 2. The app shows the list of classes the student is enrolled in and which have the notifications on. <br> 3. The student can remove the notification by unchecking the check box <br> 4. After choosing the classes to stop receiving a notification from, the Student confirms by selecting an apply button. |
| *Alternative flows and exceptions* | Cancel Button - If in step 4 of the normal flow the Student chooses the cancel button the app returns to the notification menu without changes. |

<br><br>

|||
| --- | --- |
| *Name* | Scheduling notifications |
| *Actor* |  Student | 
| *Description* | The Student can modify how much time ahead of schedule to receive a notification. |
| *Preconditions* | - The student has UNI app installed. <br> - The student is enrolled in FEUP. <br> - The student is enrolled in one or more classes. <br> - The student has at least one notification set up on the UNI app. |
| *Postconditions* | - The student receives his notifications according to the changes he made. |
| *Normal flow* | 1. The student accesses the UNI app and selects the notifications option. <br> 2. The app shows the list of classes the student is enrolled in and which have the notifications on. <br> 3. The student selects the option tab on the notifications menu <br> 4. The student chooses how much time ahead to receive the notification. <br> 5. The student confirms the changes by selecting the apply button. |
| *Alternative flows and exceptions* | Default Set Up - If the student doesn't modify the time, the notification will be set with the default time. <br> Cancel Button - If in step 5 the students selects the cancel button the notifications will be set to, either the previous time set or if none exists to the default time. |

<br><br>

|||
| --- | --- |
| *Name* | Sound notifications |
| *Actor* |  Student | 
| *Description* | The Student can choose if a notification makes a sound. |
| *Preconditions* | - The student has UNI app installed. <br> - The student is enrolled in FEUP. <br> - The student is enrolled in one or more classes. <br> - The student has at least one notification set up on the UNI app. |
| *Postconditions* | - The student receives his notifications according to the changes he made. |
| *Normal flow* | 1. The student accesses the UNI app and selects the notifications option. <br> 2. The app shows the list of classes the student is enrolled in and which have the notifications on. <br> 3. The student selects the option tab on the notifications menu <br> 4. The student can choose if a notification can make a sound or not. <br> 5. The student confirms the changes by selecting the apply button. |
| *Alternative flows and exceptions* | Default Set Up- If the student doesn't modify the sound option, the notification will be set with the default to on. <br> Cancel Button - If in step 5 the students selects the cancel button the notifications will be set to the previous sound option or if none exists to the default option. |

<br><br>

|||
| --- | --- |
| *Name* | Change notification appearance |
| *Actor* |  Student | 
| *Description* | The Student can alter the appearance of the notifications. |
| *Preconditions* | - The student has UNI app installed. <br> - The student is enrolled in FEUP. <br> - The student is enrolled in one or more classes. <br> - The student has at least one notification set up on the UNI app. |
| *Postconditions* | - The student receives his notifications according to the changes he made. |
| *Normal flow* | 1. The student accesses the UNI app and selects the notifications option. <br> 2. The app shows the list of classes the student is enrolled in and which have the notifications on. <br> 3. The student selects the option tab on the notifications menu <br> 4. The student chooses the alter the notification appearance option. <br> 5. The student decides on the notification's appearance by selecting differant banner styles.<br> 6. The student confirms the changes by selecting the apply button. |
| *Alternative flows and exceptions* | Default Set Up - If the student doesn't modify the notification's appearance, the notification will be set with the default one. <br> Cancel Button - If in step 6 the students selects the cancel button the notifications will be set to the previous appearance selected by the student or if none exists to the default option. |

<br><br>


### Domain model

 <p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC13T1/blob/main/images/Domain%20Model%20white%202.png">
 </p>
