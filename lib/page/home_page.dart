import 'package:flutter/material.dart';
import 'package:flutter_beginner/services/addpage_provider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../routes/name_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isFavotite = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<AddPageProvider>(context).getTodos();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AddPageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'ToDo List',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _isFavotite = !_isFavotite;
                setState(() {});
              },
              icon: Icon(
                _isFavotite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ))
        ],
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, NameRoutes.addPage);
        },
        child: const Icon(Icons.add),
      ),
      body: controller.todos.isNotEmpty
          ? ListView.builder(
              itemCount: controller.todos.length,
              itemBuilder: (BuildContext context, int index) {
                Todo todo = controller.todos[index];
                return ListTile(
                  title: Text(todo.todo),
                );
              },
            )
          : Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/empty.json',
                  width: double.infinity,
                  height: 200,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Ayo mulai buat todolistmu!',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            )),
    );
  }
}
