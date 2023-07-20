import 'package:flutter/material.dart';
import 'package:my_notes/features/home/data/models/note_model.dart';
import 'package:my_notes/features/home/data/repos/note_repo_empl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NoteRepoEmpl noteRepoEmpl = NoteRepoEmpl();
  NoteModel ahmed =
      NoteModel(title: "ahmed", subtitle: "ghazi", date: "1-1-2016", color: 8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                var respons = await noteRepoEmpl.addNote(ahmed);
                respons.fold((fail) {}, (row) {});
              },
              child: const Text("insert data")),
          ElevatedButton(
              onPressed: () async {
                // var notes = await noteRepoEmpl.getAllNotes();
              },
              child: const Text("read data"))
        ],
      ),
    );
  }
}
