import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/core/constantes.dart';
import 'package:my_notes/features/home/data/models/note_model.dart';
import 'package:my_notes/features/home/presentaion/manage/cubits/notes_cubit/notes_cubit.dart';
import 'package:my_notes/features/home/presentaion/manage/cubits/update_note/update_note_cubit.dart';
import 'package:my_notes/features/home/presentaion/views/widgets/custom_app_bar.dart';
import 'package:my_notes/features/home/presentaion/views/widgets/custom_text_field.dart';

import 'widgets/color_item.dart';

class EditNoteView extends StatefulWidget {
  const EditNoteView({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<UpdateNoteCubit, UpdateNoteState>(
        listener: (context, state) {
          if (state is UpdateNoteSuccess) {
            BlocProvider.of<NotesCubit>(context).getNotes();
            Navigator.pop(context);
          }
        },
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            CustomAppBar(
              onPressed: () {
                String oldTitle = widget.note.title;
                widget.note.title = title ?? widget.note.title;
                widget.note.subtitle = subtitle ?? widget.note.subtitle;
                widget.note.color =
                    BlocProvider.of<UpdateNoteCubit>(context).color.value;
                // print(oldTitle);
                // print(widget.note.title);
                BlocProvider.of<UpdateNoteCubit>(context)
                    .updateNote(note: widget.note, oldTitle: oldTitle);
              },
              title: "edit note",
              icon: Icons.edit,
            ),
            const SizedBox(
              height: 18,
            ),
            CustomTextField(
              hint: widget.note.title,
              maxline: 1,
              onChanged: (p0) {
                title = p0;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              hint: widget.note.subtitle,
              maxline: 4,
              onChanged: (p0) {
                subtitle = p0;
              },
            ),
            const SizedBox(
              height: 8,
            ),
            const UpdateNoteListColors()
          ],
        ),
      ),
    );
  }
}

class UpdateNoteListColors extends StatefulWidget {
  const UpdateNoteListColors({super.key});

  @override
  State<UpdateNoteListColors> createState() => _UpdateNoteListColorsState();
}

class _UpdateNoteListColorsState extends State<UpdateNoteListColors> {
  int courntIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48 * 2,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              courntIndex = index;

              BlocProvider.of<UpdateNoteCubit>(context).color =
                  Color(kListColors[index]);
              setState(() {});
            },
            child: ColorItem(
              isChacked: courntIndex == index,
              indexColors: index,
            ),
          );
        },
      ),
    );
  }
}
