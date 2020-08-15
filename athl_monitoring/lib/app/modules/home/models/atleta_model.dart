import 'package:cloud_firestore/cloud_firestore.dart';

class AtletaModel  {
  final String nome, email, uid, urlPhoto;
  final bool type;
  int num;
  DocumentReference reference;
  
  AtletaModel({this.nome,this.num, this.email, this.uid, this.urlPhoto, this.type, this.reference});

  factory AtletaModel.fromDocument(DocumentSnapshot doc){
    return AtletaModel(
      nome: doc['nome'],
      type: doc['type'],
      email: doc['email'],
      uid: doc['uid'],
      urlPhoto: doc['urlPhoto'],
      num: doc['numero'],      
    );
  }

}