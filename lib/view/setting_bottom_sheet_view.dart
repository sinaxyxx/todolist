import 'package:flutter/material.dart';
import 'package:list_todo3/brain/const.dart';
import 'package:provider/provider.dart';

class SettingBottomSheetView extends StatelessWidget {
  const SettingBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    return Consumer<AppViewBrain>(
      builder: (context, viewBrain, child) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            height: 70,
            child: Center(
              child: SizedBox(
                width: 250,
                height: 40,
                child: TextField(
                  controller: textController,
                  style: TextStyle(
                      color: viewBrain.clrlvl4, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  autocorrect: false,
                  autofocus: true,
                  cursorColor: viewBrain.clrlvl4,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 5),
                      filled: true,
                      fillColor: viewBrain.clrlvl2,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      )),
                  onSubmitted: (value) {
                    if (textController.text.isNotEmpty) {
                      viewBrain.changeUser(textController.text);
                      textController.clear();
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
