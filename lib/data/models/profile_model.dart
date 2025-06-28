class ProfileModel {
  final String fullName;
  final String id;
  final String imageUrl;

  ProfileModel({
    required this.fullName,
    required this.id,
    required this.imageUrl,
  });

  factory ProfileModel.empty() {
    return ProfileModel(fullName: '', id: '', imageUrl: '');
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      fullName: map['fullName'] ?? '',
      id: map['id'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}
