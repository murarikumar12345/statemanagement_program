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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Note')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: 300,
                      child: Card(
                        color: Colors.white,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a title';
                            }
                            return null;
                          },
                          controller: titleController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                            hintText: 'Enter Title',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: 300,
                      child: Card(
                        color: Colors.white,
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          maxLines: 5,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a description';
                            }
                            return null;
                          },
                          controller: descController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10),
                            hintText: 'Enter Description',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final newNote = Notemodel(
                          titleController.text,
                          descController.text,
                        );
                        context.read<Notesprovider>().addNote(newNote);
                        Navigator.pop(context);
                      }
                    },
                    child: const Text(
                      'Add Note',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
