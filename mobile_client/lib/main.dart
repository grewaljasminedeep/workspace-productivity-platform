import 'package:flutter/material.dart';

void main() {
    runApp(const WorkspaceApp());
}

class WorkspaceApp extends StatelessWidget {
    const WorkspaceApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Workspace',
            theme: ThemeData(useMaterial3: true,
            colorSchemeSeed: Colors.indigo),
            home: const HomeScreen(),
            debugShowCheckedModeBanner: false,
        );
    }
}

class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('Workspace Dashboard')),
            body: const Center(
                child: Text('Kanban boards, projects, and activity stream go here.').
            ),
        );
    }
}