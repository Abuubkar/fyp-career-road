import 'package:fyp_career_road/models/career_entity.dart';

careerEntityFromJson(CareerEntity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['name'] != null) {
    data.name = json['name'].toString();
  }
  if (json['info'] != null) {
    data.info = json['info'].toString();
  }
  if (json['roadMap'] != null) {
    data.roadMap = json['roadMap'].toString();
  }
  if (json['link'] != null) {
    data.link = json['link'].toString();
  }
  return data;
}

Map<String, dynamic> careerEntityToJson(CareerEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['info'] = entity.info;
  data['roadMap'] = entity.roadMap;
  data['link'] = entity.link;
  return data;
}
