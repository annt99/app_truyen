part of 'stories_cubit.dart';

abstract class ListStoriesState extends Equatable with FlowState {}

class ListStoriesInitial extends ListStoriesState {
  @override
  String getMessage() {
    return "InitState";
  }

  @override
  StateRendererType getStateRendererType() {
    return StateRendererType.SUCCESS_STATE;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListStoriesLoadingState extends ListStoriesState {
  final StateRendererType stateRendererType;
  final String message;
  ListStoriesLoadingState({required this.stateRendererType, String? message})
      : message = message ?? AppString.loading;
  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListStoriesErrorState extends ListStoriesState {
  final StateRendererType stateRendererType;
  final String message;
  ListStoriesErrorState(this.stateRendererType, this.message);
  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListStoriesEmptyState extends ListStoriesState {
  final String message;
  ListStoriesEmptyState(this.message);
  @override
  String getMessage() => "";

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.EMPTY_SCREEN_STATE;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ListStoriesLoaded extends ListStoriesState {
  final List<Story> stories;
  ListStoriesLoaded(this.stories);

  @override
  String getMessage() {
    return "Loaded";
  }

  @override
  StateRendererType getStateRendererType() {
    return StateRendererType.SUCCESS_STATE;
  }

  @override
  List<Object?> get props => [stories];
}
