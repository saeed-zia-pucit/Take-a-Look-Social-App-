
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:take_a_look/pages/sign_up_screens/notification/data/models/notification_model.dart';
import 'package:take_a_look/pages/sign_up_screens/notification/view_model/norification_view_model.dart';

import '../../../../../core/data/data_source/local/app_local_data.dart';
import '../widgets/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

part 'notification_page.dart';