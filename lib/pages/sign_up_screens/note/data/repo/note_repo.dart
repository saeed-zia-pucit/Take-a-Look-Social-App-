import 'package:dio/dio.dart';

import '../../../../../core/data/data_source/local/app_local_data.dart';
import '../../../../../di_service.dart';
import '../models/note_model.dart';

abstract class NoteRepo {
  Future<List<NoteModel?>> getNotes();
  Future<NoteModel?> addNote(NoteModel noteModel);
  Future<void> editNotes(NoteModel noteModel);
  Future<void> deleteNotes(List<NoteModel> notes);
}

class NoteRepoImpl extends NoteRepo {
  NoteRepoImpl(this.dio);
  final Dio dio;

  @override
  Future<List<NoteModel?>> getNotes() async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        '/notes',
        options: Options(
          headers: headerWithAuth(token),
        ),
      );
      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((e) {
          NoteModel noteModel = NoteModel.fromJson(e);

          return noteModel;
        }
        ).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future<NoteModel?> addNote(NoteModel noteModel) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.post(
        '/notes',
        options: Options(
          headers: headerWithAuth(token),
        ),
        data: noteModel.toJsonAddNote,
      );
      if (response.statusCode == 200) {
        return NoteModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> editNotes(NoteModel noteModel) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;

      Response response = await dio.put(
        '/notes/${noteModel.id}',
        options: Options(
          headers: headerWithAuth(token),
        ),
        data: noteModel.toJsonAddNote,
      );
      if (response.statusCode == 200) {}
    } catch (_) {}
  }

  @override
  Future<void> deleteNotes(List<NoteModel> notes) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;

      for (var noteModel in notes) {
        Response response = await dio.delete(
          '/notes/${noteModel.id}',
          options: Options(
            headers: headerWithAuth(token),
          ),
        );
        if (response.statusCode == 200) {}
      }
    } catch (_) {}
  }

}
