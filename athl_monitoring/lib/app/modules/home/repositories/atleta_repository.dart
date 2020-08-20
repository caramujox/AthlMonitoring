import 'package:athl_monitoring/app/modules/home/models/atleta_model.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/atleta_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';

class AtletaRepository extends Disposable implements IAtletaRepository{
 final Firestore firestore;

  AtletaRepository({@required this.firestore});

  @override
  Future delete(AtletaModel model) {
    return model.reference.delete();
  }

  @override
  Stream<List<AtletaModel>> get() {
    return firestore.collection('atletas').snapshots().map(
            (query) =>
            query.documents.map((doc) => AtletaModel.fromDocument(doc)).toList()
                );
  }

  @override
  Future save(AtletaModel model) async {

    if (model.reference == null) {
      model.reference = await Firestore.instance.collection('atletas').add({
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

  @override
  Future<AtletaModel> index(AtletaModel model) async{   
      return Firestore.instance.collection('atletas').document(model.uid).get().then((doc) => AtletaModel.fromDocument(doc));
  }
  //dispose will be called automatically
  @override
  void dispose() {}
}
