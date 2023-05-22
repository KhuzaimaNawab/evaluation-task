import 'package:evaluation/theme/color_theme.dart';
import 'package:flutter/material.dart';
import '../../theme/textstyle_theme.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(child: Text('Game Screen',style: AppTextStyles.LargeHeadline.copyWith(color: AppColors.textColorWhite)),),
    );
  }
}