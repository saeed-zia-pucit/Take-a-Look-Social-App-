import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/home_feed/data/models/comment_response_model.dart';
import '../../../../../core/data/data_source/local/app_local_data.dart';
import '../../../../../di_service.dart';
import '../models/like_feed_model.dart';
import '../models/post_model.dart';

abstract class FeedRepo {
  //User Posts Endpoints
  //get
  Future<List<PostModel>> getFeed(int page, int size);

  Future<List<PostModel>> getDraft(int page, int size);
  Future<List<PostModel>> getSavedPost(int page, int size);

  Future<List<PostModel>> getFeedByID(String postId);

  Future<List<PostModel>> getFeedByUserId(int page, int size, String userId);

  Future<List<PostModel>> getFeedSearch(int page, int size, String query);

  //post

  //delete
  //Post Likes Endpoints
  Future<List<LikeInfo>> getFeedLike(int page, int size, String contentID);

  Future<List<LikeInfo>> getFeedLikeComments(
      int page, int size, String commentId);

  Future<bool> postComment(String postId, String content);

  Future<List<CommentResponse>> getFeedCommentsByPostID(
      int page, int size, String postId);

  Future<bool> deleteComment(String commentId);
}

class FeedRepoImpl extends FeedRepo {
  FeedRepoImpl(this.dio);

  final Dio dio;

  @override
  Future<List<PostModel>> getFeed(int page, int size) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        '${AppLocalData.BaseURL}/feed/post?page=$page&size=$size',
        options: Options(
          headers: headerAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        List data = response.data;
        return data
            .map(
              (e) => PostModel.fromJson(e),
            )
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<PostModel>> getDraft(int page, int size) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        '${AppLocalData.BaseURL}/draft?page=$page&size=$size',
        options: Options(
          headers: headerAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        List data = response.data;
        return data
            .map(
              (e) => PostModel.fromJson(e),
            )
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<PostModel>> getSavedPost(int page, int size) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        '${AppLocalData.BaseURL}/bookmarks?page=$page&size=$size',
        options: Options(
          headers: headerAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        List data = response.data;
        return data
            .map(
              (e) => PostModel.fromJson(e),
            )
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  //not in use till now
  @override
  Future<List<PostModel>> getFeedByID(String postId) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        '/feed/post/$postId',
        options: Options(
          headers: headerWithAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        List data = response.data;
        return data
            .map(
              (e) => PostModel.fromJson(e),
            )
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

//not in use till now
  @override
  Future<List<PostModel>> getFeedByUserId(
      int page, int size, String userId) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        '${AppLocalData.BaseURL}/feed/post/user/$userId?page=$page&size=$size',
        options: Options(
          headers: headerWithAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        List data = response.data;
        return data
            .map(
              (e) => PostModel.fromJson(e),
            )
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<bool> SaveContent(String contentID) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.post(
        '${AppLocalData.BaseURL}/bookmarks',
        options: Options(
          headers: headerAuth(token),
        ),
        data: jsonEncode({
          'postId': contentID,
        }),
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, then the content was successfully liked.
        print('Content was successfully liked.');
        return true;
      } else {
        // If the server returns a response with a status code other than 200, then something went wrong.
        print('Failed to like content. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Failed to like content. Error: $e');
      return false;
    }
  }

  Future<bool> unSaveContent(String contentID) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.delete(
        '${AppLocalData.BaseURL}/bookmarks',
        options: Options(
          headers: headerAuth(token),
        ),
        data: jsonEncode({
          'postId': contentID,
        }),
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, then the content was successfully unliked.
        print('Content was successfully unliked.');
        return true;
      } else {
        // If the server returns a response with a status code other than 200, then something went wrong.
        print('Failed to unlike content. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Failed to unlike content. Error: $e');
      return false;
    }
  }

  Future<bool> likeContent(String contentID) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.post(
        '${AppLocalData.BaseURL}/feed/like/$contentID',
        options: Options(
          headers: headerAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, then the content was successfully liked.
        print('Content was successfully liked.');
        return true;
      } else {
        // If the server returns a response with a status code other than 200, then something went wrong.
        print('Failed to like content. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Failed to like content. Error: $e');
      return false;
    }
  }

  Future<bool> unlikeContent(String contentID) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.delete(
        '${AppLocalData.BaseURL}/feed/like/$contentID',
        options: Options(
          headers: headerAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        // If the server returns a 200 OK response, then the content was successfully unliked.
        print('Content was successfully unliked.');
        return true;
      } else {
        // If the server returns a response with a status code other than 200, then something went wrong.
        print('Failed to unlike content. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Failed to unlike content. Error: $e');
      return false;
    }
  }

  // content like
  @override
  Future<List<LikeInfo>> getFeedLike(
      int page, int size, String contentID) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        '${AppLocalData.BaseURL}/feed/like/$contentID?page=$page&size=$size',
        options: Options(
          headers: headerAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((e) => LikeInfo.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<PostModel>> getFeedSaved(
      int page, int size, String contentID) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        '${AppLocalData.BaseURL}/bookmarks?page=$page&size=$size',
        options: Options(
          headers: headerAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((e) => PostModel.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<bool> postCommentLike(String commentId, String content) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      final response = await dio.post(
        '${AppLocalData.BaseURL}/feed/like/comment/$commentId',
        options: Options(
          headers: headerAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        print('Comment posted successfully');
        return true;
      } else {
        print('Failed to post comment. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Failed to post comment. Error: $e');
      return false;
    }
  }

  Future<bool> deleteCommentLike(String commentId, String content) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      final response = await dio.delete(
        '${AppLocalData.BaseURL}/feed/like/comment/$commentId',
        options: Options(
          headers: headerAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        print('Comment posted successfully');
        return true;
      } else {
        print('Failed to post comment. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Failed to post comment. Error: $e');
      return false;
    }
  }

  //comments like
  @override
  Future<List<LikeInfo>> getFeedLikeComments(
      int page, int size, String commentId) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        '${AppLocalData.BaseURL}/feed/like/comment/$commentId?page=$page&size=$size',
        options: Options(
          headers: headerAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        List data = response.data;
        return data.map((e) => LikeInfo.fromJson(e)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

//post content comments

  @override
  Future<List<PostModel>> getFeedSearch(
    int page,
    int size,
    String query,
  ) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        '/feed/post/search?query=$query&page=$page&size=$size',
        options: Options(
          headers: headerWithAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        List data = response.data;
        return data
            .map(
              (e) => PostModel.fromJson(e),
            )
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<bool> postComment(String postId, String content) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      final response = await dio.post(
        '${AppLocalData.BaseURL}/feed/comment/$postId',
        options: Options(
          headers: headerAuth(token),
        ),
        data: {
          'postId': postId,
          'content': content,
        },
      );

      if (response.statusCode == 200) {
        print('Comment posted successfully');
        return true;
      } else {
        print('Failed to post comment. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Failed to post comment. Error: $e');
      return false;
    }
  }

  @override
  Future<List<CommentResponse>> getFeedCommentsByPostID(
      int page, int size, String postId) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      Response response = await dio.get(
        '${AppLocalData.BaseURL}/feed/comment/$postId?page=$page&size=$size',
        options: Options(
          headers: headerAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        List data = response.data;
        return data
            .map(
              (e) => CommentResponse.fromJson(e),
            )
            .toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  Future<bool> deleteComment(String commentId) async {
    try {
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;
      final response = await dio.delete(
        '${AppLocalData.BaseURL}/feed/comment/$commentId',
        options: Options(
          headers: headerAuth(token),
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        print('Failed to delete comment. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Failed to delete comment. Error: $e');
      return false;
    }
  }
}
