import 'package:flutter/material.dart';
import 'package:list_todo3/brain/const.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class DeleteBottomSheetView extends StatelessWidget {
  const DeleteBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewBrain>(
      builder: (context, viewBrain, child) {
        return Container(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    viewBrain.deleteAllTask();
                    Navigator.of(context).pop();
                  },
                  child: Text('Delete All'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: viewBrain.clrlvl3,
                      foregroundColor: viewBrain.clrlvl2)),
              SizedBox(
                width: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    viewBrain.deleteCompletedTask();
                    Navigator.of(context).pop();
                  },
                  child: Text('Delete Completed'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: viewBrain.clrlvl3,
                      foregroundColor: viewBrain.clrlvl2)),
              ElevatedButton(
                  onPressed: () {
                    viewBrain.createContentsForShare();
                    Share.share(viewBrain.shareList);
                  },
                  child: Text('share'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: viewBrain.clrlvl3,
                      foregroundColor: viewBrain.clrlvl2)),
            ],
          ),
        );
      },
    );
  }
}
