import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Dialogbox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  Dialogbox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.amber[100],
      // ignore: sized_box_for_whitespace
      content: Container(
        height: 130,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task")),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: ElevatedButton(
                    onPressed: onSave,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[200]),
                    child: const Text("Save")),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: ElevatedButton(
                    onPressed: onCancel,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber[200]),
                    child: const Text("Cancel")),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
