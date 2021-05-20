class UserLogin {
  String data;
  String message;
  bool success;

  UserLogin({this.data, this.message, this.success});

  UserLogin.fromJson(Map<String, dynamic> json) {
    data = json['Data'];
    message = json['Message'];
    success = json['Success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Data'] = this.data;
    data['Message'] = this.message;
    data['Success'] = this.success;
    return data;
  }
}
