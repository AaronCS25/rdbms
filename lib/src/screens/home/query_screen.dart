import 'package:animate_do/animate_do.dart';
import 'package:dbms/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class QueryScreen extends StatefulWidget {
  const QueryScreen({super.key});
  static const String name = 'query-screen';

  @override
  State<QueryScreen> createState() => _QueryScreenState();
}

class _QueryScreenState extends State<QueryScreen> {
  double timeToExecute = 0.0;

  // final tables = ["users", "cars", "vehicles", "dni"];
  List<String> tables = [];

  // final columns = ["Id", "Nombre", "Apellido"];
  List<String> columns = [];

  TextEditingController queryController = TextEditingController();

  // final rows = [
  //   ["1", "Juan", "Pérez"],
  //   ["2", "María", "López"],
  //   ["3", "Carlos", "Flores"],
  //   ["4", "Laura", "González"],
  //   ["5", "Andrés", "Martínez"],
  //   ["6", "Ana", "Ramírez"],
  //   ["7", "Pedro", "Díaz"],
  //   ["8", "Isabel", "Gómez"],
  //   ["9", "Roberto", "Luna"],
  //   ["10", "Luis", "Sánchez"],
  //   ["11", "Carmen", "Pérez"],
  //   ["12", "Javier", "González"]
  // ];

  List<List<String>> rows = [];

  int selectedTab = 0;
  late Widget selectedView;

  List<DataColumn> _buildDataColumns() {
    return columns.map((header) => DataColumn(label: Text(header))).toList();
  }

  List<DataRow> _buildDataRows() {
    return rows.map((data) {
      return DataRow(
          cells: data.map((cellData) => DataCell(Text(cellData))).toList());
    }).toList();
  }

  bool isTableRefreshed = true;

  // String messageFormated = '';

  String formatSQLQueries(String text) {
    final lines = text.split('\n');
    final value =
        lines.where((line) => !line.trimLeft().startsWith('--')).join('\n');
    return value;
  }

  @override
  void initState() {
    super.initState();
    rows.isNotEmpty && columns.isNotEmpty
        ? selectedView = TableResponseWidget(
            columns: _buildDataColumns(),
            rows: _buildDataRows(),
          )
        : selectedView = const Text("No data");
  }

  void _changeTab(int index) {
    setState(
      () {
        selectedTab = index;
        if (selectedTab == 0) {
          selectedView = rows.isNotEmpty && columns.isNotEmpty
              ? TableResponseWidget(
                  columns: _buildDataColumns(),
                  rows: _buildDataRows(),
                )
              : const Text("No data");
        } else if (selectedTab == 1) {
          selectedView = MessageView(
              message: formatSQLQueries(queryController.text),
              timeToExecute: timeToExecute);
        } else if (selectedTab == 2) {
          selectedView = const Text("Notifications");
        }
      },
    );
  }

  void sendQueryToApi(String query) {
    final value = formatSQLQueries(query);
    print("Query enviado a la API: $value");
    _changeTab(0);
    setState(() {});
  }

  void refreshTable() {
    print("Refresh table main!");
    isTableRefreshed = false;
    setState(() {});
    //TODO: AQUÍ SE HARÁ UN query de algo
    Future.delayed(const Duration(seconds: 5), () {
      isTableRefreshed = true;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          ListOfTables(
            tablesNames: tables,
            isTableRefreshed: isTableRefreshed,
            refreshTable: refreshTable,
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                sendQueryToApi(queryController.text);
                              },
                              icon: const Icon(
                                Icons.play_arrow_rounded,
                                color: Color.fromRGBO(77, 255, 174, 1.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          child: SQLQueriesText(
                        controller: queryController,
                      )),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () => _changeTab(0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 8,
                                ),
                                color: selectedTab == 0
                                    ? Colors.blue
                                    : Colors.grey,
                                child: const Center(child: Text("Data output")),
                              ),
                            ),
                            // const SizedBox(width: 28),
                            InkWell(
                              onTap: () => _changeTab(1),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 8,
                                ),
                                color: selectedTab == 1
                                    ? Colors.blue
                                    : Colors.grey,
                                child: const Center(child: Text("Messages")),
                              ),
                            ),
                            // const SizedBox(width: 28),
                            InkWell(
                              onTap: () => _changeTab(2),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 8,
                                ),
                                color: selectedTab == 2
                                    ? Colors.blue
                                    : Colors.grey,
                                child:
                                    const Center(child: Text("Notifications")),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(height: 4),
                      Expanded(
                        child: selectedView,
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
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: null,
      expands: true,
      keyboardType: TextInputType.multiline,
      decoration: const InputDecoration(
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
    required this.isTableRefreshed,
    required this.refreshTable,
  });

  final List<String> tablesNames;
  final bool isTableRefreshed;
  final Function refreshTable;

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
                  onPressed: () {
                    refreshTable();
                  },
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

class MessageView extends StatelessWidget {
  const MessageView({
    super.key,
    required this.message,
    required this.timeToExecute,
  });

  final String message;
  final double timeToExecute;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text('Message: \n $message'),
            ),
            const SizedBox(height: 8),
            Text(
              'Tiempo de ejecución: $timeToExecute ms',
            ),
          ],
        ),
      ),
    );
  }
}
