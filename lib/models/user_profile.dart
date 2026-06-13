class UserProfile {
  final String uid;
  final String name;
  final int age;
  final String loveLanguage;
  final String avatarUrl;

  UserProfile({
    required this.uid,
    required this.name,
    required this.age,
    required this.loveLanguage,
    required this.avatarUrl,
  });

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'name': name,
        'age': age,
        'loveLanguage': loveLanguage,
        'avatarUrl': avatarUrl,
      };

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        uid: json['uid'],
        name: json['name'],
        age: json['age'],
        loveLanguage: json['loveLanguage'],
        avatarUrl: json['avatarUrl'],
      );
}
