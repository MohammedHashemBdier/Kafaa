import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kafaa_app/models/employee_targets_model.dart';
import 'package:kafaa_app/models/top_in_rating_card_model.dart';
import 'package:kafaa_app/repos/auth_repo.dart';
import 'package:kafaa_app/repos/targets_repo.dart';

part 'targets_event.dart';
part 'targets_state.dart';

class TargetsBloc extends Bloc<TargetsEvent, TargetsState> {
  final TargetsRepo targetsRepo;
  final AuthRepo authRepo;

  TargetsBloc({
    required this.targetsRepo,
    required this.authRepo,
  }) : super(InitialState()) {
    on<GetDataEvent>((event, emit) async {
      int pointsValue =
          await targetsRepo.getPointValue(password: authRepo.password);
    });
  }
}
