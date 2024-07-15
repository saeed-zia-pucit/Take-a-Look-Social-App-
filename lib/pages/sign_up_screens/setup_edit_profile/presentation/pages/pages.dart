
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' show MediaType;
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/core/extensions/widget_extension.dart';

import '../../../../../core/data/data_source/local/app_local_data.dart';
import '../../../../../core/data/models/user_model.dart';
import '../../../../hair_color_formula_screens/home_feed/presentation/pages/pages.dart';
import '../../../../hair_color_formula_screens/home_feed/view_model/add_portfolio_view_model.dart';
import '../../../profile/view_model/profile_view_model.dart';
import '../../view_model/setup_edit_profile_view_model.dart';
import '/constants/app_colors.dart';
import '/constants/app_images.dart';
import '/core/extensions/number_extension.dart';
import '/core/router/router.dart';
import '/core/widgets/avatar_with_radius.dart';
import '/core/widgets/text_field_with_title.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

part 'setup_edit_profile.dart';