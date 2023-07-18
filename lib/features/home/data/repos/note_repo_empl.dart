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
      int? done = await db?.insert("notes", noteModel.toMap());
      return (right(done!));
    } on Exception {
      return (left(AnyFailure()));
    }
  }

  @override
  Future<Either<Failure, int>> deleteNote(String title) async {
    try {
      Database? db = await sqls.db;
      return (right(
          await db!.delete("notes", where: "title:?", whereArgs: [title])));
    } catch (e) {
      return (left(AnyFailure()));
    }
  }

  @override
  Future<Either<Failure, List<NoteModel>>> getAllNotes() async {
    try {
      Database? db = await sqls.db;
      List<Map<String, dynamic>> map = await db!.query(
        "notes",
        columns: ["title", "subtitle", "date", "color"],
      );
      List<NoteModel> resultNotes = [];
      for (var i = 0; i < map.length; i++) {
        resultNotes.add(NoteModel.fromMap(map[i]));
      }

      // for (var element in map) {
      //   print(element);
      //   //resultNotes.add(NoteModel.fromMap(element));
      // }
      return (right(resultNotes));
    } catch (e) {
      return (left(AnyFailure()));
    }
  }

  //77777777777777
  Future<Either<Failure, List<Map>>> getAllNotesMap() async {
    try {
      Database? db = await sqls.db;
      List<Map> map = await db!.query(
        "notes",
        columns: ["title", "subtitle", "date", "color"],
      );
      // List<NoteModel> resultNotes = [];
      // for (var element in map) {
      //   resultNotes.add(NoteModel.fromMap(element));
      // }
      return (right(map));
    } catch (e) {
      return (left(AnyFailure()));
    }
  }
  //77777777777

  @override
  Future<Either<Failure, int>> updateNote(NoteModel noteModel) async {
    try {
      Database? db = await sqls.db;
      return (right(await db!.update(
        "notes",
        noteModel.toMap(),
        where: "title:?",
        whereArgs: [noteModel.title],
      )));
    } catch (e) {
      return (left(AnyFailure()));
    }
  }
}
