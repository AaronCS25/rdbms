class QueryResponseModel {
  final List<String> tables;
  final List<String> columns;
  final List<List<dynamic>> rows;

  QueryResponseModel({
    required this.tables,
    required this.columns,
    required this.rows,
  });

  factory QueryResponseModel.fromJson(Map<String, dynamic> json) =>
      QueryResponseModel(
        tables: json["existingTables"],
        columns: json["columns"],
        rows: json["rows"],
      );
}
