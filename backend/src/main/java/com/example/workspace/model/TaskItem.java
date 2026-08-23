package com.example.workspace.model;

import java.time.Instant;
import java.util.List;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "tasks")
public class TaskItem {
    @Id
    private String id;
    private String projectId;
    private String title;
    private String description;
    private TaskStatus status;
    private List<String> tags;
    private Instant createdAt;

    public String getId() {}
}