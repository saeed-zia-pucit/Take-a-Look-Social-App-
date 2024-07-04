import 'package:flutter/cupertino.dart';

import '../data/models/post_model.dart';
import '../data/repo/feed_repo.dart';

class FeedViewModel extends ChangeNotifier {
  FeedViewModel(this._feedRepo);

  final FeedRepoImpl _feedRepo;

  List<PostModel>? _posts;

  List<PostModel>? get posts => _posts;

  Future<void> fetchFeed(int page, int size) async {
    _posts = await _feedRepo.getFeed(page, size);
    notifyListeners();
  }
}