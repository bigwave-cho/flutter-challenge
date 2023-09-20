class PhotoModel {
  final String title;
  final String description;
  final String fileUrl;

  final int? likes;
  final int? comments;

  final String creatorUid;
  final int createAt;

  PhotoModel({
    required this.title,
    required this.description,
    required this.fileUrl,
    this.likes,
    this.comments,
    required this.creatorUid,
    required this.createAt,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "description": description,
      "fileUrl": fileUrl,
      "likes": likes ?? 0,
      "comments": comments ?? 0,
      "creatorUid": creatorUid,
      "createAt": createAt,
    };
  }

// 서버에서 받은 json으로 생성자 함수 만들기
  PhotoModel.fromJson(Map<String, dynamic> json)
      : title = json["title"],
        description = json["description"],
        fileUrl = json["fileUrl"],
        likes = json["likes"],
        comments = json["comments"],
        creatorUid = json["creatorUid"],
        createAt = json["createAt"];
}
