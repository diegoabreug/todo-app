import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key, this.onSave, this.onCancel, required this.controller});

  final TextEditingController controller;
  final void Function()? onSave;
  final void Function()? onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyButton(
                    buttonText: "Save",
                    onPressed: onSave
                ),
                MyButton(
                    buttonText: "Cancel",
                    onPressed: onCancel
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


