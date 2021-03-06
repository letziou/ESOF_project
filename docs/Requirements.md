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

<br><br>


## Architecture and Design

### Logical Architecture

In order to document the high-level logical structure of the code, we have divided our project into four different sections:

* `Interface`: Interacts with the user. Is responsible for the delivery of the notifications to the user.

* `Logic`: Estabilishes the communication between the database and the visual interface, while also taking into account the user authentication. 

* `Authentication`- Is responsible for the app's authentication (login details)

* `Database` - Stores information regarding users, notifications and  authentications, while allowing the app to access information given by the user.

<p align="center" justify="center">
  <img src="https://github.com/LEIC-ES-2021-22/2LEIC13T1/blob/main/images/logical%20view%203%20white.png">
 </p>

<br><br>
### Physical Architecture

* `User's Phone`: We are using the flutter framework to build our UNI’s application module, we also make extensive use of the internal clock of the user’s phone, as the basis of time keeping, to execute the notifications at the right time.
* `FEUP server`: On the FEUP server machine we’ll be using SQLite for both the query logic and the database itself.  The query logic will also be charged with juggling the user’s notifications trough the use of the FireBase API.
* `FireBase`: The FireBase API is being used as a means to get notifications delivered to our users, through the use of their cloud messaging system. 
* `Sigarra`: We are scrubbing the database data from sigarra.


<p align="center" justify="center">
 <img src="https://github.com/LEIC-ES-2021-22/2LEIC13T1/blob/main/images/physiscal%20fixed.png">
</p>

<br><br>
## Prototype

For the application prototype, we decided to start by implementing a simple three button screen, where each button has a function.

The first button (green) sends a standard notification to the user’s own device. 

The second button (purple) when pressed displays a clock where the user can choose the time, this will be used to set the time frame for which the notification will be sent.

The third button (red) has the functionality of removing all notifications from the dashboard and remove them from schedule stack.

link to the prototype branch: https://github.com/LEIC-ES-2021-22/2LEIC13T1/tree/prototype/notification

<br><br>

## Product Management
To organize our team, the tool <a href="https://github.com/LEIC-ES-2021-22/2LEIC13T1/projects">@Github Projects<a> was used.<br>

We have used two projects:<br>
* `'Nots' project planning` - for the overall landmarks progress in development.<br>
* `Product management` - for organizing the app development with user case implementation.<br>
