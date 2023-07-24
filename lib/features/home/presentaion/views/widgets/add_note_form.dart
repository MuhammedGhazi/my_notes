import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_notes/core/constantes.dart';
import 'package:my_notes/features/home/data/models/note_model.dart';
import 'package:my_notes/features/home/presentaion/manage/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:my_notes/features/home/presentaion/manage/cubits/notes_cubit/notes_cubit.dart';

import 'color_item.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: "title note",
            maxline: 1,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subtitle = value;
            },
            hint: "containt note",
            maxline: 4,
          ),
          const SizedBox(
            height: 24,
          ),
          const SizedBox(height: 48 * 2, child: AddNoteListColors()),
          const SizedBox(
            height: 24,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoadin: state is AddNoteLoading,
                onTap: () {
                  var currentDate = DateTime.now();
                  String formatedCurrentDate =
                      DateFormat("dd-MM-yyyy").format(currentDate);
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    NoteModel noteModel = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date: formatedCurrentDate,
                        color:
                            BlocProvider.of<AddNoteCubit>(context).color.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    BlocProvider.of<NotesCubit>(context).getNotes();
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class AddNoteListColors extends StatefulWidget {
  const AddNoteListColors({super.key});

  @override
  State<AddNoteListColors> createState() => _AddNoteListColorsState();
}

class _AddNoteListColorsState extends State<AddNoteListColors> {
  int courntIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            courntIndex = index;
            BlocProvider.of<AddNoteCubit>(context).color =
                Color(kListColors[index]);
            setState(() {});
          },
          child: ColorItem(
            isChacked: courntIndex == index,
            indexColors: index,
          ),
        );
      },
    );
  }
}
