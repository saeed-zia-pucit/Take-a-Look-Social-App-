import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:take_a_look/di_service.dart';
import 'package:http_parser/http_parser.dart' show MediaType;
import '../../../../../core/data/data_source/local/app_local_data.dart';

abstract class AddPortfolioRepo {
  Future<Response?> postPortfolio(File? image, String content, String additionalUrl, String additionalNote);
}

class AddPortfolioRepoImpl extends AddPortfolioRepo {
  AddPortfolioRepoImpl(this.dio);
  final Dio dio;

  Future<Response?> postPortfolio(File? image, String content, String additionalUrl, String additionalNote) async {
    try {
      // Update token
      await AppLocalData.updateToken();
      final token = await AppLocalData.getUserToken;

      // Create post map
      final post = {
        'content': content,
        'additionalUrl': additionalUrl,
        'additionalNote': additionalNote,
      };

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

}
