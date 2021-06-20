import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_career_road/models/bookmark_entity.dart';
import 'package:fyp_career_road/models/career_entity.dart';

abstract class Database {
  static CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  static CollectionReference _bookmarks =
      FirebaseFirestore.instance.collection('bookmarks');
  static CollectionReference _careers =
      FirebaseFirestore.instance.collection('careers');

  static Future<bool> addCareer(
      String name, String info, String roadMap, String link) async {
    bool success = false;

    List<CareerEntity> careers = await getCareersByName(name);
    if (careers.isNotEmpty) return success;

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

  static Future<bool> removeCareer(String name) async {
    bool success = false;
    String bookmarkId = await isBookmarkPresent(name);

    List<CareerEntity> careers = await getCareersByName(name);
    if (careers.isEmpty) return success;

    await _careers.doc(careers[0].id).delete().onError((error, stackTrace) {
      print('Error occurred: $error');
      return null;
    }).then((value) {
      success = true;
      removeBookmark(bookmarkId);
    });
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
          careers.add(
              CareerEntity().fromJson({...element.data(), "id": element.id}));
        });
      }
    });
    return careers;
  }

  static Future<List<CareerEntity>> getCareersByName(String name) async {
    List<CareerEntity> careers = [];
    await _careers
        .where('name', isEqualTo: name)
        .get()
        .onError((error, stackTrace) {
      print('Error occurred: $error');
      return null;
    }).then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          careers.add(
              CareerEntity().fromJson({...element.data(), "id": element.id}));
        });
      }
    });
    return careers;
  }

  static Future<bool> addBookmark(String name, String id, String email) async {
    bool success = false;
    await _bookmarks.add({
      'careerName': name,
      'careerId': id,
      'email': email,
    }).onError((error, stackTrace) {
      print('Error occurred: $error');
      return null;
    }).then((value) => success = true);

    return success;
  }

  static Future<List<BookmarkEntity>> getBookmarksByEmail() async {
    List<BookmarkEntity> bookmarks = [];
    final String email =
        FirebaseAuth.instance.currentUser?.email ?? "bakar@khawaja.com";
    await _bookmarks
        .where('email', isEqualTo: email)
        .get()
        .onError((error, stackTrace) {
      print('Error occurred: $error');
      return null;
    }).then((value) {
      value.docs.forEach((QueryDocumentSnapshot element) {
        bookmarks.add(
            BookmarkEntity().fromJson({...element.data(), "id": element.id}));
      });
    });
    return bookmarks;
  }

  static Future<bool> removeBookmark(String id) async {
    bool success = false;
    await _bookmarks.doc(id).delete().onError((error, stackTrace) {
      print('Error occurred: $error');
      return null;
    }).then((value) => success = true);
    return success;
  }

  static Future<String> isBookmarkPresent(String courseName) async {
    String id = '';
    List<BookmarkEntity> bookmarks = [];
    final String email =
        FirebaseAuth.instance.currentUser?.email ?? "bakar@khawaja.com";
    await _bookmarks
        .where(
          'email',
          isEqualTo: email,
        )
        .where('careerName', isEqualTo: courseName)
        .get()
        .onError((error, stackTrace) {
      print('Error occurred: $error');
      return null;
    }).then((value) {
      print(value.docs.length);
      value.docs.forEach((QueryDocumentSnapshot element) {
        if (value.docs.isNotEmpty && value.docs.first.exists)
          id = value.docs.first.id;
      });
    });
    return id;
  }
}
