// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

import 'package:fyp_career_road/generated/json/career_entity_helper.dart';
// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:fyp_career_road/models/career_entity.dart';

class JsonConvert<T> {
  T fromJson(Map<String, dynamic> json) {
    return _getFromJson<T>(runtimeType, this, json);
  }

  Map<String, dynamic> toJson() {
    return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
    switch (type) {
      case CareerEntity:
        return careerEntityFromJson(data as CareerEntity, json) as T;
    }
    return data as T;
  }

  static _getToJson<T>(Type type, data) {
    switch (type) {
      case CareerEntity:
        return careerEntityToJson(data as CareerEntity);
    }
    return data as T;
  }

  //Go back to a single instance by type
  static _fromJsonSingle<M>(json) {
    String type = M.toString();
    if (type == (CareerEntity).toString()) {
      return CareerEntity().fromJson(json);
    }
    return null;
  }

  //list is returned by type
  static M _getListChildType<M>(List data) {
    if (<CareerEntity>[] is M) {
      return data.map<CareerEntity>((e) => CareerEntity().fromJson(e)).toList() as M;
    }
    throw Exception("not fond");
  }

  static M fromJsonAsT<M>(json) {
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json) as M;
    }
  }
}
