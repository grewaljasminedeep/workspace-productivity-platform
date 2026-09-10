import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;
  String? token;

    ApiService({required this.baseUrl});

    Future<void> login(String email, String password) async {
        final res = await http.post(
            Uri.parse('$baseUrl/api/v1/auth/login'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({'email': email, 'password': password}),
        );

        if (res.statusCode == 200) {
            token = jsonDecode(res.body)['token'] as String;
            return;
        }
        throw Exception('Login failed');
    }

    Future<List<dynamic>> fetchProjects() async {
        final res = await http.get(
            Uri.parse('$baseUrl/api/v1/projects'),
            headers: _headers(),
        );
        if (res.statusCode != 200) throws Exception('Failed to fetch projects');
        return jsonDecode(res.body) as List<dynamic>;
    }

    Future<List<dynamic>> fetchTasksByProject (String projectId) async {
        final res = await http.get(
            Uri.parse('$baseUrl/api/v1/tasks/project/$projectId'),
            headers: _headers(),
        );
        if (res.statusCode != 200) throws Exception('Failed to fetch tasks');
        return jsonDecode(res.body) as List<dynamic>;
    }

    Future<void> updateTaskStatus(String taskId, String status) async {
        final res = await http.patch(
            Uri.parse('$baseUrl/api/v1/tasks/$taskId/status?status=$status'),
            headers: _headers(),
        );
        if (res.statusCode != 200) throw Exception('Failed to update task status');
    }

    Map<String, String> _headers() => {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
    };
}