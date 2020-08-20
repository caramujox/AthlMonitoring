import 'package:athl_monitoring/app/modules/home/models/user_model.dart';
import 'package:athl_monitoring/app/modules/home/services/interfaces/base_auth_interface.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  final IBaseAuth auth;

  _UserControllerBase({@required this.auth}) {
   // getUser();
  }

  @observable
  ObservableFuture<FirebaseUser> user;

  @observable
  ObservableStream<List<UserModel>> userList;

  @action
  signIn(String email, String password) async {
    await auth.signIn(email, password);
  }

  @action
  signInGoogle() async {
    await auth.singInGoogle();
  }

  @action
  signInFacebook() async {
    await auth.singInFacebook();
  }

  @action
  sendEmailVerification() async {
    await auth.sendEmailVerification();
  }

  @action
  signOut() {
    auth.signOut();
  }

  @action
  isEmailVerified() {
    auth.isEmailVerified();
  }

  @action
  signUp(String email, String password, String name) {
    auth.signUp(email, password, name);
  }

  @action
  getUserInfo(FirebaseUser fbUser) {
    userList = auth.get().asObservable();
    List<UserModel> list = userList.data;
    UserModel model = UserModel();
    if (userList.data == null) {
      print("userList.data ta nulo, vou retornar pra ver no que dá");
      return;
    } else {
      list.forEach((element) {
        if (element.uid == fbUser.uid) {
          model = element;
        }
      });
    }
    return model;
  }

  @action
  getUser() {
    user = auth.getCurrentUser().asObservable();
    return user;
  }
}
