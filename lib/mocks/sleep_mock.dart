// 睡眠データ
final List<Map<String, dynamic>> _sleepWeeklyRaw = [
  {'date': '日', 'start': 22, 'end': 4},
  {'date': '月', 'start': 0, 'end': 5.5},
  {'date': '月', 'start': 19, 'end': 21},
  {'date': '火', 'start': 23.5, 'end': 4},
  {'date': '火', 'start': 10, 'end': 12},
  {'date': '水', 'start': 1, 'end': 6},
  {'date': '木', 'start': 23, 'end': 4.5},
  {'date': '木', 'start': 11, 'end': 12},
  {'date': '木', 'start': 17.5, 'end': 19},
  {'date': '金', 'start': 0, 'end': 5},
  {'date': '土', 'start': 1, 'end': 3},
  {'date': '土', 'start': 5, 'end': 8},
];

const List<String> weekDays = ['日', '月', '火', '水', '木', '金', '土'];

String getNextDay(String currentDay) {
  final index = weekDays.indexOf(currentDay);
  return weekDays[(index + 1) % 7];
}

List<Map<String, dynamic>> unfoldSleepData(List<Map<String, dynamic>> raw) {
  final result = <Map<String, dynamic>>[];
  for (var entry in raw) {
    final date = entry['date'];
    final start = entry['start'] as num;
    final end = entry['end'] as num;
    if (start < end) {
      if (start < 18 && 18 < end) {
        result.add({'date': date, 'start': start, 'end': 18});
        result.add({'date': getNextDay(date), 'start': 18, 'end': end});
      } else {
        result.add({'date': date, 'start': start, 'end': end});
      }
    } else {
      result.add({'date': date, 'start': start, 'end': 24});
      result.add({'date': date, 'start': 0, 'end': end});
    }
  }
  return result;
}

final List<Map<String, dynamic>> mockSleepWeeklyData = unfoldSleepData(
  _sleepWeeklyRaw,
);
