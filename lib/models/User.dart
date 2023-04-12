/// user : {"id":1,"name":"Dr. Angeline Jerde",
/// "email":"swaniawski.lauren@example.net",
/// "email_verified_at":"2022-10-29T10:29:44.000000Z",
/// "created_at":"2022-10-29T10:29:44.000000Z",
/// "updated_at":"2022-10-29T10:29:44.000000Z"}
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNGE2MGVkODM5MjlmMDAzNzIwN2E5OGQ4OGQ3ODZmMWEzMGE4YWMxNjEyZGRjZTBkZmZkY2M4ZjZiNzI2NThiNTlkNzJhNTFlNGJlYjlhYWYiLCJpYXQiOjE2NjcwMzk0NDIuOTEyODUyLCJuYmYiOjE2NjcwMzk0NDIuOTEyODU3LCJleHAiOjE2OTg1NzU0NDIuODA0NjQ0LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.XIv-rCYm93m_kH-D2bmbJQ72qBsknAzM_9R1gw7wIt0GJQM_sktQa2n5REbHT590MgZmAZaCRenlyv1E1hswyatJa2_l4ev0r7ZJYmNdnhIvWrPuWxu_tG6htwU8HY24EfegFVzstcPdRbMAfAbkDiVvk1szCcyTvxQJ2BxXnZBJc_eM6wc_ugf9Lw9x23clYeNgcbEDh4skQ1gnl9vg0p5RCN5pjGvuLNyjOXJl2cB_2W4u20YWy1gaFTipghzTQ86yJwpLz_mC286v4p1jIYmJeUrrJId8pFjsDbxyNJnR7QPjXKS693bxyF6Xb4Zn23hcFVjTasac1R5DhxJSH7dbKqyuGsyiqSDu5mRZItHCDhgYWE7cmGEbXMvpSwHCVqOKUOGaz2LvlZdBMk7qkPzD8QpJ49tWLw4c3zLkxzqgZPyjHVkCCCi3FSFRwpuXEuI5aNRj-XF53VV2fi1n2AOECI_UmWUkAsSIuvA7uDmaI4U9hSvUvn7ynFAvCYuwtANMuZFqw-n4VaKOfIIhP0hSqdC3MeYcXXgAnOcsdUjOb5P28pCU6m76CP1hJlvqGZdDVJoCVOEwdQZ8AsZogjE3KGmscvGjTfcev32FhFGzyYiQjljCiwbm5OV5eH0LNWjHQD4exNP837vAtJpDWvVzoDmefnNQHlg74YMEBAY"

class User {
  User({
      this.user, 
      this.token,});

  User.fromJson(dynamic json) {
    user = json['MyUser'] != null ? MyUser.fromJson(json['MyUser']) : null;
    token = json['token'];
  }
  MyUser? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

/// id : 1
/// name : "Dr. Angeline Jerde"
/// email : "swaniawski.lauren@example.net"
/// email_verified_at : "2022-10-29T10:29:44.000000Z"
/// created_at : "2022-10-29T10:29:44.000000Z"
/// updated_at : "2022-10-29T10:29:44.000000Z"

class MyUser {
  MyUser({
      this.id, 
      this.name, 
      this.email, 
      this.emailVerifiedAt, 
      this.createdAt, 
      this.updatedAt,});

  MyUser.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['email_verified_at'] = emailVerifiedAt;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }

}