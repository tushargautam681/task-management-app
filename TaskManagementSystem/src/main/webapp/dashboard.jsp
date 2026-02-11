<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.*, com.taskmanager.model.*, com.taskmanager.dao.*" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

                <!DOCTYPE html>
                <html>

                <head>
                    <title>Task Dashboard</title>
                    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
                        rel="stylesheet">
                    <style>
                        .completed .task-text {
                            text-decoration: line-through;
                            color: #888;
                        }

                        .task-checkbox {
                            cursor: pointer;
                        }
                    </style>
                </head>

                <body>
                    <% if (session.getAttribute("userId")==null) { response.sendRedirect("login.jsp"); return; } int
                        userId=(Integer) session.getAttribute("userId"); String username=(String)
                        session.getAttribute("username"); TaskDAO dao=new TaskDAO(); List<Task> tasks =
                        dao.getAllTasks(userId);
                        request.setAttribute("taskList", tasks);

                        int totalTasks = tasks.size();
                        int completedTasks = 0;
                        for (Task t : tasks) {
                        if (t.isCompleted()) completedTasks++;
                        }
                        int activeTasks = totalTasks - completedTasks;
                        %>

                        <div class="container mt-5">
                            <div class="row mb-4">
                                <div class="col-md-8">
                                    <h2>Welcome, <%= username %>
                                    </h2>
                                </div>
                                <div class="col-md-4 text-end">
                                    <a href="logout" class="btn btn-danger">Logout</a>
                                </div>
                            </div>

                            <div class="row mt-4">
                                <div class="col-md-4">
                                    <div class="card text-center bg-light">
                                        <div class="card-body">
                                            <h5>Total Tasks</h5>
                                            <h2>
                                                <%= totalTasks %>
                                            </h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card text-center bg-light">
                                        <div class="card-body">
                                            <h5>Active Tasks</h5>
                                            <h2 class="text-warning">
                                                <%= activeTasks %>
                                            </h2>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card text-center bg-light">
                                        <div class="card-body">
                                            <h5>Completed Tasks</h5>
                                            <h2 class="text-success">
                                                <%= completedTasks %>
                                            </h2>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="card mt-4">
                                <div class="card-header bg-primary text-white">
                                    <h4>Add New Task</h4>
                                </div>
                                <div class="card-body">
                                    <form action="addTask" method="post">
                                        <div class="input-group">
                                            <input type="text" name="taskText" class="form-control"
                                                placeholder="Enter task description..." required>
                                            <button type="submit" class="btn btn-dark">Add Task</button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <div class="card mt-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h4 class="mb-0">Your Tasks</h4>
                                </div>
                                <div class="card-body p-0">
                                    <% if (tasks.isEmpty()) { %>
                                        <p class="text-muted text-center p-4">No tasks yet. Add your first task above!
                                        </p>
                                        <% } else { %>
                                            <div class="list-group list-group-flush">
                                                <c:forEach var="task" items="${taskList}">
                                                    <div class="list-group-item ${task.completed ? 'completed' : ''}">
                                                        <div class="row align-items-center">
                                                            <div class="col-1 text-center">
                                                                <input type="checkbox"
                                                                    class="form-check-input task-checkbox"
                                                                    data-id="${task.id}" ${task.completed ? 'checked'
                                                                    : '' }>
                                                            </div>
                                                            <div class="col-7">
                                                                <span class="task-text">
                                                                    <c:out value="${task.taskText}" />
                                                                </span>
                                                            </div>
                                                            <div class="col-4 text-end">
                                                                <button class="btn btn-sm btn-warning edit-task-btn"
                                                                    data-id="${task.id}"
                                                                    data-text="<c:out value='${task.taskText}'/>">Edit</button>
                                                                <button class="btn btn-sm btn-danger delete-task-btn"
                                                                    data-id="${task.id}">Delete</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            <% } %>
                                </div>
                            </div>
                        </div>

                        <!-- Edit Modal -->
                        <div class="modal fade" id="editModal" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Edit Task</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <input type="hidden" id="editTaskId">
                                        <div class="mb-3">
                                            <label class="form-label">Task Description</label>
                                            <input type="text" class="form-control" id="editTaskText">
                                        </div>
                                        <button type="button" class="btn btn-primary" onclick="saveTask()">Save
                                            Changes</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <script
                            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
                        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                        <script>
                            $('.task-checkbox').change(function () {
                                const taskId = $(this).data('id');
                                const completed = $(this).is(':checked');
                                $.post('updateTask', { taskId: taskId, completed: completed }, function (res) {
                                    if (res.success) location.reload();
                                });
                            });

                            // Event Delegation for Edit Button
                            $(document).on('click', '.edit-task-btn', function () {
                                const id = $(this).data('id');
                                const text = $(this).data('text');
                                editTask(id, text);
                            });

                            // Event Delegation for Delete Button
                            $(document).on('click', '.delete-task-btn', function () {
                                const id = $(this).data('id');
                                deleteTask(id);
                            });

                            function editTask(id, text) {
                                $('#editTaskId').val(id);
                                $('#editTaskText').val(text);
                                new bootstrap.Modal(document.getElementById('editModal')).show();
                            }

                            function saveTask() {
                                const id = $('#editTaskId').val();
                                const text = $('#editTaskText').val();
                                $.post('updateTask', { taskId: id, taskText: text }, function (res) {
                                    if (res.success) location.reload();
                                });
                            }

                            function deleteTask(id) {
                                if (confirm('Delete this task?')) {
                                    $.post('deleteTask', { taskId: id }, function (res) {
                                        if (res.success) location.reload();
                                    });
                                }
                            }
                        </script>
                </body>

                </html>