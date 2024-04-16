
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/core/extensions/context_extension.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/hair_color/view_model/hair_color_view_model.dart';

class HairColorPage extends StatefulWidget {
  const HairColorPage({super.key});

  @override
  State<HairColorPage> createState() => _HairColorPageState();
}

class _HairColorPageState extends State<HairColorPage> {
  @override
  Widget build(BuildContext context) {
  final read = context.read<HairColorViewModel>();
  final watch = context.watch<HairColorViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          read.pageTitle
        ),
      ),

      body: PageView(),

      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.bottomHeight,
          horizontal: 20,
        ),
        child: ElevatedButton(
          onPressed: (){},
          child: const Text('next'),
        ),
      ),
    );
  }
}
