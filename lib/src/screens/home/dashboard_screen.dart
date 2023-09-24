import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const String name = 'dashboard-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Table(
        border: TableBorder.all(),
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(0.25),
          1: FlexColumnWidth(0.75),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          TableRow(
            children: <Widget>[
              const OwnContainer(
                title: "Projects",
                subTitles: ["All projects"],
                routes: ["/"],
              ),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.top,
                child: Container(
                  height: 32,
                  width: 32,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          TableRow(
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
            children: <Widget>[
              Container(
                height: 64,
                width: 128,
                color: Colors.purple,
              ),
              Container(
                height: 32,
                color: Colors.yellow,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OwnContainer extends StatelessWidget {
  const OwnContainer({
    super.key,
    required this.title,
    required this.subTitles,
    required this.routes,
  });

  final String title;
  final List<String> subTitles;
  final List<String> routes;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Projects",
          style: textStyle.titleMedium!
              .copyWith(color: const Color.fromRGBO(107, 112, 112, 1.0)),
        ),
        const SizedBox(height: 24),
        ListView.builder(
          shrinkWrap: true,
          itemCount: subTitles.length,
          itemBuilder: (context, index) {
            final subTitle = subTitles[index];
            // final route = routes[index];
            return TextButton(
              onPressed: () {
                
              },
              child: Text(
                subTitle,
                style: textStyle.bodyMedium,
              ),
            );
          },
        )
      ],
    );
  }
}
