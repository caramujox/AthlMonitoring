import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email, nome, type, uid, urlPhoto;
  DocumentReference reference;

  UserModel(
      {this.email,
      this.nome,
      this.type,
      this.uid,
      this.urlPhoto,
      this.reference});

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
        email: doc['email'],
        nome: doc['nome'],
        type: doc['type'],
        uid: doc['uid'],
        urlPhoto: doc['urlPhoto']);
  }
}
