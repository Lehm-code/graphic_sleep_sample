Map<String, dynamic> calculateSizeAndTime({
  required double height,
  required int startTime,
}) {
  double topHeight = height * (24 - startTime) / 24;
  double bottomHeight = height * startTime / 24;

  // 時間計算
  int topStartTime = startTime;
  int topEndTime = 24;

  int bottomStartTime = 0;
  int bottomEndTime = startTime;

  return {
    'topSize': topHeight,
    'topStartTime': topStartTime,
    'topEndTime': topEndTime,
    'bottomSize': bottomHeight,
    'bottomStartTime': bottomStartTime,
    'bottomEndTime': bottomEndTime,
  };
}
