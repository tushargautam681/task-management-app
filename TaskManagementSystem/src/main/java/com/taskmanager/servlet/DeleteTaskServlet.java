package com.taskmanager.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.taskmanager.dao.TaskDAO;

@WebServlet("/deleteTask")
public class DeleteTaskServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, 
                         HttpServletResponse response) 
                         throws ServletException, IOException {
        
        int taskId = Integer.parseInt(request.getParameter("taskId"));
        
        TaskDAO dao = new TaskDAO();
        boolean success = dao.deleteTask(taskId);
        
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print("{\"success\":" + success + "}");
        out.flush();
    }
}
