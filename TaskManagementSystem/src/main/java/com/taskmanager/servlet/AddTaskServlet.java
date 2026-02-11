package com.taskmanager.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.taskmanager.dao.TaskDAO;
import com.taskmanager.model.Task;

@WebServlet("/addTask")
public class AddTaskServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, 
                         HttpServletResponse response) 
                         throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        int userId = (Integer) session.getAttribute("userId");
        String taskText = request.getParameter("taskText");
        
        if (taskText != null && !taskText.trim().isEmpty()) {
            Task task = new Task();
            task.setUserId(userId);
            task.setTaskText(taskText.trim());
            task.setCompleted(false);
            
            TaskDAO dao = new TaskDAO();
            dao.addTask(task);
        }
        
        response.sendRedirect("dashboard.jsp");
    }
}
