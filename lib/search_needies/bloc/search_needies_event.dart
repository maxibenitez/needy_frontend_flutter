part of 'search_needies_bloc.dart';

abstract class SearchNeediesEvent extends Equatable {
  const SearchNeediesEvent();
}

class ViewNeediesEventStarted extends SearchNeediesEvent {
  const ViewNeediesEventStarted();

  @override
  List<Object?> get props => [];
}

class SearchNeedyChanged extends SearchNeediesEvent {
  const SearchNeedyChanged(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}
