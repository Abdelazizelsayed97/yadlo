class ApiPageInfo {
  final int? page;
  final int? limit;
  final bool? hasNext;

  ApiPageInfo({
    this.page,
    this.limit,
    this.hasNext,
  });

  factory ApiPageInfo.fromJson(Map<String, dynamic> json) => ApiPageInfo(
        page: json["page"],
        limit: json["limit"],
        hasNext: json["hasNext"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "limit": limit,
        "hasNext": hasNext,
      };
}
