import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';
import 'package:graphic_sleep_sample/mocks/sleep_mock.dart';

class SleepTopChart extends StatelessWidget {
  final double topHeight;
  final int topStartTime;
  final int topEndTime;
  const SleepTopChart({
    super.key,
    required this.topHeight,
    required this.topStartTime,
    required this.topEndTime,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: topHeight,
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
              min: topEndTime,
              max: topStartTime,
              ticks: [3, 6, 9, 12, 15, 18, 21, 24],
              formatter: (num val) => '${val.toInt()}:00',
            ),
          ),
          'end': Variable(
            accessor: (map) => (map as Map<String, dynamic>)['end'] as num,
            scale: LinearScale(
              min: topEndTime,
              max: topStartTime,
              ticks: [3, 6, 9, 12, 15, 18, 21, 24],
              formatter: (num val) => '${val.toInt()}:00',
            ),
          ),
        },
        marks: [
          IntervalMark(
            position: Varset('date') * (Varset('start') + Varset('end')),
            color: ColorEncode(value: Colors.pink),
            size: SizeEncode(value: 30),
          ),
        ],
        axes: [Defaults.horizontalAxis..label = null, Defaults.verticalAxis],
      ),
    );
  }
}
