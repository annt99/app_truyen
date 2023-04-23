import 'package:app_truyen/domain/model/story_model.dart';
import 'package:app_truyen/domain/usecase/get_categories_usecare.dart';
import 'package:app_truyen/domain/usecase/get_stories_usecase.dart';
import 'package:app_truyen/core/state_renderer/state_render_impl.dart';
import 'package:app_truyen/core/state_renderer/state_renderer.dart';
import 'package:app_truyen/utils/string_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'stories_state.dart';

class ListStoriesCubit extends Cubit<ListStoriesState> {
  final GetStoriesUsecase usecase;
  final int id;

  ListStoriesCubit(this.usecase, this.id) : super(ListStoriesInitial());

  int page = 0;
  int limit = 20;

  Future<void> getStoriesById() async {
    int page = 0;
    emit(ListStoriesLoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await usecase.execute(GetCategoriesUsecaseInput(id, page, limit))).fold(
        (fail) {
      emit(ListStoriesErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, fail.message));
    }, (data) {
      if (data.isEmpty) {
        emit(ListStoriesEmptyState("Chua co danh muc truyen"));
      }
      emit(ListStoriesLoaded(data));
    });
  }

  Future<void> loadMoreStoriesById() async {
    page = page + 1;
    emit(ListStoriesLoadingState(
        stateRendererType: StateRendererType.POPUP_LOADING_STATE));
    (await usecase.execute(GetCategoriesUsecaseInput(id, page, limit))).fold(
        (fail) {
      emit(ListStoriesErrorState(
          StateRendererType.POPUP_ERROR_STATE, fail.message));
    }, (data) {
      if (data.isEmpty) {
        emit(ListStoriesEmptyState("Chua co danh muc truyen"));
      }
      emit(ListStoriesLoaded(data));
    });
  }
}
