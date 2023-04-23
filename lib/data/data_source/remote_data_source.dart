import 'package:app_truyen/data/network/app_api.dart';
import 'package:app_truyen/data/response/response.dart';

abstract class RemoteDataSource {
  Future<List<CategoryResponse>> getCategories();
  Future<List<StoryResponse>> getStoriesById(int id, int page, int limit);
  Future<List<ChapterResponse>> getChapterBySlug(String slug);
  Future<ChapterDetailResponse> getChapterDetailById(int id);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final AppServiceClient _appServiceClient;
  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<List<CategoryResponse>> getCategories() async {
    return await _appServiceClient.getCategories();
  }

  @override
  Future<List<StoryResponse>> getStoriesById(
      int id, int page, int limit) async {
    return await _appServiceClient.getStoriesById(id, page, limit);
  }

  @override
  Future<List<ChapterResponse>> getChapterBySlug(String slug) async {
    return await _appServiceClient.getChapterBySlug(slug);
  }

  @override
  Future<ChapterDetailResponse> getChapterDetailById(int id) async {
    return await _appServiceClient.getChapterDetailById(id);
  }
}
