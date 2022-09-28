import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  late final String? uId;
  DatabaseService({this.uId});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection('groups');

  Future createUserData(String email, String fullName) async {
    return await userCollection.doc(uId).set({
      'fullName': fullName,
      'email': email,
      'groups': {},
      'profilepicture': '',
      'uId': uId,
    });
  }
}
