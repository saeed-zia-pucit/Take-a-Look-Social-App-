
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
    return Consumer<NotificationViewModel>(
      builder: (context, viewModel, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Notification'),
            actions: [
              TextButton(
                onPressed: (){},
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
      }
    );
  }
}
