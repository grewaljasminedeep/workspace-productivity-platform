package com.example.workspace.dto;

import jakarta.validation.constraints.NotBlank;
import java.util.List;

public class CreateProjectRequest {

    @NotBlank
    private String name;

    private String description;

    private List<String> memberIds;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getMemberIds() {
        return memberIds;
    }

    public void setMemberIds(List<String> memberIds) {
        this.memberIds = memberIds;
    }
}