import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fiveminutegeneral_web_app/helpers/constants.dart';

class DatabaseMethods {
  Future<void> addData(userData) async {
    Firestore.instance.collection("users")
    .document(Constants.userId)
        .setData(userData).catchError((e) {
      print(e);
    });
  }

  getData() async {
    return Firestore.instance.collection("users").snapshots();
  }

  Future<QuerySnapshot> getRecentUsers() async {
    return await Firestore.instance
        .collection("users")
        .limit(10)
        .getDocuments();
  }

  getUserInfo(String email) async {
    return Firestore.instance
        .collection("users")
        .where("email", isEqualTo: email)
        .getDocuments();
  }

  uploadGratitude(gratitudeMap, String timeAndDate){
    return Firestore.instance
        .collection("users")
        .document(Constants.userId)
    .collection("GratitudeList")
    .document(timeAndDate)
        .setData(gratitudeMap)
        .catchError((e){
          print(e.toString());
    });
  }

  getGratitudeData() async {
    return Firestore.instance
        .collection("users")
    .document(Constants.userId)
    .collection("GratitudeList")
        .snapshots();
  }

}
