import 'package:app_truyen/data/network/failure.dart';
import 'package:app_truyen/domain/model/chapter_detail_model.dart';
import 'package:app_truyen/domain/repository/repository.dart';
import 'package:app_truyen/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetChapterDetailUsecase implements BaseUseCase<int, ChapterDetail> {
  final Repository _repository;
  GetChapterDetailUsecase(this._repository);

  @override
  Future<Either<Failure, ChapterDetail>> execute(int id) async {
    return _repository.getChapterDetailById(id);
  }
}
