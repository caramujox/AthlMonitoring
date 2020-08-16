import 'dart:html';

import 'package:athl_monitoring/app/modules/home/models/user_model.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/user_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  Future<UserModel> index(UserModel model) {
    return firestore
        .collection('users')
        .document(model.uid)
        .get()
        .then((doc) => UserModel.fromDocument(doc));
  }

  @override
  Future save(UserModel model) async {
    if (model.reference == null) {
      model.reference = await Firestore.instance.collection('users').add({
        'nome': model.nome,
        'email': model.email,
        'uid': model.uid,
        'urlPhoto': model.urlPhoto,
      });
    } else {
      model.reference.updateData({
        'nome': model.nome,
        'email': model.email,
        'uid': model.uid,
        'urlPhoto': model.urlPhoto,
      });
    }
  }
}
