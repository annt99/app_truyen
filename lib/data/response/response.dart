import 'package:json_annotation/json_annotation.dart';
part 'response.g.dart';

@JsonSerializable()
class ErrorResponse {
  @JsonKey(name: "statusCode")
  int? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "error")
  String? error;
}

@JsonSerializable()
class CategoryResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "slug")
  String? slug;
  @JsonKey(name: "description")
  String? description;

  CategoryResponse(this.id, this.name, this.slug, this.description);

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);
}

@JsonSerializable()
class StoryResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "author")
  String? author;
  @JsonKey(name: "slug")
  String? slug;
  @JsonKey(name: "description")
  List<String>? description;
  @JsonKey(name: "poster")
  String? poster;
  @JsonKey(name: "categoryList")
  List<String>? categoryList;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "uploadDate")
  String? uploadDate;
  @JsonKey(name: "updatedDate")
  String? updatedDate;
  @JsonKey(name: "deletedAt")
  String? deletedAt;
  @JsonKey(name: "categories")
  List<CategoryResponse>? categories;

  StoryResponse(
      this.id,
      this.title,
      this.author,
      this.slug,
      this.description,
      this.poster,
      this.categoryList,
      this.status,
      this.uploadDate,
      this.updatedDate,
      this.deletedAt,
      this.categories);

  factory StoryResponse.fromJson(Map<String, dynamic> json) =>
      _$StoryResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StoryResponseToJson(this);
}

@JsonSerializable()
class StoryChapterResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "slug")
  String? slug;
  StoryChapterResponse(this.id, this.slug);
  factory StoryChapterResponse.fromJson(Map<String, dynamic> json) =>
      _$StoryChapterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$StoryChapterResponseToJson(this);
}

@JsonSerializable()
class ChapterResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "header")
  String? header;
  @JsonKey(name: "slug")
  String? slug;
  @JsonKey(name: "viewCount")
  int? viewCount;
  @JsonKey(name: "updatedDate")
  String? updatedDate;
  @JsonKey(name: "story")
  StoryChapterResponse? story;

  ChapterResponse(this.id, this.header, this.slug, this.viewCount,
      this.updatedDate, this.story);

  factory ChapterResponse.fromJson(Map<String, dynamic> json) =>
      _$ChapterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChapterResponseToJson(this);
}

@JsonSerializable()
class ChapterDetailResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "header")
  String? header;
  @JsonKey(name: "slug")
  String? slug;
  @JsonKey(name: "body")
  List<String>? body;
  @JsonKey(name: "viewCount")
  int? viewCount;
  @JsonKey(name: "uploadDate")
  String? uploadDate;
  @JsonKey(name: "updatedDate")
  String? updatedDate;
  @JsonKey(name: "deletedAt")
  String? deletedAt;
  @JsonKey(name: "story")
  StoryResponse? story;

  ChapterDetailResponse(
      this.id,
      this.header,
      this.slug,
      this.body,
      this.viewCount,
      this.uploadDate,
      this.updatedDate,
      this.deletedAt,
      this.story);

  factory ChapterDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$ChapterDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ChapterDetailResponseToJson(this);
}
