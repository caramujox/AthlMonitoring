import 'package:athl_monitoring/app/modules/home/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TreinadorModel extends UserModel {
  final String codEquipe;
  DocumentReference reference;

  TreinadorModel({this.codEquipe, this.reference});

  factory TreinadorModel.fromDocument(DocumentSnapshot doc) {
    return TreinadorModel(codEquipe: doc['codEquipe']);
  }
}
