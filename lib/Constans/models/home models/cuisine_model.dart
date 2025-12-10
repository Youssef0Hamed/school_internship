class CuisineModel {
  final int? id; // nullable for new cuisines before API returns an ID
  final String name;
  final String icon;
  bool isActive = false; // Local state to track if cuisine is active

  CuisineModel({
    this.id,
    required this.name,
    required this.icon,
  });

  factory CuisineModel.fromJson(Map<String, dynamic> json) {
    return CuisineModel(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "icon": icon,
    };
  }
}