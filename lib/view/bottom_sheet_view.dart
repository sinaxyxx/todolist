import 'package:flutter/material.dart';
import 'package:list_todo3/brain/const.dart';
import 'package:list_todo3/view/task_input_page.dart';
import 'package:provider/provider.dart';

class BottomSheetView extends StatelessWidget {
  const BottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewBrain>(
      builder: (context, viewBrain, child) {
        return SizedBox(
          height: 60,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: viewBrain.clrlvl3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {
              viewBrain.showBottomSheet(TaskInputPage(), context);
            },
            child: Icon(
              Icons.add,
              color: viewBrain.clrlvl2,
            ),
          ),
        );
      },
    );
  }
}
