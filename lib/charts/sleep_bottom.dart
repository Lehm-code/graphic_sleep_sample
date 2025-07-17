import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:graphic_sleep_sample/mocks/sleep_mock.dart';

class SleepBottomChart extends StatelessWidget {
  final double bottomHeight;
  final int bottomStartTime;
  final int bottomEndTime;
  const SleepBottomChart({
    super.key,
    required this.bottomHeight,
    required this.bottomStartTime,
    required this.bottomEndTime,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: bottomHeight,
      child: Chart(
        padding: (_) => EdgeInsets.zero,
        data: mockSleepWeeklyData,
        variables: {
          'date': Variable(
            accessor: (map) => (map as Map<String, dynamic>)['date'] as String,
            scale: OrdinalScale(),
          ),
          'start': Variable(
            accessor: (map) => (map as Map<String, dynamic>)['start'] as num,
            scale: LinearScale(
              min: bottomEndTime,
              max: bottomStartTime,
              ticks: [3, 6, 9, 12, 15, 18, 21, 24],
              formatter: (num val) => '${val.toInt()}:00',
            ),
          ),
          'end': Variable(
            accessor: (map) => (map as Map<String, dynamic>)['end'] as num,
            scale: LinearScale(
              min: bottomEndTime,
              max: bottomStartTime,
              ticks: [3, 6, 9, 12, 15, 18, 21, 24],
              formatter: (num val) => '${val.toInt()}:00',
            ),
          ),
        },
        marks: [
          IntervalMark(
            position: Varset('date') * (Varset('start') + Varset('end')),
            color: ColorEncode(value: Colors.pink),
            size: SizeEncode(value: 25),
          ),
        ],
        axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
      ),
    );
  }
}
