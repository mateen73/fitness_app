class Program {
  final int id;
  final String title;
  final String instructor;
  final String duration;
  final String description;
  final String thumbnail;

  Program({
    required this.id,
    required this.title,
    required this.instructor,
    required this.duration,
    required this.description,
    required this.thumbnail,
  });

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
      id: json['id'],
      title: json['title'],
      instructor: json['instructor'],
      duration: json['duration'],
      description: json['description'],
      thumbnail: json['thumbnail'],
    );
  }
}