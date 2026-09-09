package com.example.workspace.controller;

import com.example.workspace.dto.AuthResponse;
import com.example.workspace.dto.LoginRequest;
import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/auth")
public class AuthController {

    @PostMapping("/login")
    public AuthResponse login(@Valid @RequestBody LoginRequest request) {
        return new AuthResponse("demo-jwt-token");
    }
}