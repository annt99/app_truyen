// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse()
      ..status = json['statusCode'] as int?
      ..message = json['message'] as String?
      ..error = json['error'] as String?;

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.status,
      'message': instance.message,
      'error': instance.error,
    };

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      json['id'] as int?,
      json['name'] as String?,
      json['slug'] as String?,
      json['description'] as String?,
    );

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
    };

StoryResponse _$StoryResponseFromJson(Map<String, dynamic> json) =>
    StoryResponse(
      json['id'] as int?,
      json['title'] as String?,
      json['author'] as String?,
      json['slug'] as String?,
      (json['description'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['poster'] as String?,
      (json['categoryList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      json['status'] as String?,
      json['uploadDate'] as String?,
      json['updatedDate'] as String?,
      json['deletedAt'] as String?,
      (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StoryResponseToJson(StoryResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'slug': instance.slug,
      'description': instance.description,
      'poster': instance.poster,
      'categoryList': instance.categoryList,
      'status': instance.status,
      'uploadDate': instance.uploadDate,
      'updatedDate': instance.updatedDate,
      'deletedAt': instance.deletedAt,
      'categories': instance.categories,
    };

StoryChapterResponse _$StoryChapterResponseFromJson(
        Map<String, dynamic> json) =>
    StoryChapterResponse(
      json['id'] as int?,
      json['slug'] as String?,
    );

Map<String, dynamic> _$StoryChapterResponseToJson(
        StoryChapterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
    };

ChapterResponse _$ChapterResponseFromJson(Map<String, dynamic> json) =>
    ChapterResponse(
      json['id'] as int?,
      json['header'] as String?,
      json['slug'] as String?,
      json['viewCount'] as int?,
      json['updatedDate'] as String?,
      json['story'] == null
          ? null
          : StoryChapterResponse.fromJson(
              json['story'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChapterResponseToJson(ChapterResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'header': instance.header,
      'slug': instance.slug,
      'viewCount': instance.viewCount,
      'updatedDate': instance.updatedDate,
      'story': instance.story,
    };

ChapterDetailResponse _$ChapterDetailResponseFromJson(
        Map<String, dynamic> json) =>
    ChapterDetailResponse(
      json['id'] as int?,
      json['header'] as String?,
      json['slug'] as String?,
      (json['body'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['viewCount'] as int?,
      json['uploadDate'] as String?,
      json['updatedDate'] as String?,
      json['deletedAt'] as String?,
      json['story'] == null
          ? null
          : StoryResponse.fromJson(json['story'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChapterDetailResponseToJson(
        ChapterDetailResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'header': instance.header,
      'slug': instance.slug,
      'body': instance.body,
      'viewCount': instance.viewCount,
      'uploadDate': instance.uploadDate,
      'updatedDate': instance.updatedDate,
      'deletedAt': instance.deletedAt,
      'story': instance.story,
    };
