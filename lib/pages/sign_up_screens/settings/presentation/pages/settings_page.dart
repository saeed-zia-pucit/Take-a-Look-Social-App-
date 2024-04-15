
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:take_a_look/constants/app_colors.dart';
import 'package:take_a_look/constants/app_svg.dart';
import 'package:take_a_look/core/extensions/number_extension.dart';
import 'package:take_a_look/core/router/router.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'App Notification',
                      style: GoogleFonts.nunito(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Switch(
                      onChanged: (_){},
                      value: true,
                    )
                  ],
                ),
              ),
              TextButton(
                onPressed: () => context.push(RouteNames.changePsw),
                child: Text(
                  'Change Password',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TextButton(
                onPressed: (){},
                child: Text(
                  'Geo Radius',
                  style: GoogleFonts.nunito(
                    fontSize: 16,
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Center(child: SvgPicture.asset(AppSVG.firstOnboard_2, height: .4.hp(context),))
        ],
      ),
    );
  }
}
