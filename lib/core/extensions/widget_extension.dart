
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/core/widgets/menu_view.dart';

import '../view_model/global_view_model.dart';

bool menuOpen = false;

extension WidgetExtension on Widget {
  Widget menu(BuildContext context) {
    return Stack(
       children: [
         this,
         if (context.watch<GlobalViewModel>().isMenuOpen)
         const MenuView(),
       ],
    );
  }
}