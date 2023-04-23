// ignore_for_file: constant_identifier_names

import 'package:app_truyen/data/response/response.dart';
import 'package:app_truyen/domain/model/category_model.dart';
import 'package:app_truyen/domain/model/chapter_detail_model.dart';
import 'package:app_truyen/domain/model/chapter_model.dart';
import 'package:app_truyen/domain/model/story_model.dart';

const EMPTY = "";
const ZERO = 0;

extension CategoryResponseMapper on CategoryResponse? {
  Category toDomain() => Category(
        id: this?.id ?? ZERO,
        name: this?.name ?? EMPTY,
        description: this?.description ?? EMPTY,
        slug: this?.slug ?? EMPTY,
      );
}

extension StoryResponseMapper on StoryResponse? {
  Story toDomain() => Story(
      id: this?.id ?? ZERO,
      title: this?.title ?? EMPTY,
      author: this?.author ?? EMPTY,
      slug: this?.slug ?? EMPTY,
      description: this?.description ?? [],
      poster: this?.poster ?? EMPTY,
      categoryList: this?.categoryList ?? [],
      status: this?.status ?? EMPTY,
      uploadDate: this?.uploadDate ?? EMPTY,
      updatedDate: this?.updatedDate ?? EMPTY,
      deletedAt: this?.deletedAt ?? EMPTY,
      categories:
          this?.categories?.map((e) => e.toDomain()).toList() ?? <Category>[]);
}

extension StoryChapterMapper on StoryChapterResponse {
  StoryChapter toDomain() => StoryChapter(id ?? ZERO, slug ?? EMPTY);
}

extension ChapterResponseMapper on ChapterResponse {
  Chapter toDomain() => Chapter(
      id: id ?? ZERO,
      header: header ?? EMPTY,
      slug: slug ?? EMPTY,
      viewCount: viewCount ?? ZERO,
      updatedDate: updatedDate ?? EMPTY,
      story: story?.toDomain());
}

extension ChapterDetailResponseMapper on ChapterDetailResponse? {
  ChapterDetail toDomain() => ChapterDetail(
      id: this?.id ?? ZERO,
      header: this?.header ?? EMPTY,
      slug: this?.slug ?? EMPTY,
      viewCount: this?.viewCount ?? ZERO,
      updatedDate: this?.updatedDate ?? EMPTY,
      story: this?.story?.toDomain(),
      body: this?.body ?? [],
      deletedAt: this?.deletedAt ?? EMPTY,
      uploadDate: this?.uploadDate ?? EMPTY);
}
