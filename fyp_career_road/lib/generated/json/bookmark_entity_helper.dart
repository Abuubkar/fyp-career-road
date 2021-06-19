import 'package:fyp_career_road/models/bookmark_entity.dart';

bookmarkEntityFromJson(BookmarkEntity data, Map<String, dynamic> json) {
  if (json['careerId'] != null) {
    data.careerId = json['careerId'].toString();
  }
  if (json['careerName'] != null) {
    data.careerName = json['careerName'].toString();
  }
  if (json['email'] != null) {
    data.email = json['email'].toString();
  }
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  return data;
}

Map<String, dynamic> bookmarkEntityToJson(BookmarkEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['careerId'] = entity.careerId;
  data['careerName'] = entity.careerName;
  data['email'] = entity.email;
  data['id'] = entity.id;
  return data;
}
