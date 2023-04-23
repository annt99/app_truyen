import 'package:app_truyen/data/data_source/remote_data_source.dart';
import 'package:app_truyen/data/mapper/mapper.dart';
import 'package:app_truyen/data/network/error_handler.dart';
import 'package:app_truyen/data/network/failure.dart';
import 'package:app_truyen/data/network/network_info.dart';
import 'package:app_truyen/domain/model/category_model.dart';
import 'package:app_truyen/domain/model/chapter_detail_model.dart';
import 'package:app_truyen/domain/model/chapter_model.dart';
import 'package:app_truyen/domain/model/story_model.dart';
import 'package:app_truyen/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {
  final NetworkInfo _networkInfo;
  final RemoteDataSource _remoteDataSource;
  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    if (await _networkInfo.isConnected) {
      try {
        final res = await _remoteDataSource.getCategories();
        final categories = res.map((e) => e.toDomain()).toList();
        return Right(categories);
      } catch (error) {
        return Left(ErrorHandler.handler(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Story>>> getStoryById(
      int id, int page, int limit) async {
    if (await _networkInfo.isConnected) {
      try {
        final res = await _remoteDataSource.getStoriesById(id, page, limit);
        final stories = res.map((e) => e.toDomain()).toList();
        return Right(stories);
      } catch (error) {
        print("error: ${error.toString()}");
        return Left(ErrorHandler.handler(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<Chapter>>> getChapterBySlug(String slug) async {
    if (await _networkInfo.isConnected) {
      try {
        final res = await _remoteDataSource.getChapterBySlug(slug);
        final chapters = res.map((e) => e.toDomain()).toList();
        return Right(chapters);
      } catch (error) {
        print("error: ${error.toString()}");
        return Left(ErrorHandler.handler(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ChapterDetail>> getChapterDetailById(int id) async {
    if (await _networkInfo.isConnected) {
      try {
        final res = await _remoteDataSource.getChapterDetailById(id);
        ChapterDetail chapter = res.toDomain();
        return Right(chapter);
      } catch (error) {
        print("error: ${error.toString()}");
        return Left(ErrorHandler.handler(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
