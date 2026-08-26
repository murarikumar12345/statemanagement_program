import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_program/model/modellist/notemodel.dart';
import 'package:statemanagement_program/provider/provider.dart';

class Addnotesscreen extends StatefulWidget {
  const Addnotesscreen({super.key});

  @override
  State<Addnotesscreen> createState() => _AddnotesscreenState();
}

class _AddnotesscreenState extends State<Addnotesscreen> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Note')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Enter Title'),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: descController,
              decoration: const InputDecoration(hintText: 'Enter Description'),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty && descController.text.isNotEmpty) {
                  final newNote = Notemodel(titleController.text, descController.text);
                  context.read<Notesprovider>().addNote(newNote);
                  Navigator.pop(context);
                }
              },
              child: const Text('Add Note'),
            ),
          ],
        ),
      ),
    );
  }
}
