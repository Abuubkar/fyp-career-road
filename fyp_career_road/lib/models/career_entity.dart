import 'package:fyp_career_road/generated/json/base/json_convert_content.dart';

class CareerEntity with JsonConvert<CareerEntity> {
  String id;
  String name;
  String info;
  String roadMap;
  String link;
}
