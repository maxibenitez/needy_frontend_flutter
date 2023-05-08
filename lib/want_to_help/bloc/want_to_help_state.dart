part of 'want_to_help_bloc.dart';

enum WantToHelpStatus {
  initial,
  loading,
  loaded,
  error,
}

class WantToHelpState extends Equatable {
  const WantToHelpState({
    required this.status,
  });

  const WantToHelpState.initial()
      : this(        
          status: WantToHelpStatus.initial,
        );

  final WantToHelpStatus status;

  WantToHelpState copyWith({
    WantToHelpStatus? status,
  }) {
    return WantToHelpState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];
}
