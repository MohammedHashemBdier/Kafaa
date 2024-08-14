import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kafaa_app/repos/localization_repo.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final LocalizationRepo repo;
  LocalizationBloc({required this.repo}) : super(const InitialState()) {
    on<GetSavedLanguageEvent>((event, emit) {
      emit(InitialState(languageCode: repo.languageCode ?? state.languageCode));
    });

    on<ChangeLanguageEvent>((event, emit) async {
      String oldLanguageCode = state.languageCode;
      String newLanguageCode = event.languageCode ?? state.languageCode;

      if (oldLanguageCode != newLanguageCode) {
        emit(InitialState(languageCode: newLanguageCode));

        try {
          bool isChanged = await repo.changeLanguage(newLanguageCode);
          if (!isChanged) emit(InitialState(languageCode: oldLanguageCode));
        } catch (e) {
          emit(InitialState(languageCode: oldLanguageCode));
        }
      }
    });
  }
}
