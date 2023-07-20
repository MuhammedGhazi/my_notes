import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:my_notes/features/home/data/models/note_model.dart';
import 'package:my_notes/features/home/data/repos/note_repo_empl.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;
  getNotes() async {
    NoteRepoEmpl noteRepoEmpl = NoteRepoEmpl();
    var result = await noteRepoEmpl.getAllNotes();
    notes = result;
    // result.fold((fail) {
    emit(SuccessNotes());
    // }, (trueResult) {
    //   notes = trueResult;
    // });
  }
}
