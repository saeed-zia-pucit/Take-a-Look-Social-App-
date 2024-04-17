
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;

  Widget get statusBarHeightGap => Gap(MediaQuery.of(this).padding.top);
  Widget get bottomHeightGap => Gap(MediaQuery.of(this).padding.bottom);

  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomHeight => MediaQuery.of(this).padding.bottom;

  bool get isKeyboardOpen => MediaQuery.of(this).viewInsets.bottom == 0;
}