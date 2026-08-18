import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final int id;
  final String? name;

  const LoginModel({required this.id, this.name});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(id: json['id'], name: json['name']);
  }

  @override
  List<Object?> get props => [id, name];
}
