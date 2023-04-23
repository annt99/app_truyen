import 'package:app_truyen/data/network/error_handler.dart';

class Failure {
  int code;
  String message;
  Failure(this.code, this.message);
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(ResponseCode.UNKNOWN, ResponseMessage.UNKNOWN);
}
