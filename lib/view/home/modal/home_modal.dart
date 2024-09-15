class HomeModal {
  int id;
  String name;

  HomeModal._({required this.id, required this.name});

  factory HomeModal(Map json) {
    return HomeModal._(id: json['id'], name: json['name']);
  }
}

List<HomeModal> wishProductList=[];
List<HomeModal> cartProductList=[];

List products = [
  {"id": 1, "name": "Wireless Headphones"},
  {"id": 2, "name": "Gaming Laptop"},
  {"id": 3, "name": "Smartphone"},
  {"id": 4, "name": "Bluetooth Speaker"},
  {"id": 5, "name": "Smartwatch"},
  {"id": 6, "name": "4K Monitor"},
  {"id": 7, "name": "Wireless Mouse"},
  {"id": 8, "name": "Mechanical Keyboard"},
  {"id": 9, "name": "Tablet"},
  {"id": 10, "name": "Portable Charger"}
];
