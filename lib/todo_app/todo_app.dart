// import 'dart:ffi';

import 'dart:ffi' as ffi;

import 'package:flutter/material.dart';
import 'package:flutter_hook_try_out/todo_app/todo_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:uuid/uuid.dart';

class TodoApp extends HookWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = useState<List<TodoModel>>([]);
    final titleTC = useTextEditingController();
    final descriptionTC = useTextEditingController();

    useEffect(() {
      debugPrint("You got ${todos.value.length} todos!");
      return null;
    }, [todos.value]);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Todo App",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey[800]!,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
            child: Container(
                child: Column(
              children: [
                Card(
                  color: Colors.white,
                  shadowColor: Colors.transparent,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        textFormField(controller: titleTC, label: "Title"),
                        const Gap(16),
                        textFormField(
                            controller: descriptionTC, label: "Description"),
                        const Gap(16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            button(
                                onPressed: () {
                                  titleTC.clear();
                                  descriptionTC.clear();
                                },
                                text: "Clear"),
                            button(
                                onPressed: () {
                                  todos.value = [];
                                },
                                text: "Delete all"),
                            button(
                                onPressed: () {
                                  todos.value = [
                                    ...todos.value,
                                    TodoModel(
                                        id: const Uuid().v1(),
                                        title: titleTC.text,
                                        description: descriptionTC.text,
                                        createdAt: DateTime.now(),
                                        deadline: DateTime.now()
                                            .add(const Duration(days: 2)))
                                  ];
                                },
                                text: "Add todo")
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const Gap(20),
                Column(
                  children: todos.value.reversed.map((todo) {
                    return Card(
                      color: Colors.white,
                      child: ListTile(
                        title: Text(todo.title),
                        leading: const Icon(Icons.task),
                        subtitle: Text(todo.description),
                      ),
                    );
                  }).toList(),
                )
              ],
            )),
          ),
        ),
      ),
    );
  }
}

Widget textFormField(
    {required TextEditingController controller, required String label}) {
  return TextFormField(
    controller: controller,
    cursorColor: Colors.grey[700],
    decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey[600]),
        constraints: BoxConstraints.tight(const Size(double.infinity, 56)),
        border: MaterialStateOutlineInputBorder.resolveWith(
            (state) => OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  // color: Colors.grey[400]!,
                  color: Colors.grey[400]!.withOpacity(0.5),
                )))),
  );
}

Widget button({required void Function() onPressed, required String text}) {
  return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              WidgetStateColor.resolveWith((state) => Colors.white),
          overlayColor:
              WidgetStateColor.resolveWith((state) => Colors.grey[200]!),
          shape: WidgetStateProperty.resolveWith((state) =>
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)))),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(color: Colors.grey[700]),
      ));
}
