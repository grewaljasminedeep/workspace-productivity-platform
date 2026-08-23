package com.example.workspace.controller;

import com.example.workspace.model.TaskItem;
import com.example.workspace.model.TaskStatus;
import com.example.workspace.repository.TaskRepository;
import java.time.Instant;
import java.util.List;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/tasks")
public class TaskController {
    private final TaskRepository taskRepository;

    public TaskController(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

@GetMapping("/project/{projectId}")
}