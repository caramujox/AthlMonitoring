import 'package:athl_monitoring/app/modules/home/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AtletaModel extends UserModel {
  final String modalidade, codEquipe;
  int number;
  DocumentReference reference;

  AtletaModel(
      {nome,
      email,
      uid,
      urlPhoto,
      this.codEquipe,
      this.number,
      this.reference,
      this.modalidade})
      : super(nome: nome, email: email, urlPhoto: urlPhoto, uid: uid);

  factory AtletaModel.fromDocument(DocumentSnapshot doc) {
    return AtletaModel(
        nome: doc['nome'],
        email: doc['email'],
        uid: doc['uid'],
        urlPhoto: doc['urlPhoto'],
        number: doc['numero'],
        codEquipe: doc['codEquipe']);
  }
}
