
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/constants/app_colors.dart';
import 'package:take_a_look/constants/app_icons.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:take_a_look/core/data/models/user_model.dart';
import 'package:take_a_look/core/extensions/widget_extension.dart';
import 'package:take_a_look/core/router/router.dart';
import 'package:take_a_look/core/view_model/global_view_model.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/follow/presentation/pages/search_users.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/follow/view_model/follow_view_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../../core/data/data_source/local/app_local_data.dart';
import '../../../../../di_service.dart';
import '../../../../sign_up_screens/profile/data/repo/profile_repo.dart';
import '../../data/models/post_model.dart';
import '../../data/repo/feed_repo.dart';
import '../../view_model/feed_view_model.dart';
import '../widgets/widgets.dart';

part 'home_feed.dart';