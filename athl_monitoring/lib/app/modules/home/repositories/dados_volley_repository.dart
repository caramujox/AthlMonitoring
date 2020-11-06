import 'package:athl_monitoring/app/modules/home/models/dadosVolley_model.dart';
import 'package:athl_monitoring/app/modules/home/repositories/interfaces/dados_volley_repository_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DadosVolleyRepository extends Disposable
    implements IDadosVolleyRepository {
  final Firestore firestore;

  DadosVolleyRepository({@required this.firestore});

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future save(DadosVolleyModel model) async {
    if (model.reference == null) {
      await Firestore.instance.collection('jogosVolley').document().setData(
          {'tipo': model.tipo, 'jogador': model.jogador, 'ponto': model.ponto});
    } else {
      model.reference.updateData(
          {'tipo': model.tipo, 'jogador': model.jogador, 'ponto': model.ponto});
    }
  }

  @override
  Stream<List<DadosVolleyModel>> get() {
    return firestore.collection('jogosVolley').document('9d1ece70-159e-11eb-8b50-014840b4b2b02020-11-05 01:28:56.958953').collection('dados').snapshots().map((query) =>
        query.documents.map((doc) => DadosVolleyModel.fromDocument(doc)).toList());
  }

  @override
  Stream<List<DadosVolleyModel>> getPro(){
    return firestore.collection('jogosVolley').document('9d1ece70-159e-11eb-8b50-014840b4b2b02020-11-05 01:28:56.958953').collection('dados').where('ponto', isEqualTo: 'pro').snapshots().map((event) => 
        event.documents.map((doc) => DadosVolleyModel.fromDocument(doc)).toList());    
  }

  @override
  Stream<List<DadosVolleyModel>> getCon(){
    return firestore.collection('jogosVolley').document('9d1ece70-159e-11eb-8b50-014840b4b2b02020-11-05 01:28:56.958953').collection('dados').where('ponto', isEqualTo: 'con').snapshots().map((event) => 
        event.documents.map((doc) => DadosVolleyModel.fromDocument(doc)).toList());    
  }

  @override
  Stream<List<DadosVolleyModel>> getConAtaque() {
    return firestore.collection('jogosVolley').document('9d1ece70-159e-11eb-8b50-014840b4b2b02020-11-05 01:28:56.958953').collection('dados').where('tipo', isEqualTo: 'erro de ataque').snapshots().map((event) => 
        event.documents.map((doc) => DadosVolleyModel.fromDocument(doc)).toList());
  }

  @override
  Stream<List<DadosVolleyModel>> getConBloqueio() {
   return firestore.collection('jogosVolley').document('9d1ece70-159e-11eb-8b50-014840b4b2b02020-11-05 01:28:56.958953').collection('dados').where('tipo', isEqualTo: 'ataque bloqueado').snapshots().map((event) => 
        event.documents.map((doc) => DadosVolleyModel.fromDocument(doc)).toList());
  }

  @override
  Stream<List<DadosVolleyModel>> getConGenerico() {
    return firestore.collection('jogosVolley').document('9d1ece70-159e-11eb-8b50-014840b4b2b02020-11-05 01:28:56.958953').collection('dados').where('tipo', isEqualTo: 'erro generico').snapshots().map((event) => 
        event.documents.map((doc) => DadosVolleyModel.fromDocument(doc)).toList());
  
  }

  @override
  Stream<List<DadosVolleyModel>> getConSaque() {
    return firestore.collection('jogosVolley').document('9d1ece70-159e-11eb-8b50-014840b4b2b02020-11-05 01:28:56.958953').collection('dados').where('tipo', isEqualTo: 'erro de saque').snapshots().map((event) => 
        event.documents.map((doc) => DadosVolleyModel.fromDocument(doc)).toList());
  
  }

  @override
  Stream<List<DadosVolleyModel>> getProAtaque() {
    return firestore.collection('jogosVolley').document('9d1ece70-159e-11eb-8b50-014840b4b2b02020-11-05 01:28:56.958953').collection('dados').where('tipo', isEqualTo: 'ponto de ataque').snapshots().map((event) => 
        event.documents.map((doc) => DadosVolleyModel.fromDocument(doc)).toList());
  
  }

  @override
  Stream<List<DadosVolleyModel>> getProBloqueio() {
    return firestore.collection('jogosVolley').document('9d1ece70-159e-11eb-8b50-014840b4b2b02020-11-05 01:28:56.958953').collection('dados').where('tipo', isEqualTo: 'ponto de bloqueio').snapshots().map((event) => 
        event.documents.map((doc) => DadosVolleyModel.fromDocument(doc)).toList());
  
  }

  @override
  Stream<List<DadosVolleyModel>> getProErroOponente() {
   return firestore.collection('jogosVolley').document('9d1ece70-159e-11eb-8b50-014840b4b2b02020-11-05 01:28:56.958953').collection('dados').where('tipo', isEqualTo: 'erro oponente').snapshots().map((event) => 
        event.documents.map((doc) => DadosVolleyModel.fromDocument(doc)).toList());
  
  }

  @override
  Stream<List<DadosVolleyModel>> getProSaque() {
    return firestore.collection('jogosVolley').document('9d1ece70-159e-11eb-8b50-014840b4b2b02020-11-05 01:28:56.958953').collection('dados').where('tipo', isEqualTo: 'ponto de saque').snapshots().map((event) => 
        event.documents.map((doc) => DadosVolleyModel.fromDocument(doc)).toList());
  
  }
}
