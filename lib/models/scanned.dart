class Scanned {
  int id;
  int available_id;
  String date;

  Scanned({required this.id, required this.available_id, required this.date});

  factory Scanned.fromJson(Map<String, dynamic> json) {
    return Scanned(
      id: json['id'],
      available_id: json['available_id'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() => {
        'available_id': available_id,
        'date': date,
      };
}
