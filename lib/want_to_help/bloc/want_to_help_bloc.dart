import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'want_to_help_event.dart';
part 'want_to_help_state.dart';

class WantToHelpBloc extends Bloc<WantToHelpEvent, WantToHelpState> {
  
  WantToHelpBloc() : super(const WantToHelpState.initial());

}
