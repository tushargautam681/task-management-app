 # Task Management App
<img width="812" height="469" alt="Screenshot 2025-12-12 161212" src="https://github.com/user-attachments/assets/9aed5bfc-fd9a-4779-9368-0189d30b6d0e" />
<img width="1920" height="1080" alt="Screenshot 2025-12-12 161505" src="https://github.com/user-attachments/assets/0115703c-68ee-4d1c-9213-2680144c0141" />
<img width="1920" height="1080" alt="Screenshot 2025-12-12 161522" src="https://github.com/user-attachments/assets/597c1d78-26f7-4328-b646-7562de1e1214" />

A Java-based task management web application built as a Semester 5 project. It helps users register, log in, and manage their daily tasks with a simple, structured interface.

## Features

- **User authentication**: Register, log in, and log out securely.
- **Task CRUD**: Create, read, update, and delete tasks.
- **Task attributes**: Title, description, due date, status, and priority (depending on your current implementation).
- **Session-based access**: Only authenticated users can access their dashboard and tasks.
- **Database-backed**: Tasks and users are stored in a relational database via DAO classes.

## Tech Stack

- **Language**: Java
- **Framework**: Java Servlet/JSP (Jakarta EE / Java EE style)
- **Build tool**: Maven (`pom.xml` in `TaskManagementSystem`)
- **View layer**: JSP pages (`login.jsp`, `register.jsp`, `dashboard.jsp`)
- **Database**: Relational DB with schema defined in `schema.sql`
- **Server**: Runs on a Java application server/servlet container (e.g., Apache Tomcat)

## Project Structure

- `TaskManagementSystem/src/main/java/com/taskmanager/model`  
  Contains entity classes like `User` and `Task`.

- `TaskManagementSystem/src/main/java/com/taskmanager/dao`  
  Data Access Object classes (`UserDAO`, `TaskDAO`) that interact with the database.

- `TaskManagementSystem/src/main/java/com/taskmanager/servlet`  
  Servlets for handling authentication and task operations (add, update, delete, etc.).

- `TaskManagementSystem/src/main/java/com/taskmanager/util`  
  Utility classes such as `DatabaseConnection` and `AuthenticationFilter`.

- `TaskManagementSystem/src/main/webapp`  
  JSP views (`login.jsp`, `register.jsp`, `dashboard.jsp`) and static assets (CSS).

- `TaskManagementSystem/schema.sql`  
  SQL file used to create required tables and relationships.

## Getting Started (Local Setup)

1. **Clone the repository**:

   ```bash
   git clone https://github.com/tushargautam681/task-management-app.git
   cd task-management-app
   ```

2. **Import into IDE**:

   - Open your Java IDE (IntelliJ IDEA, Eclipse, etc.).
   - Import `TaskManagementSystem` as a Maven project.

3. **Configure database**:

   - Create a database using the SQL in `TaskManagementSystem/schema.sql`.
   - Update database connection details in `DatabaseConnection.java` (URL, username, password).

4. **Run on server**:

   - Configure a servlet container (e.g., Apache Tomcat) in your IDE.
   - Deploy the `TaskManagementSystem` web module to the server.
   - Start the server and open the app in your browser (e.g., `http://localhost:8080/TaskManagementSystem`).

## Usage

- **Register** a new account using the registration page.
- **Log in** with your credentials.
- **Add tasks** with title/description (and other fields if configured).
- **Update or delete** existing tasks from the dashboard.
- **Log out** to end the session.

## Project Documentation

- `Task Management System - Project Report.pdf`  
  Full project report with design, implementation details, and screenshots.

- `Final_Project_Report.md` and `java_todo_report.md`  
  Markdown reports/descriptions of the project.

## License

This project is for educational purposes as part of a university semester project. You may adapt it for learning or personal use; please give appropriate credit if you reuse significant parts.

