import 'dart:convert';

StudentModel studentModelFromJson(String str) =>
    StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  List<Student> students;

  StudentModel({
    required this.students,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        students: List<Student>.from(
            json["students"].map((x) => Student.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "students": List<dynamic>.from(students.map((x) => x.toJson())),
      };
}

class Student {
  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  int? userId;
  String? idNumber;
  String? email;
  String? phoneNumber;
  DateTime? birthDate;
  String? gender;
  String? address;
  DateTime? createdAt;
  DateTime? updatedAt;

  Student({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.userId,
    this.idNumber,
    this.email,
    this.phoneNumber,
    this.birthDate,
    this.gender,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["id"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        userId: json["user_id"],
        idNumber: json["id_number"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        gender: json["gender"],
        address: json["address"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "user_id": userId,
        "id_number": idNumber,
        "email": email,
        "phone_number": phoneNumber,
        "birth_date": birthDate?.toIso8601String(),
        "gender": gender,
        "address": address,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
