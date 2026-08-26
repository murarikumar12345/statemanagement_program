import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement_program/provider/provider.dart';
import 'package:statemanagement_program/routes/routes_name.dart';
import '../../model/modellist/notemodel.dart';

class Homenotescreen extends StatefulWidget {
  const Homenotescreen({super.key});

  @override
  State<Homenotescreen> createState() => _HomenotescreenState();
}

class _HomenotescreenState extends State<Homenotescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Consumer<Notesprovider>(
        builder: (context, provider, child) {
          if (provider.Note.isEmpty) {
            return const Center(child: Text('No notes available. Add some!'));
          }
          return ListView.builder(
            itemCount: provider.Note.length,
            itemBuilder: (context, index) {
              final notep = provider.Note[index];
              return ListTile(
                title: Text(notep.title),
                subtitle: Text(notep.dsc), // Fixed: showing description
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    provider.removeNote(notep);
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, RoutesName.addnotes);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
