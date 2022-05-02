class UserDetail {
  String? firstname;
  String? lastname;
  String? phonenumber;

  UserDetail({this.firstname, this.lastname, this.phonenumber});

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        firstname: json['first_name'],
        lastname: json['last_name'],
        phonenumber: json['mobile_no'],
      );
}
