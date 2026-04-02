class TimePeriods {
  final int id;
  final String name;
  final List<Period> periods;

  TimePeriods({
    required this.id,
    required this.name,
    required this.periods,
  });
}

class Period {
  final int id;
  final String range;
  final String imagePath;

  Period({
    required this.id,
    required this.range,
    required this.imagePath,
  });
}
