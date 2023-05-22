// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:evaluation/logic/blocs/search_box_bloc/seach_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../data/api/search_game_api.dart';
import '../../theme/color_theme.dart';
import '../../theme/textstyle_theme.dart';

class ExpandableDropdown extends StatefulWidget {
  final List<String> items;
  final String image;
  final String textfieldName;
  const ExpandableDropdown({
    Key? key,
    required this.items,
    required this.image,
    required this.textfieldName,
  }) : super(key: key);
  @override
  _ExpandableDropdownState createState() => _ExpandableDropdownState();
}

class _ExpandableDropdownState extends State<ExpandableDropdown>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SearchBlocBloc>(context);
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: _toggleExpanded,
        child: Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.convex,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(10)),
            depth: 1,
            lightSource: LightSource.right,
            color: Colors.transparent,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    Image.asset(widget.image),
                    const SizedBox(width: 9),
                    Text(
                      widget.textfieldName,
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textColorWhite,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      _isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: const Color(0xFFFF7618),
                      size: 32,
                    ),
                  ],
                ),
              ),
              SizeTransition(
                sizeFactor: _animation,
                child: FutureBuilder(
                    future: SearchGamesAPI().gameAPI(),
                    builder: (context, snapshot) {
                      return Column(
                        children: widget.items.map((e) {
                          return InkWell(
                            onTap: () {
                              bloc.searchByTags(e, snapshot.data!);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 1,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.white.withOpacity(0.3),
                                        Colors.transparent,
                                      ],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 16,
                                  ),
                                  child: Text(
                                    e,
                                    style: AppTextStyles.bodyMedium.copyWith(
                                      color: AppColors.textColorWhite,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
