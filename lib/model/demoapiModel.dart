import 'package:hive/hive.dart';


class DemoInfoApi {

  int? userId;
  int? id;
  String? title;
  String? body;

  DemoInfoApi({this.userId, this.id, this.title, this.body});

  DemoInfoApi.fromJson(Map<dynamic, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}