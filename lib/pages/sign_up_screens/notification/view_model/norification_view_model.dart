
import 'package:flutter/cupertino.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:take_a_look/pages/sign_up_screens/notification/data/models/notification_model.dart';
import 'package:take_a_look/pages/sign_up_screens/notification/data/repo/notification_repo.dart';

class NotificationViewModel extends ChangeNotifier {

  final controller = SlidableController;
  List<NotificationModel> notifications = [];
  static const int _pageSize = 20;
  PagingController<int, NotificationModel> pagingController = PagingController(firstPageKey: 0);

  void init() {
    pagingController.dispose();
    pagingController = PagingController(firstPageKey: 0);
    pagingController.addPageRequestListener((pageKey) {
      getNotifications(0, 10);
    });

  }

  // Future<void> getFollowers(int page, int size) async {
  //   followers = await followRepo.getFollowers(page, size);
  //   final isLastPage = followers.length < _pageSize;
  //   if (isLastPage) {
  //     pagingController.appendLastPage(followers);
  //   } else {
  //     final nextPageKey = page + followers.length;
  //     pagingController.appendPage(followers, nextPageKey);
  //   }
  // }

  Future<void> getNotifications(int page, int size) async {
    notifications = await NotificationRepo.getNotifications(page, size);
    final isLastPage = notifications.length < _pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(notifications);
    } else {
      final nextPageKey = page + notifications.length;
      pagingController.appendPage(notifications, nextPageKey);
    }
  }

}