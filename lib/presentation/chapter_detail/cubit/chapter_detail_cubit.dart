import 'package:app_truyen/core/state_renderer/state_render_impl.dart';
import 'package:app_truyen/core/state_renderer/state_renderer.dart';
import 'package:app_truyen/domain/model/chapter_detail_model.dart';
import 'package:app_truyen/domain/usecase/get_chapter_detail_usecase.dart';
import 'package:app_truyen/domain/usecase/get_chapter_usecase.dart';
import 'package:app_truyen/utils/string_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chapter_detail_state.dart';

class ChapterDetailCubit extends Cubit<ChapterDetailState> {
  ChapterDetailCubit(this.usecase) : super(ChapterDetailInitial());
  final GetChapterDetailUsecase usecase;

  Future<void> getChapterDetail(int id) async {
    emit(ChapterDetailLoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await usecase.execute(id)).fold((fail) {
      emit(ChapterDetailErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, fail.message));
    }, (data) {
      if (data.id == 0) {
        emit(ChapterDetailEmptyState("Rong"));
      }
      emit(ChapterDetailLoaded(data));
    });
  }
}
