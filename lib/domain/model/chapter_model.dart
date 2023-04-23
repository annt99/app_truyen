class StoryChapter {
  final int id;
  final String slug;
  const StoryChapter(this.id, this.slug);
}

class Chapter {
  final int id;
  final String header;
  final String slug;
  final int viewCount;
  final String updatedDate;
  final StoryChapter? story;
  Chapter(
      {required this.id,
      required this.header,
      required this.slug,
      required this.viewCount,
      required this.updatedDate,
      required this.story});
}
