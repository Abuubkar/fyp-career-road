import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_career_road/models/career_entity.dart';

abstract class Database {
  static CollectionReference _users = FirebaseFirestore.instance.collection('users');
  static CollectionReference _bookmarks = FirebaseFirestore.instance.collection('bookmarks');
  static CollectionReference _careers = FirebaseFirestore.instance.collection('careers');
  
  static Future<bool> addCareer(String name, String info, String roadMap, String link) async {
    bool success = false;
    await _careers.add({
      'name': name,
      'info': info,
      'roadMap': roadMap,
      'link': link,
    }).onError((error, stackTrace) {
      print('Error occurred: $error');
      return null;
    }).then((value) => success = true);

    return success;
  }

  static Future<CareerEntity> getCareerById(String id) async {
    CareerEntity career;
    await _careers.doc(id).get().onError((error, stackTrace) {
      print('Error occurred: $error');
      return null;
    }).then((value) {
      print(value.id);
      if (value.exists) {
        career = CareerEntity().fromJson({...value.data(), "id": id});
      }
    });
    print(career.toJson());
    return career;
  }

  static Future<bool> removeCareer(String id) async {
    bool success = false;
    _careers.doc(id).delete().onError((error, stackTrace) {
      print('Error occurred: $error');
      return null;
    }).then((value) => success = true);
    return success;
  }

  static Future<List<CareerEntity>> getAllCareers() async {
    List<CareerEntity> careers = [];
    await _careers.get().onError((error, stackTrace) {
      print('Error occurred: $error');
      return null;
    }).then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          careers.add(CareerEntity().fromJson({...element.data(), "id": element.id}));
        });
      }
    });
    return careers;
  }

  static Future<List<CareerEntity>> getCareersByName(String name) async {
    List<CareerEntity> careers = [];
    await _careers.where('name', isEqualTo: name).get().onError((error, stackTrace) {
      print('Error occurred: $error');
      return null;
    }).then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          careers.add(CareerEntity().fromJson({...element.data(), "id": element.id}));
        });
      }
    });
    return careers;
  }

  static Future getBookmarksByEmail() async {
    final String email = FirebaseAuth.instance.currentUser?.email;
    print(email);
  }
}
