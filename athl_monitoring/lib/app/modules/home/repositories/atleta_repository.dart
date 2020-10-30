import 'package:athl_monitoring/app/modules/home/models/atleta_model.dart';
import 'package:athl_monitoring/app/modules/home/models/user_model.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/atleta_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AtletaRepository extends Disposable implements IAtletaRepository {
  final Firestore firestore;

  AtletaRepository({@required this.firestore});

  @override
  Future delete(AtletaModel model) {
    return model.reference.delete();
  }

  @override
  Stream<List<AtletaModel>> get() {
    return firestore.collection('atletas').snapshots().map((query) =>
        query.documents.map((doc) => AtletaModel.fromDocument(doc)).toList());
  }

  @override
  Future save(AtletaModel model) async {
    if (model.reference == null) {
      await Firestore.instance
          .collection('users')
          .document(model.uid)
          .collection('atleta')
          .document(model.uid)
          .setData({
        'nome': model.nome,
        'email': model.email,
        'uid': model.uid,
        'urlPhoto': model.urlPhoto,
        'numero': model.number,
        'modalidade': model.modalidade
      });
    } else {
      model.reference.updateData({
        'nome': model.nome,
        'email': model.email,
        'uid': model.uid,
        'urlPhoto': model.urlPhoto,
        'numero': model.number,
        'modalidade': model.modalidade
      });
    }
  }

  @override
  Future<AtletaModel> index(AtletaModel model) async {
    return Firestore.instance
        .collection('atletas')
        .document(model.uid)
        .get()
        .then((doc) => AtletaModel.fromDocument(doc));
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future register(AtletaModel model, UserModel fbuser) async {
    DocumentReference docRef = Firestore.instance
        .collection('users')
        .document(fbuser.uid)
        .collection('atleta')
        .document(fbuser.uid);

    if (docRef.get() != null) {
      await Firestore.instance
          .collection('users')
          .document(fbuser.uid)
          .collection('atleta')
          .document(fbuser.uid)
          .setData({
        'nome': fbuser.nome,
        'email': fbuser.email,
        'urlPhoto': model.urlPhoto,
        'numero': model.number,
      });
    }
  }
}
