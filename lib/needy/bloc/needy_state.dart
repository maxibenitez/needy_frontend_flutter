part of 'needy_bloc.dart';

enum NeedyStatus {
  initial,
  loading,
  loaded,
  error,
}

class NeedyState extends Equatable {
  const NeedyState({
    required this.status,
  });

  const NeedyState.initial()
      : this(        
          status: NeedyStatus.initial,
        );

  final NeedyStatus status;

  NeedyState copyWith({
    NeedyStatus? status,
  }) {
    return NeedyState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        status,
      ];
}
