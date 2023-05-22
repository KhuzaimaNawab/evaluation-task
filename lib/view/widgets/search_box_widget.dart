import 'package:evaluation/data/api/search_game_api.dart';
import 'package:evaluation/theme/color_theme.dart';
import 'package:evaluation/theme/textstyle_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/blocs/search_box_bloc/seach_bloc_bloc.dart';

class SeachBox extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  SeachBox({super.key});
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SearchBlocBloc>(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          const SizedBox(width: 5),
          Container(
            height: 30,
            width: 1,
            color: Colors.grey,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: FutureBuilder(
                future: SearchGamesAPI().gameAPI(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return TextField(
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textColorWhite,
                      ),
                      controller: _searchController,
                      onChanged: (value) {
                        bloc.filterItems(
                            _searchController.text, snapshot.data!);
                      },
                      decoration: InputDecoration(
                        hintStyle: AppTextStyles.headlineSmall.copyWith(
                          color: AppColors.textColorWhite,
                        ),
                        hintText: 'Search your favorite game here...',
                        border: InputBorder.none,
                      ),
                    );
                  } else {
                    return TextField(
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textColorWhite,
                      ),
                      controller: _searchController,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintStyle: AppTextStyles.headlineSmall.copyWith(
                          color: AppColors.textColorWhite,
                        ),
                        hintText: 'Search your favorite game here...',
                        border: InputBorder.none,
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
