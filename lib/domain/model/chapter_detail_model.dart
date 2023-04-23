import 'package:app_truyen/domain/model/story_model.dart';

class ChapterDetail {
  final int id;
  final String header;
  final String slug;
  final List<String> body;
  final int viewCount;
  final String updatedDate;
  final String uploadDate;
  final String deletedAt;
  final Story? story;

  ChapterDetail(
      {required this.id,
      required this.header,
      required this.slug,
      required this.viewCount,
      required this.updatedDate,
      required this.story,
      required this.body,
      required this.deletedAt,
      required this.uploadDate});

  @override
  String toString() {
    String result = "";
    for (var sentence in body) {
      result = '$result \n$sentence';
    }
    return result.substring(2, result.length);
  }
}
