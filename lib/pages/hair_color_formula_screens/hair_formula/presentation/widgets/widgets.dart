
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/rendering.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/core/extensions/context_extension.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_images.dart';
import '../../../../../core/router/router.dart';
import '../../../hair_color/data/models/color_model.dart';
import '../../../home_feed/presentation/pages/pages.dart';
import '../../../home_feed/view_model/add_portfolio_view_model.dart';

part 'hair_items.dart';
part 'hair_view.dart';
part 'selected_colors.dart';