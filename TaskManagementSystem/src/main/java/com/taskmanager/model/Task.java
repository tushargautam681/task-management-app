package com.taskmanager.model;

import java.sql.Timestamp;

public class Task {
    private int id;
    private int userId;
    private String taskText;
    private boolean completed;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public Task() {}

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public String getTaskText() { return taskText; }
    public void setTaskText(String taskText) { this.taskText = taskText; }

    public boolean isCompleted() { return completed; }
    public void setCompleted(boolean completed) { this.completed = completed; }

    public Timestamp getCreatedAt() { return createdAt; }
    public void setCreatedAt(Timestamp createdAt) { this.createdAt = createdAt; }

    public Timestamp getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Timestamp updatedAt) { this.updatedAt = updatedAt; }
}
