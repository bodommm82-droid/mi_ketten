class SyncQueue {
  final List<Function> _queue = [];
  bool _running = false;

  void add(Function task) {
    _queue.add(task);
    _run();
  }

  Future<void> _run() async {
    if (_running) return;
    _running = true;
    while (_queue.isNotEmpty) {
      final task = _queue.removeAt(0);
      await task();
    }
    _running = false;
  }
}
