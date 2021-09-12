import 'dart:convert';

SingUpRequest singUpRequestFromJson(String str) =>
    SingUpRequest.fromJson(json.decode(str));

String singUpRequestToJson(SingUpRequest data) => json.encode(data.toJson());

class SingUpRequest {
  SingUpRequest({
    required this.email,
    required this.password,
    required this.name,
  });

  String email;
  String password;
  String name;

  factory SingUpRequest.fromJson(Map<String, dynamic> json) => SingUpRequest(
        email: json["email"],
        password: json["password"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "name": name,
      };
}
