import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

@JsonSerializable()
class Post {
Post({
required this.userId,
required this.id,
required this.title,
required this.body,
});

factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
Map<String, dynamic> tojson() => _$PostToJson(this);

String userId;
String id;
String title;
String body;
}
