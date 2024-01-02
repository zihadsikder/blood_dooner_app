import 'dart:convert';

UpzilaResponse upzilaResponseFromJson(String str) => UpzilaResponse.fromJson(json.decode(str));

String upzilaResponseToJson(UpzilaResponse data) => json.encode(data.toJson());

class UpzilaResponse {
  int status;
  String message;
  List<UpzilaDatum> data;

  UpzilaResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpzilaResponse.fromJson(Map<String, dynamic> json) => UpzilaResponse(
    status: json["status"],
    message: json["message"],
    data: List<UpzilaDatum>.from(json["data"].map((x) => UpzilaDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class UpzilaDatum {
  String id;
  String upzilaId;
  String districtId;
  String name;
  String bnName;
  String url;
  DateTime createdAt;
  DateTime updatedAt;

  UpzilaDatum({
    required this.id,
    required this.upzilaId,
    required this.districtId,
    required this.name,
    required this.bnName,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UpzilaDatum.fromJson(Map<String, dynamic> json) => UpzilaDatum(
    id: json["_id"],
    upzilaId: json["upzila_id"],
    districtId: json["district_id"],
    name: json["name"],
    bnName: json["bn_name"],
    url: json["url"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "upzila_id": upzilaId,
    "district_id": districtId,
    "name": name,
    "bn_name": bnName,
    "url": url,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}

