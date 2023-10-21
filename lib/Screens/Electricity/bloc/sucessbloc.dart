import 'package:fastload/Screens/Electricity/Api/electric_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum SuccessDialogState { initial, success, error }

class SuccessDialogBloc extends Cubit<SuccessDialogState> {
  final ElectricityApi apiService = ElectricityApi();

  SuccessDialogBloc() : super(SuccessDialogState.initial);

  Future<void> makeApiCallAndShowDialog() async {
    try {
      final success = await apiService.validateMeterNumber();
      if (success!) {
        emit(SuccessDialogState.success);
      } else {
        emit(SuccessDialogState.error);
      }
    } catch (e) {
      emit(SuccessDialogState.error);
    }
  }

  void resetDialogState() {
    emit(SuccessDialogState.initial);
  }
}
