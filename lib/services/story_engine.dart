class StoryEngine {
  int chapter = 1;

  String next() {
    chapter++;
    return "Következő fejezet: $chapter";
  }
}
