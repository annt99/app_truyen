import 'package:app_truyen/domain/model/category_model.dart';

class Story {
  int id;
  String title;
  String author;
  String slug;
  List<String> description;
  String poster;
  List<String> categoryList;
  String status;
  String uploadDate;
  String updatedDate;
  String deletedAt;
  List<Category> categories;

  Story(
      {required this.id,
      required this.title,
      required this.author,
      required this.slug,
      required this.description,
      required this.poster,
      required this.categoryList,
      required this.status,
      required this.uploadDate,
      required this.updatedDate,
      required this.deletedAt,
      required this.categories});
}
