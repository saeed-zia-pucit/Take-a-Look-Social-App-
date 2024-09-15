import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:take_a_look/di_service.dart';
import 'package:http_parser/http_parser.dart' show MediaType;
import '../../../../../core/data/data_source/local/app_local_data.dart';

abstract class AddPortfolioRepo {
  Future<Response?> postPortfolio(File? image, String content,
      String additionalUrl, String additionalNote, String selectedCategory);

  Future<Response?> updatePortfolio(String postId,File? image, String content,
      String additionalUrl, String additionalNote, String selectedCategory);

  Future<Response?> postDraft(File? image, String content, String additionalUrl,
      String additionalNote, String selectedCategory);
}

class AddPortfolioRepoImpl extends AddPortfolioRepo {
  AddPortfolioRepoImpl(this.dio);

  final Dio dio;

  Future<Response?> postPortfolio(
      File? image,
      String content,
      String additionalUrl,
      String additionalNote,
      String selectedCategory) async {
    try {
      // Update token
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;

      // Create post map
      final post = {
        'content': content,
        'additionalUrl': additionalUrl,
        'additionalNote': additionalNote,
        'postCategory': selectedCategory.toUpperCase(),
      };
      print(selectedCategory.toUpperCase());

      // Create MultipartFile from image
      final imageMapping = await MultipartFile.fromFile(
        image!.path,
        filename: image.path.split('/').last,
        contentType: MediaType('image', 'png'),
      );

      // Create FormData
      FormData formData = FormData.fromMap({
        'post': MultipartFile.fromString(
          json.encode(post),
          contentType: MediaType('application', 'json'),
        ),
        'file': imageMapping,
      });
      // Send POST request
      Response response = await dio.post(
        '${AppLocalData.BaseURL}/feed/post',
        data: formData,
        options: Options(
          headers: {
            'Accept': '*/*',
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      print(response);
      if (response.statusCode == 200) {
        print('Post successful');
      } else {
        print('Post failed with status: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  @override
  Future<Response?> updatePortfolio(
      String postId,
      File? image,
      String content,
      String additionalUrl,
      String additionalNote,
      String selectedCategory) async {
    try {
      // Update token
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;

      // Create post map
      final post = {
        'content': content,
        'additionalUrl': additionalUrl,
        'additionalNote': additionalNote,
        'postCategory': selectedCategory.toUpperCase(),
      };
      print(selectedCategory.toUpperCase());

      // Create MultipartFile from image
      late var imageMapping;
      if(image!=null){
         imageMapping = await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
          contentType: MediaType('image', 'png'),
        );
      }


      // Create FormData
      late FormData formData;
      if(image!=null){
        formData = FormData.fromMap({
          'post': MultipartFile.fromString(
            json.encode(post),
            contentType: MediaType('application', 'json'),
          ),
          'file': imageMapping,
        });
      }
      else{
        formData = FormData.fromMap({
          'post': MultipartFile.fromString(
            json.encode(post),
            contentType: MediaType('application', 'json'),
          ),

        });
      }

      // Send POST request
      Response response = await dio.put(
        '${AppLocalData.BaseURL}/feed/post/$postId',
        data: formData,
        options: Options(
          headers: {
            'Accept': '*/*',
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      print(response);
      if (response.statusCode == 200) {
        print('Post successful');
      } else {
        print('Post failed with status: ${response.statusCode}');
      }
      return response;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<Response?> postDraft(File? image, String content, String additionalUrl,
      String additionalNote, String selectedCategory) async {
    try {
      // Update token
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;

      // Create post map
      final post = {
        'content': content,
        'additionalUrl': additionalUrl,
        'additionalNote': additionalNote,
        'postCategory': selectedCategory.toUpperCase(),
      };

      // Create MultipartFile from image
      final imageMapping = await MultipartFile.fromFile(
        image!.path,
        filename: image.path.split('/').last,
        contentType: MediaType('image', 'jpeg'),
      );

      // Create FormData
      FormData formData = FormData.fromMap({
        'post': MultipartFile.fromString(
          json.encode(post),
          contentType: MediaType('application', 'json'),
        ),
        'file': imageMapping,
      });
      // Send POST request
      Response response = await dio.post(
        '${AppLocalData.BaseURL}/draft',
        data: formData,
        options: Options(
          headers: {
            'Accept': '*/*',
            'Authorization': 'Bearer $token',
            // 'Content-Type': 'multipart/form-data',
            'Content-Type': 'application/json',
          },
        ),
      );

      print(response);
      if (response.statusCode == 200) {
        print('Post successful');
      } else {
        print('Post failed with status: ${response.statusCode}');
      }
      return response;
    } on DioError catch (e) {
      // Handle DioError
        print('Unexpected error: ${e.message}');

    } catch (e) {
      // Handle any other type of error

      print('Unexpected error: $e');
  }}
}
