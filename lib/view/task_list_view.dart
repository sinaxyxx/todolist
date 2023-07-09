import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../brain/viewModel.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewBrain>(
      builder: (context, viewBrain, child) {
        return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                color: viewBrain.clrlvl2),
            child: Padding(
                padding: EdgeInsets.all(16),
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 15,
                      );
                    },
                    itemCount: viewBrain.numTasks,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: UniqueKey(),
                        background: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(Icons.delete, color: Colors.red.shade500),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red.shade200,
                          ),
                        ),
                        onDismissed: (direction) {
                          viewBrain.deleteTask(index);
                        },
                        child: Container(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: viewBrain.clrlvl1,
                          ),
                          child: CheckboxListTile(
                              activeColor: viewBrain.clrlvl3,
                              checkColor: viewBrain.clrlvl1,
                              controlAffinity: ListTileControlAffinity.leading,
                              title: Text(
                                viewBrain.taskTitle(index),
                                style: TextStyle(
                                    color: viewBrain.clrlvl4,
                                    fontWeight: FontWeight.w500),
                              ),
                              value: viewBrain.tasks[index].complete,
                              onChanged: (value) {
                                viewBrain.setValue(index, value!);
                              },
                              side: BorderSide(
                                  width: 2, color: viewBrain.clrlvl3)),
                        ),
                      );
                    })));
      },
    );
  }
}
