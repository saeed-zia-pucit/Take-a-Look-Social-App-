part of 'pages.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    context.read<NotificationViewModel>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationViewModel>(builder: (context, viewModel, _) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Notification'),
          actions: [
            TextButton(
              onPressed: () {
                if (viewModel.notifications.isEmpty) {
                  return;
                }
                deleteNotifications(
                    viewModel.notifications.map((e) => e.id).toList());
                viewModel.pagingController.refresh();
              },
              child: const Text('Delete all'),
            ),
          ],
        ),
        body: PagedListView<int, NotificationModel>(
          pagingController: viewModel.pagingController,
          builderDelegate: PagedChildBuilderDelegate<NotificationModel>(
            itemBuilder: (context, item, index) => const ItemOfNotification(),
          ),
        ),
      );
    });
  }

  Future<void> deleteNotifications(
    List<String> notificationIds,
  ) async {
    final url = Uri.parse('${AppLocalData.BaseURL}/notifications');
    final response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'notificationIds': notificationIds,
      }),
    );

    if (response.statusCode == 200) {
      // Handle success
      print('Notifications deleted successfully');
    } else {
      // Handle error
      print('Failed to delete notifications');
    }
  }
}
