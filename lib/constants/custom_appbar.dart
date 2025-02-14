import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hiring_task_fawad/constants/text_styles.dart';
import 'package:get/get.dart';

import '../generated/assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;

  const CustomAppBar({super.key, required this.title, this.showBackButton = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: showBackButton == true
          ? InkWell(
              onTap: () => Get.back(),
              child: SvgPicture.asset(Assets.svgPicturesAppbarBackButton, fit: BoxFit.scaleDown),
            )
          : null,
      title: Text(title, style: MyTextStyle.f24W400(context, fontWeight: FontWeight.w500, fontFamily: 'PlayfairFont')),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
