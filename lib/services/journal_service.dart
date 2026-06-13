class JournalService {
  final List<String> entries = [];

  void addEntry(String text) {
    entries.add(text);
  }

  List<String> getAll() => entries;
}
