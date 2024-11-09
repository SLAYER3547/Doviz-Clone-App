import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc Event Tanımları
abstract class AgeConsentEvent {}

class SelectAgeOver18 extends AgeConsentEvent {}
class SelectAgeUnder18 extends AgeConsentEvent {}
class ToggleAgreement extends AgeConsentEvent {
  ToggleAgreement(this.isChecked);
  final bool isChecked;
}

// Bloc State Tanımları
class AgeConsentState {
  
  AgeConsentState({
    required this.isOver18,
    required this.isAgreementEnabled,
    required this.isAgreementChecked,
  });
  final bool isOver18;
  final bool isAgreementEnabled;
  final bool isAgreementChecked;

  AgeConsentState copyWith({
    bool? isOver18,
    bool? isAgreementEnabled,
    bool? isAgreementChecked,
  }) {
    return AgeConsentState(
      isOver18: isOver18 ?? this.isOver18,
      isAgreementEnabled: isAgreementEnabled ?? this.isAgreementEnabled,
      isAgreementChecked: isAgreementChecked ?? this.isAgreementChecked,
    );
  }
}

// Bloc Tanımları
class AgeConsentBloc extends Bloc<AgeConsentEvent, AgeConsentState> {
  AgeConsentBloc() : super(AgeConsentState(isOver18: false, isAgreementEnabled: false, isAgreementChecked: false)) {
    on<SelectAgeOver18>((event, emit) {
      emit(state.copyWith(isOver18: true, isAgreementEnabled: true));
    });

    on<SelectAgeUnder18>((event, emit) {
      emit(state.copyWith(isOver18: false, isAgreementEnabled: false, isAgreementChecked: false));
    });

    on<ToggleAgreement>((event, emit) {
      emit(state.copyWith(isAgreementChecked: event.isChecked));
    });
  }
}
