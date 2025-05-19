import 'package:flutter/material.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Form(
            child: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title"),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Write the title",
                label: Text("Title"),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
            Text("Description"),
            TextFormField(
              minLines: 6,
              maxLines: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Write the description",
                label: Text("Description"),
                floatingLabelBehavior: FloatingLabelBehavior.never,
              ),
            ),
            Row(
              spacing: 20,
              children: [
                FilledButton.tonal(
                  onPressed: () {},
                  child: Text("Add"),
                ),
                FilledButton.tonal(
                  onPressed: () {},
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: FilledButton.styleFrom(backgroundColor: Colors.red),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
