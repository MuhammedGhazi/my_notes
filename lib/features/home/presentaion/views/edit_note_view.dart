import 'package:flutter/material.dart';
import 'package:my_notes/features/home/presentaion/views/widgets/custom_app_bar.dart';
import 'package:my_notes/features/home/presentaion/views/widgets/custom_text_field.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          CustomAppBar(
            title: "edit note",
            icon: Icons.edit,
          ),
          SizedBox(
            height: 18,
          ),
          CustomTextField(hint: "title", maxline: 1),
          SizedBox(
            height: 16,
          ),
          CustomTextField(hint: "content", maxline: 4),
        ],
      ),
    );
  }
}
