part of 'chapter_detail_cubit.dart';

abstract class ChapterDetailState extends Equatable with FlowState {}

class ChapterDetailInitial extends ChapterDetailState {
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

class ChapterDetailLoadingState extends ChapterDetailState {
  final StateRendererType stateRendererType;
  final String message;
  ChapterDetailLoadingState({required this.stateRendererType, String? message})
      : message = message ?? AppString.loading;
  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChapterDetailErrorState extends ChapterDetailState {
  final StateRendererType stateRendererType;
  final String message;
  ChapterDetailErrorState(this.stateRendererType, this.message);
  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChapterDetailEmptyState extends ChapterDetailState {
  final String message;
  ChapterDetailEmptyState(this.message);
  @override
  String getMessage() => "";

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.EMPTY_SCREEN_STATE;

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChapterDetailLoaded extends ChapterDetailState {
  final ChapterDetail chapter;
  ChapterDetailLoaded(this.chapter);

  @override
  String getMessage() {
    return "Loaded";
  }

  @override
  StateRendererType getStateRendererType() {
    return StateRendererType.SUCCESS_STATE;
  }

  @override
  List<Object?> get props => [chapter];
}
