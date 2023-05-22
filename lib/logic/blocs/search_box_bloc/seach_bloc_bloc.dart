import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evaluation/data/model/game_card_model.dart';

part 'seach_bloc_event.dart';
part 'seach_bloc_state.dart';

class SearchBlocBloc extends Bloc<SearchBlocEvent, SeachBlocState> {
  SearchBlocBloc() : super(SeachBlocInitial());
  final _searchController = StreamController<List>.broadcast();
  List<GameCardModel> filteredItems = [];

  Stream<List> get filteredItemsStream =>
      _searchController.stream.asBroadcastStream();

  void filterItems(String search, List<GameCardModel> items) {
    filteredItems.clear();
    if (search.isNotEmpty) {
      for (var element in items) {
        if (element.title.toLowerCase().contains(search)) {
          filteredItems.add(element);
        }
        if (element.title.toUpperCase().contains(search)) {
          filteredItems.add(element);
        }
      }
      _searchController.sink.add(filteredItems);
    } else {
      _searchController.sink.add([]);
    }
  }

  void searchByTags(String tag, List<GameCardModel> items) {
    filteredItems.clear();
    for (var item in items) {
      if (item.details.contains(tag)) {
        filteredItems.add(item);
      } else {
        filteredItems = [];
      }
    }
    _searchController.sink.add(filteredItems);
  }

  @override
  Future<void> close() {
    _searchController.close();
    return super.close();
  }
}
