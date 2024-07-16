

class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final List<String> images;
  final String categoryImage;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.categoryImage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    // Handle optional fields with default values or null checks
    var name = json['title'] ?? "No Name Available";
    var description = json['description'] ?? "No Description Available";
    var imageUrl = json['images'] ?? []; // Assuming images is always present as an array
    var categoryImage = json['category']['image'] ?? "No Category Image Available";

    return Product(
      id: json['id'],
      name: name,
      description: description,
      price: json['price'].toDouble(),
      images: List<String>.from(imageUrl),
      categoryImage: categoryImage,
    );
  }
}

