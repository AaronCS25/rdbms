import 'package:flutter/material.dart';

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
