class ProfileModel {
  final int id;
  final String name;
  final String email;

  ProfileModel({required this.id, required this.name, required this.email});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
      );
}
