import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.amber[200], borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12, bottom: 12),
              child: ListTile(
                title: const Text(
                  "Flutter title",
                  style: TextStyle(color: Colors.black, fontSize: 32),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Text("welcome with you in my programin world.",
                      style: TextStyle(color: Colors.black54, fontSize: 20)),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.black54,
                    )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              child: Text("may 21,2023",
                  style: TextStyle(color: Colors.black54, fontSize: 14)),
            )
          ],
        ),
      ),
    );
  }
}
