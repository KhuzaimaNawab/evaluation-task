import 'package:evaluation/data/api/search_game_api.dart';
import 'package:evaluation/theme/color_theme.dart';
import 'package:evaluation/theme/textstyle_theme.dart';
import 'package:evaluation/view/screens/filter_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/blocs/search_box_bloc/seach_bloc_bloc.dart';
import '../widgets/grid_card_widget.dart';
import '../widgets/search_box_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SearchBlocBloc>(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Search',
                    style: AppTextStyles.LargeHeadline.copyWith(
                      color: AppColors.textColorWhite,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => const FilterScreen()),
                        ),
                      );
                    },
                    child: Text(
                      'Filter',
                      style: AppTextStyles.headlineSmall.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SeachBox(),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder(
                  future: SearchGamesAPI().gameAPI(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final data = snapshot.data;
                      return StreamBuilder(
                        stream: bloc.filteredItemsStream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final filteredItems = snapshot.data!;
                            return Expanded(
                              child: GridView.count(
                                shrinkWrap: true,
                                childAspectRatio: (1 / 2),
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                children: List.generate(filteredItems.length,
                                    (index) {
                                  return GridCard(
                                    cardData: data,
                                    index: index,
                                  );
                                }),
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      );
                    } else {
                      return const Center(
                        child: SizedBox(),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
