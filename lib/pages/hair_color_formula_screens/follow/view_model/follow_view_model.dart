
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:take_a_look/core/data/models/user_model.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/follow/data/repo/follow_repo.dart';

import '../presentation/pages/pages.dart';

class FollowViewModel extends ChangeNotifier {

  FollowViewModel(this.followRepo);
  final FollowRepo followRepo;

  List<UserModel> followers = [];
  List<UserModel> followings = [];
  List<UserModel> searchedUsers = [];
  TextEditingController searchEditingController = TextEditingController();
  static const int _pageSize = 20;
  PagingController<int, UserModel> pagingController = PagingController(firstPageKey: 0);

  void init(FollowPageType followPageType) {
    pagingController.dispose();
    pagingController = PagingController(firstPageKey: 0);
    if (followPageType.isFollowers) {
      pagingController.addPageRequestListener((pageKey) {
        getFollowers(0, 100);
      });
    } else {
      pagingController.addPageRequestListener((pageKey) {
        getFollowings(0, 100);
      });
    }
  }

  Future<void> getFollowers(int page, int size) async {
    followers = await followRepo.getFollowers(page, size);
    final isLastPage = followers.length < _pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(followers);
    } else {
      final nextPageKey = page + followers.length;
      pagingController.appendPage(followers, nextPageKey);
    }
  }

  Future<void> getFollowings(int page, int size) async {
    followings = await followRepo.getFollowings(page, size);
    final isLastPage = followings.length < _pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(followings);
    } else {
      final nextPageKey = page + followings.length;
      pagingController.appendPage(followings, nextPageKey);
    }
  }

  Future<void> getSearchUser(int page, int size) async {
    print('SEARCH1');
    searchedUsers = await followRepo.getSearchUser(searchEditingController.text.trim(), page, size);
    // searchedUsers = await followRepo.getSearchUser(text, page, size);
    final isLastPage = searchedUsers.length < _pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(searchedUsers);
    } else {
      final nextPageKey = page + searchedUsers.length;
      pagingController.appendPage(searchedUsers, nextPageKey);
    }
  }
  void callSearchUser() {
    print('object');
    searchedUsers.clear();
    pagingController.refresh();
  }

  bool showSearch = false;
  void onTapSearch() {
    searchedUsers.clear();
    pagingController.dispose();
    pagingController = PagingController(firstPageKey: 0);
    pagingController.addPageRequestListener((pageKey) {
      getSearchUser(0, 500);
    });
    showSearch = !showSearch;
    notifyListeners();
  }

}
