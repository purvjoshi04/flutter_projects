class Student {
  int? id;
  final String name;
  final String rollNumber;
  final String address;

  Student({
    this.id,
    required this.name,
    required this.rollNumber,
    required this.address,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'rollNumber': rollNumber,
      'address': address,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      name: map['name'],
      rollNumber: map['rollNumber'],
      address: map['address'],
    );
  }
}