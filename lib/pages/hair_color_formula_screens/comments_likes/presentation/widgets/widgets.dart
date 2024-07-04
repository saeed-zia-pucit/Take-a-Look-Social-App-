
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gap/gap.dart';
import 'package:take_a_look/constants/app_colors.dart';
import 'package:take_a_look/constants/app_images.dart';
import 'package:take_a_look/core/widgets/avatar_with_size.dart';
import 'package:take_a_look/core/widgets/slidable_delete_button.dart';
import 'package:take_a_look/pages/hair_color_formula_screens/home_feed/data/models/comment_response_model.dart';

import '../../../../../core/data/models/user_model.dart';
import '../../../../../di_service.dart';
import '../../../../sign_up_screens/profile/data/repo/profile_repo.dart';
import '../../../home_feed/data/models/like_feed_model.dart';
import '../../../home_feed/data/repo/feed_repo.dart';

part 'comment_item.dart';