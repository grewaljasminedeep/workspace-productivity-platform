import 'package:flutter/material.dart';

class KanbanBoard extends StatefulWidget {
  const KanbanBoard({super.key});

  @override
  State<KanbanBoard> createState() => _KanbanBoardState();
}

class _KanbanBoardState extends State<KanbanBoard> {
  final Map<String, List<String>> columns = {
    'BACKLOG': ['Create wireframes'],
    'IN_PROGRESS': ['Implement login flow'],
    'COMPLETED': ['Set up project structure'],
  };

  String? draggedTask;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: columns.entries.map((entry) {
        return Expanded(
          child: DragTarget<String>(
            onAccept: (task) {
              setState(() {
                for (final col in columns.values) {
                  col.remove(task);
                }

                columns[entry.key]!.add(task);
              });
            },
            builder: (context, candidateData, rejectedData) {
                return Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                            Text(entry.key, style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            ...entry.value.map((task) => Draggable<String>(
                                data: task,
                                feedback: Material(
                                    child: Container(
                                        padding: const EdgeInsets.all(8),
                                        color: Colors.white,
                                        child: Text(task),
                                    ),
                                ),
                                childWhenDragging: Opacity(
                                    opacity: 0.4,
                                    child: _taskCard(task),
                                ),
                                child: _taskCard(task),
                            ),
                            ),
                        ],
                    ),
                );
            },
          ),
        );
      }).toList(),
    );
  }

    Widget _taskCard(String task) {
        return Card(
        child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(task),
        ),
        );
    }
}