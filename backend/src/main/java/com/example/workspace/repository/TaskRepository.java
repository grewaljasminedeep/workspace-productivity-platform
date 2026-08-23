package com.example.workspace.repository;

import com.example.workspace.model.TaskItem;
import java.util.List;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface TaskRepository extends MongoRepository<TaskItem, String> {
    List<TaskItem> findByProjectId(String projectId);
}