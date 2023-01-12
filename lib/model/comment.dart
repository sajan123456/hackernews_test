class CommentData {
  final String by;
  final int? id;
  final List? kids;
  final int? parent;
  final String? text;
  final int? time;
  final String? type;

  CommentData(
      {required this.by,
      required this.id,
      required this.kids,
      required this.parent,
      required this.text,
      required this.time,
      required this.type});

  factory CommentData.fromJson(Map<String, dynamic> json) {
    return CommentData(
      kids: json['kids'],
      by: json['by'],
      id: json['id'],
      parent: json['parent'],
      text: json['text'],
      time: json['time'],
      type: json['type'],
    );
  }
}
