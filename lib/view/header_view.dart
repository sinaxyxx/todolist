import 'package:flutter/material.dart';
import 'package:list_todo3/brain/const.dart';
import 'package:list_todo3/view/setting_bottom_sheet_view.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'delete_bottom_sheet_view.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewBrain>(
      builder: (context, viewBrain, child) {
        return Row(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(left: 15),
                child: Column(children: [
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            '${viewBrain.getTodayDate()}',
                            style: TextStyle(
                                fontSize: 18,
                                color: viewBrain.clrlvl4,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            '${viewBrain.username} のToDo',
                            style: TextStyle(
                                fontSize: 42,
                                color: viewBrain.clrlvl4,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  )
                ]),
              ),
            ),
            Expanded(
                flex: 1,
                child: InkWell(
                  child: SizedBox(
                    height: double.infinity,
                    child: Icon(
                      Icons.account_box,
                      size: 30,
                      color: viewBrain.clrlvl4,
                    ),
                  ),
                  onTap: () {
                    viewBrain.showBottomSheet(
                        SettingBottomSheetView(), context);
                  },
                )),
            Expanded(
                flex: 1,
                child: InkWell(
                  child: SizedBox(
                    height: double.infinity,
                    child: Icon(
                      Icons.share,
                      size: 30,
                      color: viewBrain.clrlvl4,
                    ),
                  ),
                  onTap: () {
                    if (viewBrain.tasks.isNotEmpty) {
                      viewBrain.createContentsForShare();
                      Share.share(viewBrain.shareList);
                    }
                  },
                )),
            Expanded(
                flex: 1,
                child: InkWell(
                  child: SizedBox(
                    height: double.infinity,
                    child: Icon(
                      Icons.delete,
                      size: 30,
                      color: viewBrain.clrlvl4,
                    ),
                  ),
                  onTap: () {
                    viewBrain.showBottomSheet(DeleteBottomSheetView(), context);
                  },
                )),
          ],
        );
      },
    );
  }
}
