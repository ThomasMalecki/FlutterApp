class Scanned {
  int id;
  int available_id;
  String date;
  String imagePath;

  Scanned({
    required this.id,
    required this.available_id,
    required this.date,
    required this.imagePath,
  });

  factory Scanned.fromJson(Map<String, dynamic> json) {
    return Scanned(
        id: json['id'],
        available_id: json['available_id'],
        date: json['date'],
        imagePath: json['imagePath']);
  }

  Map<String, dynamic> toJson() => {
        'available_id': available_id,
        'date': date,
        'imagePath': imagePath,
      };
}
