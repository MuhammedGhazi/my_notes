import 'package:my_notes/core/services/sqflite_service.dart';
import 'package:my_notes/features/home/data/models/note_model.dart';
import 'package:my_notes/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_notes/features/home/data/repos/note_repo.dart';
import 'package:sqflite/sqflite.dart';

class NoteRepoEmpl extends NoteRepo {
  SqfliteService sqls = SqfliteService();
  @override
  Future<Either<Failure, int>> addNote(NoteModel noteModel) async {
    try {
      Database? db = await sqls.db;
      int? done = await db?.insert("table", noteModel.toMap());
      return (right(done!));
    } on Exception catch (e) {
      return (left(AnyFailure()));
    }
  }

  @override
  Future<Either<Failure, int>> deleteNote(String title) async {
    try {
      Database? db = await sqls.db;
      return (right(
          await db!.delete("table", where: "title:?", whereArgs: [title])));
    } catch (e) {
      return (left(AnyFailure()));
    }
  }

  @override
  Future<Either<Failure, List<NoteModel>>> getAllNotes() async {
    try {
      Database? db = await sqls.db;
      List<Map> map = await db!.query(
        "table",
        columns: ["title", "subtitle", "date", "color"],
      );
      List<NoteModel> resultNotes = [];
      for (var element in map) {
        resultNotes.add(NoteModel.fromMap(element));
      }
      return (right(resultNotes));
    } catch (e) {
      return (left(AnyFailure()));
    }
  }

  @override
  Future<Either<Failure, int>> updateNote(NoteModel noteModel) async {
    try {
      Database? db = await sqls.db;
      return (right(await db!.update(
        "table",
        noteModel.toMap(),
        where: "title:?",
        whereArgs: [noteModel.title],
      )));
    } catch (e) {
      return (left(AnyFailure()));
    }
  }
}
