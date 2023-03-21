class Fruits {
  String? status;
  String? message;
  List<Items>? items;

  Fruits({this.status, this.message, this.items});

  Fruits.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? itemImage;
  String? itemName;
  String? itemDetails;

  Items({this.itemImage, this.itemName, this.itemDetails});

  Items.fromJson(Map<String, dynamic> json) {
    itemImage = json['itemImage'];
    itemName = json['itemName'];
    itemDetails = json['itemDetails'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemImage'] = this.itemImage;
    data['itemName'] = this.itemName;
    data['itemDetails'] = this.itemDetails;
    return data;
  }
}
