class LevelManager {
  int xp = 0;

  int get level => (xp / 100).floor();

  void addXp(int amount) {
    xp += amount;
  }
}
