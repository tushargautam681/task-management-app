<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Register - Task Manager</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body class="bg-light">
        <div class="container">
            <div class="row justify-content-center mt-5">
                <div class="col-md-6">
                    <div class="card shadow">
                        <div class="card-header bg-success text-white">
                            <h3 class="text-center">Register New Account</h3>
                        </div>
                        <div class="card-body">
                            <form action="register" method="post">
                                <!-- Note: Need RegisterServlet if we implement it, or handle in JSP (bad practice but common in basic projects). I'll make a RegisterServlet or just simple JSP handling if quick. Plan didn't explicitly list RegisterServlet but inferred from report. I will implement RegisterServlet next. -->
                                <!-- Wait, report didn't show RegisterServlet but showed UserDAO.registerUser. I should create RegisterServlet. -->
                                <div class="mb-3">
                                    <label class="form-label">Username</label>
                                    <input type="text" name="username" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Email</label>
                                    <input type="email" name="email" class="form-control" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label">Password</label>
                                    <input type="password" name="password" class="form-control" required>
                                </div>
                                <button type="submit" class="btn btn-success w-100">Register</button>
                            </form>

                            <p class="mt-3 text-center">
                                Already have an account? <a href="login.jsp">Login here</a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

    </html>