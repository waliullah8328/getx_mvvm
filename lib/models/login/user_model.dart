class UserModel {
  String? status;
  int? userPk;
  String? token;

  UserModel({this.status, this.userPk, this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userPk = json['user_pk'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['user_pk'] = this.userPk;
    data['token'] = this.token;
    return data;
  }
}