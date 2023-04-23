import 'package:app_truyen/data/response/response.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:app_truyen/app/constant.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @GET("/category")
  Future<List<CategoryResponse>> getCategories();

  @GET("/category/id/{id}/story")
  Future<List<StoryResponse>> getStoriesById(
      @Path("id") int id, @Query("page") int page, @Query("limit") int limit);

  @GET("/story/{slug}/chapters")
  Future<List<ChapterResponse>> getChapterBySlug(@Path("slug") String slug);

  @GET("/chapter/id/{id}")
  Future<ChapterDetailResponse> getChapterDetailById(@Path("id") int id);
}
