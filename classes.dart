import 'package:crypto/crypto.dart';
import 'dart:convert';

class Student {
  String id;
  String name;
  String email;
  String password;
  String gender;

  Student({this.id, this.name, this.email, this.password, this.gender});

  String getPronoun() {
    switch (gender) {
      case "male":
        return 'He';
        break;
      case "female":
        return 'She';
        break;
      default:
        return 'They';
    }
  }

  String getPassword() {
    var bytes = utf8.encode(password);
    var digest = sha1.convert(bytes);

    return "$digest";
  }
}

void main() {
  final student = Student(
      id: '123abc',
      name: 'Junjun',
      email: 'junjun@wvsu.edu.ph',
      password: 'qwerty123456',
      gender: 'male');

  print("${student.name} is a student of West Visayas State University.");
  print("${student.getPronoun()} can be emailed through ${student.email}.");
  print("Current password access for this account ${student.id} is ${student.getPassword()}.");
