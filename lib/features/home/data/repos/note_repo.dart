import 'package:dartz/dartz.dart';
import 'package:my_notes/core/errors/failures.dart';
import 'package:my_notes/features/home/data/models/note_model.dart';

//we user backage (dartz flutter) for use ethir
abstract class NoteRepo {
  Future<Either<Failure, List<NoteModel>>> getAllNotes();
  Future<int> addNote();
  Future<int> updateNote();
  Future<int> deleteNote();
}
