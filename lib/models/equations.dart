class Available {
  int id;
  String equation;
  String solution;
  bool isFindX;
  List<dynamic> explanation;

  Available(
      {required this.id,
      required this.equation,
      required this.solution,
      required this.isFindX,
      required this.explanation});

  factory Available.fromJson(Map<String, dynamic> json) {
    return Available(
      id: json['id'],
      equation: json['equation'],
      solution: json['solution'],
      isFindX: json['isFindX'],
      explanation: json['explanation'],
    );
  }

  Map<String, dynamic> toJson() => {
        'equation': equation,
        'solution': solution,
        'isFindX': isFindX,
        'explanation': explanation,
      };
}
