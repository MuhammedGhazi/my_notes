import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:my_notes/features/home/data/repos/note_repo_empl.dart';
// import 'package:my_notes/features/home/presentaion/manage/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:my_notes/features/home/presentaion/manage/cubits/delete_note/delete_note_cubit.dart';
import 'package:my_notes/features/home/presentaion/manage/cubits/notes_cubit/notes_cubit.dart';
import 'package:my_notes/features/home/presentaion/views/widgets/notes_View_body.dart';

import 'widgets/add_note_bottom_sheet.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NotesCubit>(
          create: (BuildContext context) => NotesCubit(),
        ),
        BlocProvider<DeleteNoteCubit>(
          create: (BuildContext context) => DeleteNoteCubit(),
        ),
      ],
      child: Scaffold(
        body: const NotesViewBody(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  context: context,
                  builder: (context) {
                    return const AddNoteBottomSheet();
                  });
            },
            child: const Icon(Icons.add)),
      ),
    );
  }
}
