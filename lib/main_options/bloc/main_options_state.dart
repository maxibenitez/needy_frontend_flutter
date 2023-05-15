part of 'main_options_bloc.dart';

enum MainOptionsStatus {
  initial,
  loading,
  loaded,
  error,
}

class MainOptionsState extends Equatable {
  const MainOptionsState({
    required this.status,
  });

  const MainOptionsState.initial()
      : this(        
          status: MainOptionsStatus.initial,
        );

  final MainOptionsStatus status;

  MainOptionsState copyWith({
    MainOptionsStatus? status,
  }) {
    return MainOptionsState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];
}
