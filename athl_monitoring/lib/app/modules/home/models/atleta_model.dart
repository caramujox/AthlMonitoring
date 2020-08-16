import 'package:athl_monitoring/app/modules/home/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AtletaModel extends UserModel {
  final String modalidade;
  int number;
  DocumentReference reference;

  AtletaModel({nome, email, uid, urlPhoto, type, this.number, this.reference,this.modalidade}):super(nome: nome , type: type, email: email, urlPhoto: urlPhoto, uid: uid);


  factory AtletaModel.fromDocument(DocumentSnapshot doc) {
    return AtletaModel(
      nome: doc['nome'],
      type: doc['type'],
      email: doc['email'],
      uid: doc['uid'],
      urlPhoto: doc['urlPhoto'],
      number: doc['numero'],
    );
  }
}