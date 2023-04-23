part of 'home_page_cubit.dart';

abstract class HomePageState extends Equatable with FlowState {
  @override
  List<Object?> get props => [];
}

class HomePageInitial extends HomePageState {
  @override
  String getMessage() {
    return "InitState";
  }

  @override
  StateRendererType getStateRendererType() {
    return StateRendererType.SUCCESS_STATE;
  }
}

class HomePageLoadingState extends HomePageState {
  final StateRendererType stateRendererType;
  final String message;
  HomePageLoadingState({required this.stateRendererType, String? message})
      : message = message ?? AppString.loading;
  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class HomePageErrorState extends HomePageState {
  final StateRendererType stateRendererType;
  final String message;
  HomePageErrorState(this.stateRendererType, this.message);
  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class HomePageEmptyState extends HomePageState {
  final String message;
  HomePageEmptyState(this.message);
  @override
  String getMessage() => "";

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.EMPTY_SCREEN_STATE;
}

class HomePageLoaded extends HomePageState {
  final List<Category> categories;
  HomePageLoaded(this.categories);
  @override
  List<Object?> get props => [categories];

  @override
  String getMessage() {
    return "Loaded";
  }

  @override
  StateRendererType getStateRendererType() {
    return StateRendererType.CONTENT_STATE;
  }
}
