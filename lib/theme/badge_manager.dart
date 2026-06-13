class BadgeManager {
  final Set<String> unlocked = {};

  void unlock(String badgeId) {
    unlocked.add(badgeId);
  }

  bool isUnlocked(String badgeId) => unlocked.contains(badgeId);
}
