abstract class ListsEvent {}

class LoadListsEvent extends ListsEvent {}

class ToggleListVisibilityEvent extends ListsEvent {

  ToggleListVisibilityEvent({required this.listIndex});
  final int listIndex;
}
