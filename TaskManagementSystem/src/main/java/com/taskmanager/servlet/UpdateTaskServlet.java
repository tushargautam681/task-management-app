package com.taskmanager.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.taskmanager.dao.TaskDAO;
import com.taskmanager.model.Task;

@WebServlet("/updateTask")
public class UpdateTaskServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, 
                         HttpServletResponse response) 
                         throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }
        
        try {
            int taskId = Integer.parseInt(request.getParameter("taskId"));
            String taskText = request.getParameter("taskText");
            String completedStr = request.getParameter("completed");
            
            Task task = new Task();
            task.setId(taskId);
            
            // Check what we are updating
            if (taskText != null) {
                task.setTaskText(taskText);
            }
            if (completedStr != null) {
                task.setCompleted(Boolean.parseBoolean(completedStr));
            }
            
            // Note: In a real app we'd fetch the existing task first 
            // to preserve fields, but here we assume the DAO handles partial updates 
            // or the client sends all data.
            // Wait, the DAO updateTask updates BOTH. Simplification for this project:
            // We need to fetch the task to get the correct values for what we aren't changing.
            // But this is just a quick school project fix. Let's make the client send both or handle it.
            // Re-reading DAO: "UPDATE tasks SET task_text = ?, completed = ? WHERE id = ?"
            // So we DO need both.
            // Let's assume the frontend sends what's needed.
            // The frontend JS snippet in the report sends:
            // For checkbox: {taskId, completed} -> missing taskText! (logic error in report code)
            // For edit: {taskId, taskText} -> missing completed!
            
            // Fix: Fetch task first
            TaskDAO dao = new TaskDAO();
            // We lack getTaskById in DAO snippet from report! 
            // I'll add getTaskById to DAO or just fix it here by fetching all user tasks and finding one? inefficient.
            // I'll implement getTaskById in TaskDAO.
            
            // ... Actually, to save time/complexity, I'll modify the DAO to be dynamic or just add getTaskById later.
            // For now, let's just make sure the JS sends everything or we ignore nulls in a smarter DAO method.
            // But I cannot easily change the DAO API I just wrote without rewriting it.
            // Let's assume for now I will use a simple workaround where I just set the other field to current value?
            // No, I can't get current value.
            
            // Let's UPDATE TaskDAO to include getTaskById.
            
            Task currentTask = dao.getTaskById(taskId);
            if (currentTask != null) {
                 if (taskText != null) currentTask.setTaskText(taskText);
                 if (completedStr != null) currentTask.setCompleted(Boolean.parseBoolean(completedStr));
                 
                 boolean success = dao.updateTask(currentTask);
                 
                 response.setContentType("application/json");
                 PrintWriter out = response.getWriter();
                 out.print("{\"success\":" + success + "}");
                 out.flush();
            } else {
                 response.setContentType("application/json");
                 PrintWriter out = response.getWriter();
                 out.print("{\"success\":false}"); // Task not found
                 out.flush();
            }
            
        } catch (Exception e) {
             e.printStackTrace();
             response.setContentType("application/json");
             response.getWriter().print("{\"success\":false}");
        }
    }
}
