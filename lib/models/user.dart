
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.avater,
        this.name,
        this.isGroup,
        this.updatedAt,
        this.message,
    });

    String? avater;
    String? name;
    bool? isGroup;
    String? updatedAt;
    String? message;

    factory User.fromJson(Map<String, dynamic> json) => User(
        avater: json["avater"],
        name: json["name"],
        isGroup: json["isGroup"],
        updatedAt: json["UpdatedAt"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "avater": avater,
        "name": name,
        "isGroup": isGroup,
        "UpdatedAt": updatedAt,
        "message": message,
    };
}
