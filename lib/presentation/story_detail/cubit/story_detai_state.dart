part of 'story_detai_cubit.dart';

abstract class StoryDetailState extends Equatable with FlowState {}

class StoryDetailInitial extends StoryDetailState {
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

class StoryDetailLoadingState extends StoryDetailState {
  final StateRendererType stateRendererType;
  final String message;
  StoryDetailLoadingState({required this.stateRendererType, String? message})
      : message = message ?? AppString.loading;
  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StoryDetailErrorState extends StoryDetailState {
  final StateRendererType stateRendererType;
  final String message;
  StoryDetailErrorState(this.stateRendererType, this.message);
  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StoryDetailEmptyState extends StoryDetailState {
  final String message;
  StoryDetailEmptyState(this.message);
  @override
  String getMessage() => "";

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.EMPTY_SCREEN_STATE;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StoryDetailLoaded extends StoryDetailState {
  final List<Chapter> chapters;
  StoryDetailLoaded(this.chapters);

  @override
  String getMessage() {
    return "Loaded";
  }

  @override
  StateRendererType getStateRendererType() {
    return StateRendererType.SUCCESS_STATE;
  }

  @override
  List<Object?> get props => [chapters];
}
