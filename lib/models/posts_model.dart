class PostsModel {
  Posts? posts;

  PostsModel({this.posts});

  PostsModel.fromJson(Map<String, dynamic> json) {
    posts = json['posts'] != null ? new Posts.fromJson(json['posts']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts!.toJson();
    }
    return data;
  }
}

class Posts {
  List<Data>? data;

  Posts({this.data});

  Posts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? message;
  String? createdTime;
  String? permalinkUrl;
  String? id;
  Posts? comments;

  Data(
      {this.message,
      this.createdTime,
      this.permalinkUrl,
      this.id,
      this.comments});

  Data.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    createdTime = json['created_time'];
    permalinkUrl = json['permalink_url'];
    id = json['id'];
    comments =
        json['comments'] != null ? new Posts.fromJson(json['comments']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['created_time'] = this.createdTime;
    data['permalink_url'] = this.permalinkUrl;
    data['id'] = this.id;
    if (this.comments != null) {
      data['comments'] = this.comments!.toJson();
    }
    return data;
  }
}

class Data1 {
  String? createdTime;
  String? message;
  String? id;

  Data1({this.createdTime, this.message, this.id});

  Data1.fromJson(Map<String, dynamic> json) {
    createdTime = json['created_time'];
    message = json['message'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_time'] = this.createdTime;
    data['message'] = this.message;
    data['id'] = this.id;
    return data;
  }
}
