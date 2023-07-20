import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_notes/features/home/data/repos/note_repo_empl.dart';

part 'delete_note_state.dart';

class DeleteNoteCubit extends Cubit<DeleteNoteState> {
  DeleteNoteCubit() : super(DeleteNoteInitial());

  deletNote({required String title}) {
    NoteRepoEmpl noteRepoEmpl = NoteRepoEmpl();
    noteRepoEmpl.deleteNote(title);
    emit(DeleteNoteSuccess());
  }
}
