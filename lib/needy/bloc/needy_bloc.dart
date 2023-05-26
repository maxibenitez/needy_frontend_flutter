import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'needy_event.dart';
part 'needy_state.dart';

class NeedyBloc extends Bloc<NeedyEvent, NeedyState> {
  
  NeedyBloc() : super(const NeedyState.initial());

}
