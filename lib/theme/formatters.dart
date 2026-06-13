class Formatters {
  static String date(DateTime d) =>
      "${d.year}.${d.month.toString().padLeft(2, '0')}.${d.day.toString().padLeft(2, '0')}";

  static String percent(double value) => "${value.toStringAsFixed(1)}%";
}
