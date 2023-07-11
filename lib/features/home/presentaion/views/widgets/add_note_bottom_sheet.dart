import 'package:flutter/material.dart';
import 'package:my_notes/features/home/presentaion/views/widgets/custom_text_field.dart';

import 'custom_button.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: SingleChildScrollView(
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
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 28,
            ),
            CustomButton()
          ],
        ),
      ),
    );
  }
}
