class Room {
  final String roomId;
  final String hostId;
  final String? guestId;
  final bool isActive;
  final bool started;
  final String? currentQuestionId;
  final bool hostReady;
  final bool guestReady;

  Room({
    required this.roomId,
    required this.hostId,
    this.guestId,
    required this.isActive,
    required this.started,
    this.currentQuestionId,
    this.hostReady = false,
    this.guestReady = false,
  });

  Map<String, dynamic> toJson() => {
        'roomId': roomId,
        'hostId': hostId,
        'guestId': guestId,
        'isActive': isActive,
        'started': started,
        'currentQuestionId': currentQuestionId,
        'hostReady': hostReady,
        'guestReady': guestReady,
      };

  factory Room.fromJson(Map<String, dynamic> json) => Room(
        roomId: json['roomId'],
        hostId: json['hostId'],
        guestId: json['guestId'],
        isActive: json['isActive'] ?? false,
        started: json['started'] ?? false,
        currentQuestionId: json['currentQuestionId'],
        hostReady: json['hostReady'] ?? false,
        guestReady: json['guestReady'] ?? false,
      );
}
