class QueryResponseModel {
  final List<String> tables;
  final List<String> columns;
  final List<List<String>> rows;
  final Map<String, int> times;

  QueryResponseModel({
    required this.tables,
    required this.columns,
    required this.rows,
    required this.times,
  });

  factory QueryResponseModel.fromJson(Map<String, dynamic> json) =>
      QueryResponseModel(
        tables: json["tables"],
        columns: json["columns"],
        rows: json["rows"],
        times: json["times"],
      );
}
