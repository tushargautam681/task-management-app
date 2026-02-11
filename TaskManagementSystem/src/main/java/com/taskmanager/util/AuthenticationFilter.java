package com.taskmanager.util;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter("/*")
public class AuthenticationFilter implements Filter {
    
    // Explicitly listing public resources including CSS/JS
    private List<String> publicUrls = Arrays.asList(
        "/login.jsp", "/login", "/register.jsp", "/register", "/css/", "/js/"
    );
    
    public void init(FilterConfig config) {}
    
    public void doFilter(ServletRequest request, 
                        ServletResponse response, 
                        FilterChain chain) 
                        throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;
        
        String path = req.getRequestURI().substring(req.getContextPath().length());

        boolean isPublic = publicUrls.stream().anyMatch(path::startsWith);
        
        if (isPublic) {
            chain.doFilter(request, response);
        } else {
            HttpSession session = req.getSession(false);
            if (session != null && session.getAttribute("userId") != null) {
                chain.doFilter(request, response);
            } else {
                res.sendRedirect(req.getContextPath() + "/login.jsp");
            }
        }
    }
    
    public void destroy() {}
}
