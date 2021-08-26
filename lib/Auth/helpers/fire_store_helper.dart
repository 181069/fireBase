import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fatima/Auth/models/UserModel.dart';
import 'package:fatima/Auth/models/country_model.dart';
import 'package:fatima/Auth/models/register_requist.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  addUserToFirestore(RegisterRequest registerRequest) async {
    try {
      // await firebaseFirestore.collection('Users').add(registerRequest.toMap());
      await firebaseFirestore
          .collection('Users')
          .doc(registerRequest.id)
          .set(registerRequest.toMap());
    } on Exception catch (e) {
      print(e);
    }
  }

  getUserFromFirestore(String userId) async {
    DocumentSnapshot documentSnapshot =
    await firebaseFirestore.collection('Users').doc(userId).get();

    print(documentSnapshot.data());
  }

  Future<List<UserModel>> getAllUsersFromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
    await firebaseFirestore.collection('Users').get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> docs = querySnapshot.docs;
    List<UserModel> users =
    docs.map((e) => UserModel.fromMap(e.data())).toList();
    print(users.length);
    return users;
  }
  Future<List<CountryModel>> getAllCountries() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await firebaseFirestore.collection('countries').get();
      List<CountryModel> countries = querySnapshot.docs.map((e) {
        Map map = e.data();
        map['id'] = e.id;
        return CountryModel.fromJson(map);
      }).toList();
      return countries;
    } on Exception catch (e) {
      // TODO
    }
  }

}