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
    public List<TaskItem> byProject(@PathVariable String projectId) {
        return taskRepository.findByProjectId(projectId);
    }

    @PostMapping
    public TaskItem create(@RequestBody TaskItem task) {
        task.setCreatedAt(Instant.now());
            if (task.getStatus() == null)
                task.setStatus(TaskStatus.BACKLOG);
            return taskRepository.save(task);
    }

    @PatchMapping("/{id}/status")
    public TaskItem updateStatus(@PathVariable String id, @RequestParam TaskStatus status) {
        TaskItem task = taskRepository.findById(id).orElseThrow();
        task.setStatus(status);
        return taskRepository.save(task);
    }
}