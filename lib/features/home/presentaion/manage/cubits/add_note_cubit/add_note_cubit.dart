import 'package:flutter/material.dart';
// import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_notes/features/home/data/models/note_model.dart';
import 'package:my_notes/features/home/data/repos/note_repo_empl.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  bool isLoading = false;
  Color color = const Color(0xffA0E7E5);
  addNote(NoteModel noteModel) {
    emit(AddNoteLoading());
    try {
      NoteRepoEmpl noteRepoEmpl = NoteRepoEmpl();
      noteRepoEmpl.addNote(noteModel);
      emit(AddNoteSuccess());
    } on Exception catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
