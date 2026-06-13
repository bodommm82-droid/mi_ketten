class SyncService {
  bool syncing = false;

  Future<void> sync() async {
    syncing = true;
    await Future.delayed(const Duration(seconds: 1));
    syncing = false;
  }
}
