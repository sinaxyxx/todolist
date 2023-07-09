import 'package:flutter/material.dart';
import 'package:list_todo3/view_model/viewModel.dart';
import 'package:provider/provider.dart';

class DeleteBottomSheetView extends StatelessWidget {
  const DeleteBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewBrain>(
      builder: (context, viewBrain, child) {
        return Container(
          decoration: BoxDecoration(color: viewBrain.clrlvl1),
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    viewBrain.deleteAllTask();
                    Navigator.of(context).pop();
                  },
                  child: Text('全削除'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: viewBrain.clrlvl3,
                      foregroundColor: viewBrain.clrlvl1)),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    viewBrain.deleteCompletedTask();
                    Navigator.of(context).pop();
                  },
                  child: Text('完了済ToDoを全削除'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: viewBrain.clrlvl3,
                      foregroundColor: viewBrain.clrlvl1)),
            ],
          ),
        );
      },
    );
  }
}
