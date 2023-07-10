import 'package:flutter/material.dart';
import 'package:my_notes/features/home/presentaion/views/widgets/notes_View_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: NotesViewBody(),
    );
  }
}
