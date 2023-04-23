import 'dart:ffi';

import 'package:app_truyen/domain/model/category_model.dart';
import 'package:app_truyen/domain/usecase/get_categories_usecare.dart';
import 'package:app_truyen/core/state_renderer/state_render_impl.dart';
import 'package:app_truyen/core/state_renderer/state_renderer.dart';
import 'package:app_truyen/utils/string_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit(this.usecase) : super(HomePageInitial());
  final GetCategoriesUsecase usecase;

  Future<void> getCategories() async {
    emit(HomePageLoadingState(
        stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE));
    (await usecase.execute(Void)).fold((fail) {
      emit(HomePageErrorState(
          StateRendererType.FULL_SCREEN_ERROR_STATE, fail.message));
    }, (data) {
      if (data.isEmpty) {
        emit(HomePageEmptyState("Chua co danh muc truyen"));
      }
      emit(HomePageLoaded(data));
    });
  }
}
