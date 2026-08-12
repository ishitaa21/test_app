import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

// Changed to StatefulWidget so the UI can update when a new task is added
class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  // Our actual, working list of todos (starts empty)
  final List<Todo> todos = [];

  // Function to show a popup where you can type
  void _showAddTodoDialog() {
    // Controllers to grab the text you type
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Todo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: descController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close without saving
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Check if title is not empty before adding
                if (titleController.text.isNotEmpty) {
                  setState(() {
                    // Add the typed text to our list
                    todos.add(Todo(
                      titleController.text,
                      descController.text,
                    ));
                  });
                  Navigator.pop(context); // Close the dialog
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      // If the list is empty, show a friendly message
      body: todos.isEmpty
          ? const Center(child: Text('No tasks yet. Add one!'))
          : ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => const DetailScreen(),
                  settings: RouteSettings(arguments: todos[index]),
                ),
              );
            },
          );
        },
      ),
      // The button that opens the input dialog
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todo = ModalRoute.of(context)!.settings.arguments as Todo;

    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          todo.description,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}