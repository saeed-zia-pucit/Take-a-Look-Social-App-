
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/core/extensions/widget_extension.dart';
import 'package:take_a_look/core/view_model/global_view_model.dart';
import '../../../../../constants/app_colors.dart';
import '../../../../../core/data/data_source/local/app_local_data.dart';
import '../../../../../core/data/models/user_model.dart';
import '../../../../../di_service.dart';
import '../../../../sign_up_screens/profile/data/repo/profile_repo.dart';
import '../../../home_feed/data/models/post_model.dart';
import '../../../home_feed/data/repo/feed_repo.dart';
import '../../../home_feed/presentation/pages/pages.dart';
import '../../../home_feed/presentation/widgets/widgets.dart';
import '../widgets/widgets.dart';

part 'wishlist_page.dart';
part 'wish_list.dart';