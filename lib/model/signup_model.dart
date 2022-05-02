class SignupModel {
  String? firstname;
  String? lastname;
  String? phonenumber;
  String? password;

  SignupModel({this.firstname, this.lastname, this.phonenumber, this.password});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'first_name': firstname,
      'last_name': lastname,
      'mobile_no': phonenumber,
      'password': password,
      "device_token":
          "eEcu_X4XMkspr7fsv6IlrL:APA91bFcUP60TtS7Nf-WMBhpxhFbXLuzYvVmo6e7Iczct6oNH3XUFrM1k0J2sr5pkQ-RGbF7Sssf7JWY5CZnEiApFnq5lvj4MajFpKZ7aqr32Jzxn1IR6W_zoJO7-vl-163q3xnEQ9QS"
    };
    return map;
  }
}
