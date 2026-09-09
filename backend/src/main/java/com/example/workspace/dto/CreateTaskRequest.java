package com.example.workspace.dto;

import com.example.workspace.model.TaskStatus;
import jakarta.validation.constraints.NotBlank;
import java.util.List;

public class CreateTaskRequest {

    @NotBlank
    private String projectId;

    @NotBlank
    private String title;

    private String description;
    private TaskStatus status;
    private List<String> tags;

    public String getProjectId() {
        return projectId;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public TaskStatus getStatus() {
        return status;
    }

    public void setStatus(TaskStatus status) {
        this.status = status;
    }

    public List<String> getTags() {
        return tags;
    }

    public void setTags(List<String> tags) {
        this.tags = tags;
    }
}