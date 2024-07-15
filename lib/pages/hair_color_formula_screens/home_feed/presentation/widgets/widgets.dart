import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/core/extensions/context_extension.dart';
import 'package:http/http.dart' as http;

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/app_icons.dart';
import '../../../../../constants/app_images.dart';
import '../../../../../core/data/data_source/local/app_local_data.dart';
import '../../../../../core/data/models/user_model.dart';
import '../../../../../core/router/router.dart';
import '../../../../../core/widgets/avatar_with_size.dart';
import '../../../../../di_service.dart';
import '../../../../sign_up_screens/profile/data/repo/profile_repo.dart';
import '../../../../sign_up_screens/profile/presentation/pages/pages.dart';
import '../../../comments_likes/presentation/pages/pages.dart';
import '../../data/models/like_feed_model.dart';
import '../../data/models/post_model.dart';
import '../../data/repo/add_portfolio_repo.dart';
import '../../data/repo/feed_repo.dart';
import '../../view_model/add_portfolio_view_model.dart';
import '../pages/pages.dart';

part 'add_portfolio.dart';

part 'location_view.dart';

part 'post_author.dart';

part 'post_content.dart';

part 'post_item.dart';

part 'post_like_comment.dart';

part 'tab_bar_view.dart';
