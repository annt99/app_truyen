import 'package:app_truyen/core/state_renderer/state_render_impl.dart';
import 'package:app_truyen/core/state_renderer/state_renderer.dart';
import 'package:app_truyen/domain/model/chapter_model.dart';
import 'package:app_truyen/domain/model/story_model.dart';
import 'package:app_truyen/domain/usecase/get_chapter_usecase.dart';
import 'package:app_truyen/utils/string_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'story_detai_state.dart';

class StoryDetaiCubit extends Cubit<StoryDetailState> {
  StoryDetaiCubit(this.usecase) : super(StoryDetailInitial());
  final GetChaptersUsecase usecase;

  Future<void> getChapters(String slug) async {
    emit(StoryDetailLoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await usecase.execute(slug)).fold((fail) {
      emit(StoryDetailErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, fail.message));
    }, (data) {
      if (data.isEmpty) {
        emit(StoryDetailEmptyState("Chua co danh muc chuong"));
      }
      emit(StoryDetailLoaded(data));
    });
  }
}
