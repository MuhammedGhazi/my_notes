import 'package:flutter/material.dart';
import 'package:my_notes/features/home/presentaion/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        children: const [
          CustomTextField(
            hint: "title note",
            maxline: 1,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            hint: "containt note",
            maxline: 4,
          )
        ],
      ),
    );
  }
}