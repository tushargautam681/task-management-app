# Project Report
## Task Management System

**Submitted by:**
Tushar Gautam
23030746
B.Tech-CSE-FSD-5th Semester
Quantum University, Roorkee
---

### Acknowledgement

I would like to express my special thanks of gratitude to my professor Mr.Rajarshee Banerjee who gave me the golden opportunity to do this project on the topic "Task Management System", which also helped me in doing a lot of Research and I came to know about so many new things. I am really thankful to them.

---

### Abstract

The Task Management System is a web-based application developed using Java technologies (JSP, Servlets) and MySQL. The primary objective of this project is to provide a platform for users to manage their daily tasks efficiently. The system allows users to register, log in, create tasks, update their status, and delete them. It implements the Model-View-Controller (MVC) architecture to separate concerns and ensure maintainability.

---

### 1. Introduction

#### 1.1 Overview
In today's fast-paced world, managing time and tasks effectively is crucial. The Task Management System is designed to simplify this process by offering a user-friendly interface for tracking to-do lists.

#### 1.2 Purpose
The purpose of this project is to build a robust and secure web application that replaces manual to-do lists with a digital solution, ensuring data persistence and accessibility.

#### 1.3 Scope
*   **User Authentication:** Secure access via login.
*   **Task Management:** Adding, editing, deleting, and marking tasks as complete.
*   **Data Persistence:** Storing user and task data in a relational database.

---

### 2. System Analysis

#### 2.1 Existing System
The traditional method involves using paper and pen or simple text files. These methods lack organization, data security, and the ability to edit or track status dynamically.

#### 2.2 Proposed System
The proposed automated system allows:
*   Dynamic interaction (AJAX based updates).
*   Centralized database storage.
*   Multi-user support with data isolation.

---

### 3. System Requirements

#### 3.1 Hardware Requirements
*   Processor: Intel Core i3 or higher
*   RAM: 4GB or higher
*   Hard Disk: 10GB free space

#### 3.2 Software Requirements
*   **Operating System:** Windows 10/11
*   **Language:** Java (JDK 1.8+)
*   **Technologies:** Servlet, JSP, JDBC, HTML5, CSS3, Bootstrap 5
*   **Database:** MySQL 8.0
*   **Server:** Apache Tomcat 7/9
*   **Build Tool:** Apache Maven
*   **IDE:** Eclipse IDE

---

### 4. System Design

#### 4.1 Architecture (MVC)
The project follows the Model-View-Controller pattern:
*   **Model:** Java Classes (`User`, `Task`) representing data and DAO classes for database logic.
*   **View:** JSP pages (`dashboard.jsp`, `login.jsp`) for the user interface.
*   **Controller:** Servlets (`LoginServlet`, `TaskServlet`) processing user requests.

#### 4.2 Database Schema

**Table: users**
| Column | Type | Description |
|---|---|---|
| id | INT (PK) | Unique User ID |
| first_name | VARCHAR | First Name of user |
| last_name | VARCHAR | Last Name of user |
| username | VARCHAR | Unique login username |
| password | VARCHAR | Login password |

**Table: tasks**
| Column | Type | Description |
|---|---|---|
| id | INT (PK) | Unique Task ID |
| user_id | INT (FK) | Links task to a user |
| task_text | TEXT | Description of the task |
| completed | BOOLEAN | Status (True/False) |

---

### 5. Implementation Details

#### 5.1 Modules
1.  **Authentication Module:** Handles User Registration and Login.
2.  **Dashboard Module:** Displays summary statistics (Total, Active, Completed).
3.  **Task Operation Module:** Handles logic for Add, Update, and Delete actions using AJAX for a smooth experience.

---

### 6. Results and Output (Screenshots)

**6.1 Login Page**
*(This screen allows users to authenticate into the system.)*
[PASTE LOGIN PAGE SCREENSHOT HERE]

<br>

**6.2 Registration Page**
*(New users can create an account here.)*
[PASTE REGISTRATION PAGE SCREENSHOT HERE]

<br>

**6.3 Dashboard (Main Screen)**
*(Shows the list of tasks and statistics cards.)*
[PASTE DASHBOARD SCREENSHOT HERE]

<br>

**6.4 Adding a Task**
*(A new task being added to the list.)*
[PASTE ADD TASK SCREENSHOT HERE]

<br>

**6.5 Task Completed View**
*(Shows tasks marked as completed/crossed out.)*
[PASTE COMPLETED TASKS SCREENSHOT HERE]

---

### 7. Conclusion
The Task Management System was successfully designed and developed. It meets the primary objectives of providing a secure and efficient way to manage personal tasks. The usage of the MVC pattern ensures the code is organized and scalable.

### 8. Future Scope
*   **Reminders:** Email notifications for pending tasks.
*   **Categories:** Grouping tasks by tags (Work, Personal).
*   **Search:** Searching and filtering tasks.

### 9. Bibliography
*   Jakarta Servlet Specification
*   MySQL Documentation
*   Bootstrap 5 Documentation
