import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../data/repo/add_portfolio_repo.dart';

enum ImageSourceOption {
  gallery,
  camera,
}

class AddPortfolioViewModel extends ChangeNotifier {
  AddPortfolioViewModel(this.addPortfolioRepo);

  final AddPortfolioRepo addPortfolioRepo;

  TextEditingController contentController = TextEditingController();
  TextEditingController additionalUrlController = TextEditingController();
  TextEditingController additionalNoteController = TextEditingController();

  File? _selectedImage;

  File? get selectedImage => _selectedImage;

  Future<void> pickImage(ImageSourceOption sourceOption) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: sourceOption == ImageSourceOption.gallery
          ? ImageSource.gallery
          : ImageSource.camera,
    );

    if (pickedFile != null) {
      _selectedImage = File(pickedFile.path);
      notifyListeners();
    }
  }

  void setImage(String imagePath) {
  _selectedImage = File(imagePath);
  notifyListeners();
}
  Future<Response?> postPortfolio() async {
    Response? response = await addPortfolioRepo.postPortfolio(
      _selectedImage,
      contentController.text,
      additionalUrlController.text,
      additionalNoteController.text,
    );
    return response;
  }

  @override
  void dispose() {
    contentController.dispose();
    additionalUrlController.dispose();
    additionalNoteController.dispose();
    super.dispose();
  }
}
