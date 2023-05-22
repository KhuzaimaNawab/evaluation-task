import 'package:evaluation/theme/color_theme.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../data/model/game_card_model.dart';
import '../../theme/textstyle_theme.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    super.key,
    this.cardData,
    required this.index,
  });

  final List<GameCardModel>? cardData;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            cardData![index].image,
            height: 210,
            fit: BoxFit.cover,
          ),
        ),
        Transform.translate(
          offset: const Offset(0, -2),
          child: Padding(
            padding: const EdgeInsets.only(right: 2),
            child: Neumorphic(
              style: NeumorphicStyle(
                  shape: NeumorphicShape.convex,
                  boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                  depth: -3,
                  lightSource: LightSource.topLeft,
                  color: Colors.transparent),
              child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      cardData![index].title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textColorWhite,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: SizedBox(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: cardData![index].details.length,
                                itemBuilder: (context, int) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 2),
                                    child: Chip(
                                      padding: const EdgeInsets.all(0),
                                      backgroundColor: const Color(0xFF316BFF),
                                      label: Text(
                                        cardData![index].details[int],
                                        style: AppTextStyles.headlineSmall
                                            .copyWith(
                                          color: AppColors.textColorWhite,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
