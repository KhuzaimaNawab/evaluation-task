import 'package:evaluation/theme/color_theme.dart';
import 'package:evaluation/theme/textstyle_theme.dart';
import 'package:evaluation/utils/dropdown_menu_items.dart';
import 'package:evaluation/view/widgets/navigation_bar_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_drop_down_widget.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        leadingWidth: 40,
        title: Text(
          'Filters',
          style: AppTextStyles.LargeHeadline,
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Image.asset(
            'assets/backArrow.png',
            width: 20,
            height: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Column(
            children:const [
              SizedBox(
                height: 20,
              ),
              ExpandableDropdown(
                  items: DropDownItems.platFormsItems,
                  image: 'assets/ps.png',
                  textfieldName: 'Platforms'),
              SizedBox(
                height: 20,
              ),
              ExpandableDropdown(
                  items: DropDownItems.featuresItems,
                  image: 'assets/feature.png',
                  textfieldName: 'Features'),
              SizedBox(
                height: 20,
              ),
              ExpandableDropdown(
                  items: DropDownItems.genresItems,
                  image: 'assets/genre.png',
                  textfieldName: 'Genres'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavBarWidget(),
    );
  }
}
