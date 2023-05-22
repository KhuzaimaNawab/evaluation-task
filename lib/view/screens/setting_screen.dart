import 'package:flutter/material.dart';

import '../../theme/color_theme.dart';
import '../../theme/textstyle_theme.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text('Setting Screen', style: AppTextStyles.LargeHeadline.copyWith(color: AppColors.textColorWhite)),
      ),
    );
  }
}
