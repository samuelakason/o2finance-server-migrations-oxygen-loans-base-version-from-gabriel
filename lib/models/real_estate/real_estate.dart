class RealEstateModel {
  RealEstateModel({
    required this.data,
    required this.links,
    required this.meta,
    required this.message,
    required this.status,
  });

  final List<RealEstateDatum> data;
  final Links? links;
  final Meta? meta;
  final String? message;
  final bool? status;

  factory RealEstateModel.fromJson(Map<String, dynamic> json) {
    return RealEstateModel(
      data: json["data"] == null
          ? []
          : List<RealEstateDatum>.from(
              json["data"]!.map((x) => RealEstateDatum.fromJson(x))),
      links: json["links"] == null ? null : Links.fromJson(json["links"]),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      message: json["message"],
      status: json["status"],
    );
  }
}

class RealEstateDatum {
  RealEstateDatum({
    required this.propertyId,
    required this.propertyType,
    required this.propertyTitle,
    required this.propertySummary,
    required this.propertyCountry,
    required this.propertyState,
    required this.propertyCity,
    required this.propertyListingType,
    required this.propertyCost,
    required this.propertyThumbnail,
  });

  final num? propertyId;
  final String? propertyType;
  final String? propertyTitle;
  final String? propertySummary;
  final String? propertyCountry;
  final String? propertyState;
  final String? propertyCity;
  final String? propertyListingType;
  final String? propertyCost;
  final String? propertyThumbnail;

  factory RealEstateDatum.fromJson(Map<String, dynamic> json) {
    return RealEstateDatum(
      propertyId: json["propertyId"],
      propertyType: json["propertyType"],
      propertyTitle: json["propertyTitle"],
      propertySummary: json["propertySummary"],
      propertyCountry: json["propertyCountry"],
      propertyState: json["propertyState"],
      propertyCity: json["propertyCity"],
      propertyListingType: json["propertyListingType"],
      propertyCost: json["propertyCost"],
      propertyThumbnail: json["propertyThumbnail"],
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
  final String? next;

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
