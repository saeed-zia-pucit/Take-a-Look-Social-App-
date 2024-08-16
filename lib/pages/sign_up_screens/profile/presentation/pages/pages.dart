
import 'package:flutter/cupertino.dart';
import 'package:take_a_look/core/extensions/widget_extension.dart';
import 'package:take_a_look/core/view_model/global_view_model.dart';
import 'package:take_a_look/pages/sign_up_screens/profile/view_model/profile_view_model.dart';
import 'package:take_a_look/pages/sign_up_screens/setup_edit_profile/view_model/setup_edit_profile_view_model.dart';

import '../../../../../core/data/models/user_model.dart';
import '../../../../hair_color_formula_screens/follow/view_model/follow_view_model.dart';
import '../../../../hair_color_formula_screens/wishlist/presentation/pages/pages.dart';
import '../widgets/widgets.dart';
import '/constants/app_colors.dart';
import '/constants/app_images.dart';
import '/constants/app_icons.dart';
import '/core/extensions/number_extension.dart';
import '/core/widgets/avatar_with_radius.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../core/router/router.dart';
import '../../../setup_edit_profile/presentation/pages/pages.dart';

part 'profile_page.dart';