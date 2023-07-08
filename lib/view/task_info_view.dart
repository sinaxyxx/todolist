import 'package:flutter/material.dart';
import 'package:list_todo3/brain/const.dart';
import 'package:provider/provider.dart';

class TaskInfoView extends StatelessWidget {
  const TaskInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppViewBrain>(
      builder: (context, viewBrain, child) {
        return Container(
          margin: EdgeInsets.all(10),
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: viewBrain.clrlvl2),
                child: Column(children: [
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Text(
                          '${viewBrain.numTasks}',
                          style:
                              TextStyle(fontSize: 24, color: viewBrain.clrlvl4),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Text(
                          'Total Tasks',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: viewBrain.clrlvl4),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: viewBrain.clrlvl2),
                child: Column(children: [
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Text(
                          '${viewBrain.remainingTask}',
                          style:
                              TextStyle(fontSize: 24, color: viewBrain.clrlvl4),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: Text(
                          'Remaining',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: viewBrain.clrlvl4),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ]),
        );
      },
    );
  }
}
