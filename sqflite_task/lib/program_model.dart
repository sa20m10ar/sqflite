class Program {
  bool selected = false;
  final int id;
  final String value;

  Program({this.id, this.value});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value
    };
  }
}

final programList = [
  Program(
    id: 1,
    value: 'program 1'
  ),
  Program(
    id: 2,
    value: 'program 2'
  ),
];
