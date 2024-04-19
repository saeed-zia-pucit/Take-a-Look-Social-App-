
part of 'pages.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
        actions: [
          TextButton(
            onPressed: (){},
            child: const Text('Delete all'),
          )
        ],
      ),
      body: const Column(
        children: [
          ItemOfNotification(),
          ItemOfNotification(),
          ItemOfNotification(),
          ItemOfNotification(),
        ],
      ),
    );
  }
}
