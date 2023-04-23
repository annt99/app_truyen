import 'package:app_truyen/data/network/failure.dart';
import 'package:app_truyen/domain/model/story_model.dart';
import 'package:app_truyen/domain/repository/repository.dart';
import 'package:app_truyen/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetStoriesUsecase
    implements BaseUseCase<GetCategoriesUsecaseInput, List<Story>> {
  final Repository _repository;
  GetStoriesUsecase(this._repository);

  @override
  Future<Either<Failure, List<Story>>> execute(
      GetCategoriesUsecaseInput input) async {
    return _repository.getStoryById(input.id, input.page, input.limit);
  }
}

class GetCategoriesUsecaseInput {
  int id;
  int page;
  int limit;
  GetCategoriesUsecaseInput(this.id, this.page, this.limit);
}
