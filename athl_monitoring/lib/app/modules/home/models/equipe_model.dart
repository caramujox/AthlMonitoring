import 'package:cloud_firestore/cloud_firestore.dart';

class EquipeModel {
  final String modalidade;
  final String codEquipe;
  final String nome;
  final String urlPhoto;
  final String uidTreinador;
  DocumentReference reference;

  EquipeModel({this.modalidade, this.codEquipe, this.nome, this.urlPhoto, this.uidTreinador});


  factory EquipeModel.fromDocument(DocumentSnapshot doc) {
    return EquipeModel(
      codEquipe: doc['codEquipe'],
      nome: doc['nome'],
      modalidade: doc['modalidade'],
      urlPhoto: doc['urlPhoto'],
      uidTreinador: doc['uidTreinador']
    );
  }
}