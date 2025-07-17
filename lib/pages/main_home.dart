import 'package:flutter/material.dart';
import 'package:graphic_sleep_sample/charts/sleep_top.dart';
import 'package:graphic_sleep_sample/charts/sleep_bottom.dart';
import 'package:graphic_sleep_sample/utils/size_and_time.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const double totalHeight = 450;
    const int startTime = 18;

    final timeData = calculateSizeAndTime(
      height: totalHeight,
      startTime: startTime,
    );

    return Scaffold(
      appBar: AppBar(title: const Text('graphic 睡眠グラフ'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.only(top: 48, left: 48, right: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SleepTopChart(
                topHeight: timeData['topSize'],
                topStartTime: timeData['topStartTime'],
                topEndTime: timeData['topEndTime'],
              ),
              SleepBottomChart(
                bottomHeight: timeData['bottomSize'],
                bottomStartTime: timeData['bottomStartTime'],
                bottomEndTime: timeData['bottomEndTime'],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
