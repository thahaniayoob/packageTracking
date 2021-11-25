
class Shipping {
  Shipping({
    required this.id,
    required this.name,
    required this.category,
  });

  String id;
  String category;
  String name;
}

class Images {
  Images({required this.imgss});
  String imgss;
}

List<Shipping> shipvalues = [
  Shipping(category: "Womens", id: "1", name: "Lola Sandals"),
  Shipping(category: "men", id: "2", name: "Lola Sandals"),
  Shipping(category: "kids", id: "3", name: "Lola Sandals"),
];
