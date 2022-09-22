import 'dart:convert';

CallList callListFromJson(String str) => CallList.fromJson(json.decode(str));

String callListToJson(CallList data) => json.encode(data.toJson());

class CallList {
    CallList({
        this.avater,
        this.name,
        this.calltime,
        this.calltype,
        this.icon,
    });

    String? avater;
    String? name;
    String? calltime;
    String? calltype;
    String? icon;

    factory CallList.fromJson(Map<String, dynamic> json) => CallList(
        avater: json["avater"],
        name: json["name"],
        calltime: json["calltime"],
        calltype: json["calltype"],
        icon: json["Icon"],
    );

    Map<String, dynamic> toJson() => {
        "avater": avater,
        "name": name,
        "calltime": calltime,
        "calltype": calltype,
        "Icon": icon,
    };
}
