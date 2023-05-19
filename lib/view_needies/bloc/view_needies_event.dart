part of 'view_needies_bloc.dart';

abstract class ViewNeediesEvent extends Equatable {
  const ViewNeediesEvent();
}

class ViewNeediesEventStarted extends ViewNeediesEvent {
  const ViewNeediesEventStarted();

  @override
  List<Object?> get props => [];
}

class SearchNeedyChanged extends ViewNeediesEvent {
  const SearchNeedyChanged(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}
