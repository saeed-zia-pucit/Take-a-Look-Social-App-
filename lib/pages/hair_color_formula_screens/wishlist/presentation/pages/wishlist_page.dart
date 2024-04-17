
import 'package:flutter/material.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/wishlist/presentation/widgets/formula_item.dart';

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
          onPressed: (){},
          icon: const Icon(Icons.sort),
        ),
        title: const Text('Wishlist'),
        actions: [
          IconButton(
            onPressed: (){},
            icon: const Icon(Icons.search),
          )
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            FormulaItem(),
            FormulaItem(),
            FormulaItem(),
            FormulaItem(),
          ],
        ),
      ),
    );
  }
}
