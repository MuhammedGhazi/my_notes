import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_notes/features/home/data/models/note_model.dart';
import 'package:my_notes/features/home/data/repos/note_repo_empl.dart';

part 'update_note_state.dart';

class UpdateNoteCubit extends Cubit<UpdateNoteState> {
  UpdateNoteCubit() : super(UpdateNoteInitial());
  Color color = const Color(0xffA0E7E5);
  updateNote({required NoteModel note, required String oldTitle}) {
    NoteRepoEmpl noteRepoEmpl = NoteRepoEmpl();
    noteRepoEmpl.updateNote(note, oldTitle);
    emit(UpdateNoteSuccess());
  }
}
