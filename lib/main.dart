import 'package:evaluation/logic/blocs/search_box_bloc/seach_bloc_bloc.dart';
import 'package:evaluation/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/blocs/navigation_cubit/navigation_cubit_cubit.dart';
import 'view/screens/render_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubitCubit(),
        ),
        BlocProvider(
          create: ((context) => SearchBlocBloc()),
        ),
      ],
      child: MaterialApp(
        theme: ThemesTheme.themeDatalight,
        debugShowCheckedModeBanner: false,
        home: const RenderScreen(),
      ),
    );
  }
}
