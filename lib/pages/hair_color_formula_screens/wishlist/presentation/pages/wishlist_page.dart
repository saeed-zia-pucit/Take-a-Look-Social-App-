
part of 'pages.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            // context.read<GlobalViewModel>().menuControl(open: true);
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left),
        ),
        title: const Text('Wishlist'),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.search),
          )
        ],
      ),

      body: const SingleChildScrollView(
        child: Column(
          children: [
            FormulaItem(),
            FormulaItem(),
            FormulaItem(),
            FormulaItem(),
          ],
        ),
      ),
    ).menu(context);
  }
}
