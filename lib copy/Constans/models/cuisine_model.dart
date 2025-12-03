class CuisineModel {
  final String id, name, icon;
  bool isActive;
  
  CuisineModel({
    required this.id,
    required this.name,
    required this.icon,
    this.isActive = false,
  });
}
