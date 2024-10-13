class LogedInUser {
  LogedInUser({
    required this.image,
    required this.name,
    required this.email,
  });

  late final String image;
  late final String name;
  late final String email;

  LogedInUser.fromJson(Map<String, dynamic> json) {
    image = json['image'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['image'] = image;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}