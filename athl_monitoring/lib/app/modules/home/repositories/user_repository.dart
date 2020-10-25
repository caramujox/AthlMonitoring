import 'package:athl_monitoring/app/modules/home/models/user_model.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/user_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserRepository extends IUserRepository {
  final Firestore firestore;

  UserRepository({@required this.firestore});

  @override
  Future delete(UserModel model) {
    return model.reference.delete();
  }

  @override
  Stream<List<UserModel>> get() {
    return firestore.collection('users').snapshots().map((query) =>
        query.documents.map((doc) => UserModel.fromDocument(doc)).toList());
  }

  @override
  Future<UserModel> index(FirebaseUser model) {
    return firestore
        .collection('users')
        .where('firebaseId', isEqualTo: model.uid)
        .getDocuments()
        .then((querySnapshot) {
      return UserModel.fromDocument(querySnapshot.documents.first);
    });
  }

  @override
  Future save(UserModel model) async {
    if ((await Firestore.instance
            .collection('users')
            .document(model.uid.toString())
            .get())
        .exists) {
      return;
    } else {
      Firestore.instance.collection('users').document(model.uid).setData({
        'nome': model.nome,
        'email': model.email,
        'uid': model.uid,
        'urlPhoto': model.urlPhoto,
        'firebaseId': model.firebaseId
      });
    }
  }
}
