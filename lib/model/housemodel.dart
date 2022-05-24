class HouseModel {
  String? id;
  String? houseImage;
  String? houseName;
  String? location;
  String? phonenumber;
  String? bedroomNo;
  String? bathroomNo;
  String? price;
  String? description;

  HouseModel(
      {this.id,
      this.houseImage,
      this.houseName,
      this.location,
      this.phonenumber,
      this.bedroomNo,
      this.bathroomNo,
      this.price,
      this.description});

  HouseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    houseImage = json['house_image'];
    houseName = json['house_name'];
    location = json['location'];
    phonenumber = json['owner_no'];
    bedroomNo = json['bedroom_no'];
    bathroomNo = json['bathroom_no'];
    price = json['price'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['house_image'] = houseImage;
    data['house_name'] = houseName;
    data['location'] = location;
    data['owner_no'] = phonenumber;
    data['bedroom_no'] = bedroomNo;
    data['bathroom_no'] = bathroomNo;
    data['price'] = price;
    data['description'] = description;
    return data;
  }
}
