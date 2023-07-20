import 'package:dartz/dartz.dart';
import 'package:my_notes/core/errors/failures.dart';
import 'package:my_notes/features/home/data/models/note_model.dart';

//we user backage (dartz flutter) for use ethir
abstract class NoteRepo {
  Future<List<NoteModel>> getAllNotes();
  Future<Either<Failure, int>> addNote(NoteModel noteModel);
  Future<Either<Failure, int>> updateNote(NoteModel noteModel);
  Future<Either<Failure, int>> deleteNote(String title);
}
