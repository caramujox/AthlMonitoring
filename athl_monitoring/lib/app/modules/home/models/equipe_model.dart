import 'package:athl_monitoring/app/modules/home/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EquipeModel extends UserModel {
  final String modalidade;
  final String codEquipe;
  final String nome;
  DocumentReference reference;

  EquipeModel({this.modalidade, this.codEquipe, this.nome});


  factory EquipeModel.fromDocument(DocumentSnapshot doc) {
    return EquipeModel(
      codEquipe: doc['codEquipe'],
      nome: doc['nome'],
      modalidade: doc['modalidade'],
    );
  }
}