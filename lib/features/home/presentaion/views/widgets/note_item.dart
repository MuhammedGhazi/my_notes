import 'package:flutter/material.dart';
import 'package:my_notes/features/home/data/models/note_model.dart';
import 'package:my_notes/features/home/presentaion/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const EditNoteView(),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
              color: Color(note.color),
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12),
                child: ListTile(
                  title: Text(
                    note.title,
                    style: const TextStyle(color: Colors.black, fontSize: 32),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Text(note.subtitle,
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 20)),
                  ),
                  trailing: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black54,
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                child: Text(note.date,
                    style:
                        const TextStyle(color: Colors.black54, fontSize: 14)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
