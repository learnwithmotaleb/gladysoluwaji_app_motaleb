class SpecialistsModel {
  final bool success;
  final int statusCode;
  final String message;
  final List<Specialis> data;
  final Meta meta;

  SpecialistsModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
    required this.meta,
  });

  factory SpecialistsModel.fromJson(Map<String, dynamic> json) {
    return SpecialistsModel(
      success: json["success"] == true,
      statusCode: json["statusCode"] ?? 0,
      message: json["message"]?.toString() ?? '',
      data: (json["data"] as List<dynamic>? ?? [])
          .whereType<Map<String, dynamic>>()
          .map((x) => Specialis.fromJson(x))
          .toList(),
      meta: Meta.fromJson(json["meta"] as Map<String, dynamic>? ?? {}),
    );
  }
}

class Specialis {
  final String id;
  final String name;
  final String description;
  final String thumbnail;
  final bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int v;

  Specialis({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
    required this.v,
  });

  factory Specialis.fromJson(Map<String, dynamic> json) {
    return Specialis(
      id: json["_id"]?.toString() ?? '',
      name: json["name"]?.toString() ?? '',
      description: json["description"]?.toString() ?? '',
      thumbnail: json["thumbnail"]?.toString() ?? '',
      isActive: json["isActive"] == true,
      createdAt: DateTime.tryParse(json["createdAt"]?.toString() ?? ''),
      updatedAt: DateTime.tryParse(json["updatedAt"]?.toString() ?? ''),
      v: json["__v"] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "thumbnail": thumbnail,
    "isActive": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Meta {
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  Meta({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      total: json["total"] ?? 0,
      page: json["page"] ?? 1,
      limit: json["limit"] ?? 10,
      totalPages: json["totalPages"] ?? 1,
    );
  }

  Map<String, dynamic> toJson() => {
    "total": total,
    "page": page,
    "limit": limit,
    "totalPages": totalPages,
  };
}
