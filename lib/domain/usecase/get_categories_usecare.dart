import 'package:app_truyen/data/network/failure.dart';
import 'package:app_truyen/domain/model/category_model.dart';
import 'package:app_truyen/domain/repository/repository.dart';
import 'package:app_truyen/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class GetCategoriesUsecase implements BaseUseCase<void, List<Category>> {
  final Repository _repository;
  GetCategoriesUsecase(this._repository);

  @override
  Future<Either<Failure, List<Category>>> execute(void _) async {
    return _repository.getCategories();
  }
}
