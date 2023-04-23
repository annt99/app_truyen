import 'package:app_truyen/data/network/dio_factory.dart';
import 'package:app_truyen/core/state_renderer/state_renderer.dart';
import 'package:app_truyen/utils/string_manager.dart';
import 'package:flutter/material.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(
      BuildContext context, Widget contentScreenWidget, Function retryFuntion) {
    switch (getStateRendererType()) {
      case StateRendererType.POPUP_LOADING_STATE:
        {
          showPopUp(context, getStateRendererType(), getMessage());
          return contentScreenWidget;
        }
      case StateRendererType.FULL_SCREEN_LOADING_STATE:
        {
          return StateRender(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              retryFunction: retryFuntion);
        }
      case StateRendererType.POPUP_ERROR_STATE:
        {
          dismissDialog(context);
          showPopUp(context, getStateRendererType(), getMessage());
          return contentScreenWidget;
        }
      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        {
          dismissDialog(context);
          return StateRender(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              retryFunction: retryFuntion);
        }

      case StateRendererType.SUCCESS_STATE:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
      case StateRendererType.EMPTY_SCREEN_STATE:
        {
          return StateRender(
              stateRendererType: getStateRendererType(),
              message: getMessage(),
              retryFunction: retryFuntion);
        }
      case StateRendererType.CONTENT_STATE:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
      default:
        {
          return contentScreenWidget;
        }
    }
  }

  dismissDialog(BuildContext context) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  _isThereCurrentDialogShowing(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  showPopUp(BuildContext context, StateRendererType stateRendererType,
      String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (context) => StateRender(
            stateRendererType: stateRendererType,
            message: message,
            retryFunction: () {})));
  }
}
