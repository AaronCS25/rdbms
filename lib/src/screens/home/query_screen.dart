import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class QueryScreen extends StatelessWidget {
  QueryScreen({super.key});
  static const String name = 'query-screen';

  final tables = ["users", "cars", "vehicles", "dni"];
  final columns = ["Id", "Nombre", "Apellido"];
  final rows = [
    ["1", "Juan", "Pérez"],
    ["2", "María", "López"],
    ["3", "Carlos", "Flores"],
    ["4", "Laura", "González"],
    ["5", "Andrés", "Martínez"],
    ["6", "Ana", "Ramírez"],
    ["7", "Pedro", "Díaz"],
    ["8", "Isabel", "Gómez"],
    ["9", "Roberto", "Luna"],
    ["10", "Luis", "Sánchez"],
    ["11", "Carmen", "Pérez"],
    ["12", "Javier", "González"],
  ];

  List<DataColumn> _buildDataColumns() {
    return columns.map((header) => DataColumn(label: Text(header))).toList();
  }

  List<DataRow> _buildDataRows() {
    return rows.map((data) {
      return DataRow(
          cells: data.map((cellData) => DataCell(Text(cellData))).toList());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ListOfTables(
            tablesNames: tables,
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                const Expanded(flex: 1, child: SQLQueriesText()),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text("Data output"),
                          SizedBox(width: 28),
                          Text("Messages"),
                          SizedBox(width: 28),
                          Text("Notifications")
                        ],
                      ),
                      const SizedBox(height: 4),
                      Expanded(
                        child: TableResponseWidget(
                          columns: _buildDataColumns(),
                          rows: _buildDataRows(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TableResponseWidget extends StatelessWidget {
  const TableResponseWidget({
    super.key,
    required this.columns,
    required this.rows,
  });

  final List<DataColumn> columns;
  final List<DataRow> rows;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Align(
        alignment: Alignment.topLeft,
        child: DataTable(
          // columnSpacing: 12.0,
          columns: columns,
          rows: rows,
          dividerThickness: 2.0,
          border: TableBorder.all(
            color: Colors.white,
            width: 0.5,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}

class SQLQueriesText extends StatelessWidget {
  const SQLQueriesText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      maxLines: null,
      expands: true,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        hintText: 'SELECT * FROM TABLE1',
        border: OutlineInputBorder(),
      ),
      textAlignVertical: TextAlignVertical.top,
    );
  }
}

class ListOfTables extends StatelessWidget {
  const ListOfTables({
    super.key,
    required this.tablesNames,
  });

  final List<String> tablesNames;
  final isTableRefreshed = true;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, top: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Table editor",
                style: textStyle.titleLarge,
              ),
            ),
          ),
          const SizedBox(height: 8),
          const Divider(
            thickness: 1.0,
            color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Text(
                  "Tables (${tablesNames.length})",
                  style: textStyle.titleMedium,
                ),
                const Spacer(),
                PopupMenuButton(
                  onSelected: (value) {},
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        value: 'alphabetic',
                        child: Text("Ordenar por nombre"),
                      ),
                      const PopupMenuItem(
                        value: 'fecha',
                        child: Text("Ordenar por fecha"),
                      ),
                    ];
                  },
                  child: const Icon(Icons.sort_outlined),
                ),
                IconButton(
                  onPressed: () {},
                  icon: isTableRefreshed
                      ? const Icon(Icons.refresh_outlined)
                      : SpinPerfect(
                          infinite: true,
                          child: const Icon(Icons.refresh_outlined)),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              itemCount: tablesNames.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: TableNameWidget(tableName: tablesNames[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TableNameWidget extends StatelessWidget {
  const TableNameWidget({super.key, required this.tableName});

  final String tableName;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0),
        child: Row(
          children: [
            const Icon(Icons.table_chart_rounded),
            const SizedBox(width: 16),
            Text(tableName, style: textStyle.bodyMedium),
            const Spacer(),
            const Icon(Icons.keyboard_arrow_down_outlined),
          ],
        ),
      ),
    );
  }
}
