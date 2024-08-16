part of 'localization_bloc.dart';

sealed class LocalizationState extends Equatable {
  final String languageCode;

  const LocalizationState({this.languageCode = 'ar'});

  @override
  List<Object> get props => [languageCode];
}

final class InitialState extends LocalizationState {
  const InitialState({super.languageCode});
}
