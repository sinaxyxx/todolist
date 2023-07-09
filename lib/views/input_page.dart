import 'package:flutter/material.dart';
import 'package:list_todo3/views/task_info_view.dart';
import 'package:list_todo3/views/task_list_view.dart';

import 'bottom_sheet_view.dart';
import 'header_view.dart';

class InputPage extends StatelessWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: HeaderView(),
            ),
            Expanded(
              flex: 1,
              child: TaskInfoView(),
            ),
            Expanded(flex: 7, child: TaskListView()),
          ],
        ),
      ),
      floatingActionButton: BottomSheetView(),
    );
  }
}
