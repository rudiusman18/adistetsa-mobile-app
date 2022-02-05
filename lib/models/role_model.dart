class RolesModel {
  String name = '';

  RolesModel({
    required this.name,
  });

  factory RolesModel.fromJson(Map<String, dynamic> json) {
    return RolesModel(
      name: json['name'],
    );
  }
}
