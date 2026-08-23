package com.example.workspace.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "users")
public class WorkspaceUser {
    @Id
    private String id;
    private String email;