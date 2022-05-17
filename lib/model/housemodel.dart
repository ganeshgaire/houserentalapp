class HouseModel {
  String? id;
  String? houseImage;
  String? houseName;
  String? location;
  String? bedroomNo;
  String? bathroomNo;
  String? price;

  HouseModel(
      {this.id,
      this.houseImage,
      this.houseName,
      this.location,
      this.bedroomNo,
      this.bathroomNo,
      this.price});

  HouseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    houseImage = json['house_image'];
    houseName = json['house_name'];
    location = json['location'];
    bedroomNo = json['bedroom_no'];
    bathroomNo = json['bathroom_no'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['house_image'] = houseImage;
    data['house_name'] = houseName;
    data['location'] = location;
    data['bedroom_no'] = bedroomNo;
    data['bathroom_no'] = bathroomNo;
    data['price'] = price;
    return data;
  }
}
