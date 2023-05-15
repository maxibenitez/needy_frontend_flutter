import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_options_event.dart';
part 'main_options_state.dart';

class MainOptionsBloc extends Bloc<MainOptionsEvent, MainOptionsState> {
  
  MainOptionsBloc() : super(const MainOptionsState.initial());

}
