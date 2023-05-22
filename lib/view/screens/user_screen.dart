import 'package:evaluation/theme/textstyle_theme.dart';
import 'package:flutter/material.dart';

import '../../theme/color_theme.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text(
          'User Screen',
          style: AppTextStyles.LargeHeadline.copyWith(
              color: AppColors.textColorWhite),
        ),
      ),
    );
  }
}
