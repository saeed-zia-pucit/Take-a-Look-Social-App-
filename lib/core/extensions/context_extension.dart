
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;

  Widget get statusBarHeight => Gap(MediaQuery.of(this).padding.top);

  // bool get isKeyboardOpen => WidgetsBinding.instance.window.viewInsets.bottom == 0;
  // bool get isKeyboardOpen => View.of(this).viewInsets.bottom == 0;
  bool get isKeyboardOpen => MediaQuery.of(this).viewInsets.bottom == 0;
}