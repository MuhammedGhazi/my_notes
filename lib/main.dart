import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/features/home/presentaion/manage/cubits/update_note/update_note_cubit.dart';
//import 'package:my_notes/features/home/presentaion/manage/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:my_notes/features/home/presentaion/manage/simple_bloc_observer.dart';
import 'package:my_notes/features/home/presentaion/views/notes_view.dart';

import 'features/home/presentaion/manage/cubits/add_note_cubit/add_note_cubit.dart';
import 'features/home/presentaion/manage/cubits/delete_note/delete_note_cubit.dart';
import 'features/home/presentaion/manage/cubits/notes_cubit/notes_cubit.dart';

//import 'features/home/presentaion/views/home.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});
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
        BlocProvider<AddNoteCubit>(
          create: (BuildContext context) => AddNoteCubit(),
        ),
        BlocProvider<UpdateNoteCubit>(
          create: (BuildContext context) => UpdateNoteCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home: const NotesView(),
      ),
    );
  }
}
