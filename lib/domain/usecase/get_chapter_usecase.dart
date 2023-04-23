import 'package:app_truyen/data/network/failure.dart';
import 'package:app_truyen/domain/model/chapter_model.dart';
import 'package:app_truyen/domain/repository/repository.dart';
import 'package:app_truyen/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetChaptersUsecase implements BaseUseCase<String, List<Chapter>> {
  final Repository _repository;
  GetChaptersUsecase(this._repository);

  @override
  Future<Either<Failure, List<Chapter>>> execute(String slug) async {
    return _repository.getChapterBySlug(slug);
  }
}
