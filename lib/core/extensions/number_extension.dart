
import 'package:flutter/material.dart';

extension NumberExtension on num {
  double hp(context) => MediaQuery.sizeOf(context).height * this;
  double wp(context) => MediaQuery.sizeOf(context).width * this;

  double h(BuildContext context) => this / 1000 * MediaQuery.sizeOf(context).height;
  double w(BuildContext context) => this / 1000 * MediaQuery.sizeOf(context).width;
}