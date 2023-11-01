class Available {
  int id;
  String equation;
  String solution;
  String explanation;

  Available(
      {required this.id,
      required this.equation,
      required this.solution,
      required this.explanation});

  factory Available.fromJson(Map<String, dynamic> json) {
    return Available(
      id: json['id'],
      equation: json['equation'],
      solution: json['solution'],
      explanation: json['explanation'],
    );
  }

  Map<String, dynamic> toJson() => {
        'equation': equation,
        'solution': solution,
        'explanation': explanation,
      };
}
