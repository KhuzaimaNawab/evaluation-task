import 'package:flutter/material.dart';

import '../../theme/color_theme.dart';
import '../../theme/textstyle_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Text('Home Screen',style: AppTextStyles.LargeHeadline.copyWith(color: AppColors.textColorWhite)),
      ),
    );
  }
}
