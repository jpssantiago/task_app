import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/pages/home/widgets/task_list.dart';
import 'package:task_app/providers/task_provider.dart';

import 'package:task_app/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Consumer<TaskProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: buildAppBar(),
        body: Container(
          width: size.width,
          height: size.height,
          color: Colors.white,
          child: TaskList(
            tasks: provider.tasks,
          ),
        ),
      ),
    );
  }
}
