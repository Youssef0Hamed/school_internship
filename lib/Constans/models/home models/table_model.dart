class TableModel {
  final int id;
  final String name;
  final int capacity;
  final String locationType;
  final int restaurantId;

  TableModel({
    required this.id,
    required this.name,
    required this.capacity,
    required this.locationType,
    required this.restaurantId,
  });

  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      capacity: json['capacity'] ?? 0,
      locationType: json['location_type'] ?? '',
      restaurantId: json['restaurant_id'] ?? 0,
    );
  }
}