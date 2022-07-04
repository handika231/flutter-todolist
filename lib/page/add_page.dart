import 'package:flutter/material.dart';
import 'package:flutter_beginner/services/addpage_provider.dart';
import 'package:provider/provider.dart';

class AddPage extends StatelessWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Provider.of<AddPageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ToDo List',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 12,
        ),
        child: Column(
          children: [
            TextField(
              onSubmitted: (value) async {
                controller.todoController.text = value;
                controller.addTodo(controller.todoController.text);
                Navigator.pop(
                  context,
                );
                controller.todoController.clear();
              },
              controller: controller.todoController,
              autocorrect: true,
              autofocus: true,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'what you do ?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
