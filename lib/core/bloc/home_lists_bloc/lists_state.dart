class ListsState {

  ListsState({required this.visibleLists});
  final List<bool> visibleLists;

  ListsState copyWith({List<bool>? visibleLists}) {
    return ListsState(visibleLists: visibleLists ?? this.visibleLists);
  }
}
