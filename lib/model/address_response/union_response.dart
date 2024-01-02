import 'dart:convert';

MUnionResponse mUnionResponseFromJson(String str) => MUnionResponse.fromJson(json.decode(str));

String mUnionResponseToJson(MUnionResponse data) => json.encode(data.toJson());

class MUnionResponse {
  int status;
  String message;
  List<UnionDatum> data;

  MUnionResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory MUnionResponse.fromJson(Map<String, dynamic> json) => MUnionResponse(
    status: json["status"],
    message: json["message"],
    data: List<UnionDatum>.from(json["data"].map((x) => UnionDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class UnionDatum {
  String id;
  String unionId;
  String upzilaId;
  String name;
  String bnName;
  String url;
  DateTime createdAt;
  DateTime updatedAt;

  UnionDatum({
    required this.id,
    required this.unionId,
    required this.upzilaId,
    required this.name,
    required this.bnName,
    required this.url,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UnionDatum.fromJson(Map<String, dynamic> json) => UnionDatum(
    id: json["_id"],
    unionId: json["union_id"],
    upzilaId: json["upzila_id"],
    name: json["name"],
    bnName: json["bn_name"],
    url: json["url"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "union_id": unionId,
    "upzila_id": upzilaId,
    "name": name,
    "bn_name": bnName,
    "url": url,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
