import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:my_notes/features/home/data/models/note_model.dart';
import 'package:my_notes/features/home/data/repos/note_repo_empl.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(this.noteRepoEmpl) : super(NotesInitial());
  final NoteRepoEmpl noteRepoEmpl;
  List<NoteModel>? notes;
  getNotes() async {
    var result = await noteRepoEmpl.getAllNotes();
    result.fold((fail) {
      emit(NotesFailure(fail.toString()));
    }, (trueResult) {
      notes = trueResult;
    });
  }
}
