class LoginRequestModel {
  String? email;
  String? password;

  LoginRequestModel({this.email, this.password});
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'username': email,
      'password': password,
      "device_token": "eyurwex5Rqy5Qvu8fz2OtV:APA91bF-C3fcf6sDkqccb2OqVt-zz"
    };
    return map;
  }
}
