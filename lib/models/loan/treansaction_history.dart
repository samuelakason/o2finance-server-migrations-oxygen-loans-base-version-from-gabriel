class TransactionHistory {
  TransactionHistory({
    required this.data,
    required this.links,
    required this.meta,
    required this.message,
    required this.status,
  });

  final List<TransactionDatum> data;
  final Links? links;
  final Meta? meta;
  final String? message;
  final bool? status;

  factory TransactionHistory.fromJson(Map<String, dynamic> json) {
    return TransactionHistory(
      data: json["data"] == null
          ? []
          : List<TransactionDatum>.from(
              json["data"]!.map((x) => TransactionDatum.fromJson(x))),
      links: json["links"] == null ? null : Links.fromJson(json["links"]),
      meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      message: json["message"],
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data.map((x) => x?.toJson()).toList(),
        "links": links?.toJson(),
        "meta": meta?.toJson(),
        "message": message,
        "status": status,
      };
}

class TransactionDatum {
  TransactionDatum({
    required this.transactionId,
    required this.transactionCategory,
    required this.transactionDescription,
    required this.transactionStatus,
    required this.transactionAmount,
    required this.transactionDate,
  });

  final int? transactionId;
  final String? transactionCategory;
  final String? transactionDescription;
  final String? transactionStatus;
  final String? transactionAmount;
  final DateTime? transactionDate;

  factory TransactionDatum.fromJson(Map<String, dynamic> json) {
    return TransactionDatum(
      transactionId: json["transactionId"],
      transactionCategory: json["transactionCategory"],
      transactionDescription: json["transactionDescription"],
      transactionStatus: json["transactionStatus"],
      transactionAmount: json["transactionAmount"],
      transactionDate: DateTime.tryParse(json["transactionDate"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "transactionId": transactionId,
        "transactionCategory": transactionCategory,
        "transactionDescription": transactionDescription,
        "transactionStatus": transactionStatus,
        "transactionAmount": transactionAmount,
        "transactionDate": transactionDate?.toIso8601String(),
      };
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

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
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

  final int? currentPage;
  final int? from;
  final int? lastPage;
  final List<Link> links;
  final String? path;
  final int? perPage;
  final int? to;
  final int? total;

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

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": links.map((x) => x?.toJson()).toList(),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
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

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
