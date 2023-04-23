import 'package:app_truyen/data/network/failure.dart';
import 'package:app_truyen/domain/model/category_model.dart';
import 'package:app_truyen/domain/model/chapter_detail_model.dart';
import 'package:app_truyen/domain/model/chapter_model.dart';
import 'package:app_truyen/domain/model/story_model.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, List<Story>>> getStoryById(
      int id, int page, int limit);
  Future<Either<Failure, List<Chapter>>> getChapterBySlug(String slug);
  Future<Either<Failure, ChapterDetail>> getChapterDetailById(int id);
}
