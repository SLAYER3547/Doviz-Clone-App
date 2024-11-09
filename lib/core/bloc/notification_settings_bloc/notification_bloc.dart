import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc Events
abstract class CheckboxEvent {}

class ToggleAutoPriceNotificationCheckbox extends CheckboxEvent {
  ToggleAutoPriceNotificationCheckbox(this.isSelected);
  final bool isSelected;
}

class ToggleAlarmNotificationsCheckBox extends CheckboxEvent {
  ToggleAlarmNotificationsCheckBox(this.isSelected);
  final bool isSelected;
}

class ToggleNewsAndAnalyzeNotificationsCheckbox extends CheckboxEvent {
  ToggleNewsAndAnalyzeNotificationsCheckbox(this.isSelected);
  final bool isSelected;
}

class ToggleSubCheckboxesOfNewsAndAnalyzeNotifications extends CheckboxEvent {
  ToggleSubCheckboxesOfNewsAndAnalyzeNotifications(this.index, this.isSelected);
  final int index;
  final bool isSelected;
}

// Bloc State
class CheckboxState {
  CheckboxState({
    required this.autoPriceNotificationsCheckbox,
    required this.alarmNotificationsCheckbox,
    required this.newsAndAnalyzeNotificationsCheckbox,
    required this.subCheckboxesOfNewsAndAnalyzeNotifications,
  });
  final bool autoPriceNotificationsCheckbox;
  final bool alarmNotificationsCheckbox;
  final bool newsAndAnalyzeNotificationsCheckbox;
  final List<bool> subCheckboxesOfNewsAndAnalyzeNotifications;

  CheckboxState copyWith({
    bool? checkbox1,
    bool? checkbox2,
    bool? checkbox3,
    List<bool>? subCheckboxes,
  }) {
    return CheckboxState(
      autoPriceNotificationsCheckbox: checkbox1 ?? autoPriceNotificationsCheckbox,
      alarmNotificationsCheckbox: checkbox2 ?? alarmNotificationsCheckbox,
      newsAndAnalyzeNotificationsCheckbox: checkbox3 ?? newsAndAnalyzeNotificationsCheckbox,
      subCheckboxesOfNewsAndAnalyzeNotifications: subCheckboxes ?? subCheckboxesOfNewsAndAnalyzeNotifications,
    );
  }
}

// Bloc Definition
class CheckboxBloc extends Bloc<CheckboxEvent, CheckboxState> {
  CheckboxBloc()
      : super(CheckboxState(
          autoPriceNotificationsCheckbox: false,
          alarmNotificationsCheckbox: false,
          newsAndAnalyzeNotificationsCheckbox: false,
          subCheckboxesOfNewsAndAnalyzeNotifications: List.generate(6, (_) => false),
        ),) {
    on<ToggleAutoPriceNotificationCheckbox>((event, emit) {
      emit(state.copyWith(checkbox1: event.isSelected));
    });
    on<ToggleAlarmNotificationsCheckBox>((event, emit) {
      emit(state.copyWith(checkbox2: event.isSelected));
    });
    on<ToggleNewsAndAnalyzeNotificationsCheckbox>((event, emit) {
      emit(state.copyWith(checkbox3: event.isSelected));
    });
    on<ToggleSubCheckboxesOfNewsAndAnalyzeNotifications>((event, emit) {
      final updatedSubCheckboxes = List<bool>.from(state.subCheckboxesOfNewsAndAnalyzeNotifications);
      updatedSubCheckboxes[event.index] = event.isSelected;
      emit(state.copyWith(subCheckboxes: updatedSubCheckboxes));
    });
  }
}
