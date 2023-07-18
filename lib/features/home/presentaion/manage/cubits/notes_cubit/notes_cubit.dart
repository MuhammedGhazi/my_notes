import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:my_notes/core/errors/failures.dart';
import 'package:my_notes/features/home/data/models/note_model.dart';
import 'package:my_notes/features/home/data/repos/note_repo_empl.dart';
import 'package:my_notes/features/home/presentaion/manage/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:sqflite/sqflite.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(this.noteRepoEmpl) : super(NotesInitial());
  final NoteRepoEmpl noteRepoEmpl;
  Future<void> getNotes() async {
    emit(NotesLoading());
    var result = await noteRepoEmpl.getAllNotes();
    result.fold((fail) {
      emit(NotesFailure(fail.toString()));
    }, (notes) {
      emit(NotesSuccess(notes));
    });
  }
}
