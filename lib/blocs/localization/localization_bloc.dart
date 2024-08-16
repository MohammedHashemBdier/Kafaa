import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kafaa_app/repos/localization_repo.dart';

part 'localization_event.dart';
part 'localization_state.dart';

class LocalizationBloc extends Bloc<LocalizationEvent, LocalizationState> {
  final LocalizationRepo localizationRepo;
  LocalizationBloc({required this.localizationRepo})
      : super(const InitialState()) {
    on<GetAppLanguageEvent>((event, emit) async {
      try {
        emit(InitialState(languageCode: await localizationRepo.languageCode));
      } catch (e) {
        //
      }
    });

    on<ChangeLanguageEvent>((event, emit) async {
      String oldLanguageCode = state.languageCode;
      String newLanguageCode = event.languageCode ?? state.languageCode;

      if (oldLanguageCode != newLanguageCode) {
        emit(InitialState(languageCode: newLanguageCode));

        try {
          bool isChanged =
              await localizationRepo.changeLanguage(newLanguageCode);
          if (!isChanged) emit(InitialState(languageCode: oldLanguageCode));
        } catch (e) {
          emit(InitialState(languageCode: oldLanguageCode));
        }
      }
    });
  }
}
