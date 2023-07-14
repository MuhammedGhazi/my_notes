import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_notes/features/home/presentaion/manage/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:my_notes/features/home/presentaion/views/widgets/custom_text_field.dart';

import 'add_note_form.dart';
import 'custom_button.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: SingleChildScrollView(
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteSuccess) {
              Navigator.of(context).pop();
            }
            if (state is AddNoteFailure) {
              print("failure is : ${state.errMessage}");
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddNoteLoading ? true : false,
                child: const AddNoteForm());
          },
        ),
      ),
    );
  }
}
