import 'package:flutter/material.dart';
import 'package:my_notes/features/home/presentaion/views/widgets/custom_app_bar.dart';

import 'list_view_item.dart';
import 'note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          SizedBox(height: 50),
          CustomAppBar(),
          Expanded(child: ListViewNotes()),
        ],
      ),
    );
  }
}
