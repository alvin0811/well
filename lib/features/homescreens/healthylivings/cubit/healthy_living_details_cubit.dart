import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:well_path/features/homescreens/healthylivings/models/healthy_living_details_state.dart';
import 'package:well_path/helper/cubit_message/cubit_message.dart';
import 'package:well_path/helper/helpers.dart';

class HealthyLivingDetailsCubit extends Cubit<HealthyLivingDetailState> {
  HealthyLivingDetailsCubit() : super(HealthyLivingDetailState());

  final _message = SController<CubitMessage>.broadcast();
  S<CubitMessage> get message => _message.stream;

  final _loader = SController<bool>.broadcast();
  S<bool> get loader => _loader.stream;

  void showAndHideLoader() {
    _loader.sink.add(true);
    Future.delayed(const Duration(milliseconds: 2000), () {
      _loader.sink.add(false);
    });
    //  _loader.sink.add(false);
  }

  @override
  Future<void> close() {
    _message.close();
    _loader.close();
    return super.close();
  }
  
}
