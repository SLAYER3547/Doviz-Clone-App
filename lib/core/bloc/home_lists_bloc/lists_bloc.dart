import 'package:doviz_clone_app/core/bloc/home_lists_bloc/lists_event.dart';
import 'package:doviz_clone_app/core/bloc/home_lists_bloc/lists_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListsBloc extends Bloc<ListsEvent, ListsState> {
  ListsBloc()
      : super(
            ListsState(visibleLists: List.generate(8, (index) => index < 2)),) {
    on<LoadListsEvent>(_onLoadLists);
    on<ToggleListVisibilityEvent>(_onToggleVisibility);
    add(LoadListsEvent());
  }

  Future<void> _onLoadLists(
      LoadListsEvent event, Emitter<ListsState> emit,) async {
    final prefs = await SharedPreferences.getInstance();
    final savedVisibility =
        prefs.getStringList('visibleLists')?.map((e) => e == 'true').toList();
    if (savedVisibility != null && savedVisibility.length == 8) {
      emit(state.copyWith(visibleLists: savedVisibility));
    }
  }

  Future<void> _onToggleVisibility(
    ToggleListVisibilityEvent event,
    Emitter<ListsState> emit,
  ) async {
    final updatedVisibility = List<bool>.from(state.visibleLists);
    updatedVisibility[event.listIndex] = !updatedVisibility[event.listIndex];

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
        'visibleLists', updatedVisibility.map((e) => e.toString()).toList(),);

    emit(state.copyWith(visibleLists: updatedVisibility));
  }
}
