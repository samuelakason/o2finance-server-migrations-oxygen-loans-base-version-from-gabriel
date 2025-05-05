class ReferralHistoryModel {
  ReferralHistoryModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.message,
    required this.status,
  });

  final List<Datum> data;
  final Links? links;
  final Meta? meta;
  final String? message;
  final bool? status;

  factory ReferralHistoryModel.fromJson(Map<String, dynamic> json) {
    return ReferralHistoryModel(
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      links: json["links"] == null ? null : Links.fromJson(json["links"]),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      message: json["message"],
      status: json["status"],
    );
  }
}

class Datum {
  Datum({
    required this.referredId,
    required this.referredName,
    required this.referredAvatar,
    required this.referredCommission,
    required this.referredDated,
  });

  final num? referredId;
  final String? referredName;
  final String? referredAvatar;
  final String? referredCommission;
  final DateTime? referredDated;

  factory Datum.fromJson(Map<String, dynamic> json) {
    return Datum(
      referredId: json["referredId"],
      referredName: json["referredName"],
      referredAvatar: json["referredAvatar"],
      referredCommission: json["referredCommission"],
      referredDated: DateTime.tryParse(json["referredDated"] ?? ""),
    );
  }
}

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  final String? first;
  final String? last;
  final dynamic prev;
  final dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      first: json["first"],
      last: json["last"],
      prev: json["prev"],
      next: json["next"],
    );
  }
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  final num? currentPage;
  final num? from;
  final num? lastPage;
  final List<Link> links;
  final String? path;
  final num? perPage;
  final num? to;
  final num? total;

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      currentPage: json["current_page"],
      from: json["from"],
      lastPage: json["last_page"],
      links: json["links"] == null
          ? []
          : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
      path: json["path"],
      perPage: json["per_page"],
      to: json["to"],
      total: json["total"],
    );
  }
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  final String? url;
  final String? label;
  final bool? active;

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      url: json["url"],
      label: json["label"],
      active: json["active"],
    );
  }
}
