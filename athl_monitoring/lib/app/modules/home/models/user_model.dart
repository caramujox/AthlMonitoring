import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email, nome, uid, urlPhoto, firebaseId;
  DocumentReference reference;

  UserModel(
      {this.email,
      this.nome,
      this.uid,
      this.urlPhoto,
      this.firebaseId,
      this.reference});

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    return UserModel(
        email: doc['email'],
        nome: doc['nome'],
        uid: doc['uid'],
        firebaseId: doc['firebaseId'],
        urlPhoto: doc['urlPhoto']);
  }
}
