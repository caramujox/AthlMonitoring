// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
  final _$userAtom = Atom(name: '_UserControllerBase.user');

  @override
  ObservableFuture<FirebaseUser> get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(ObservableFuture<FirebaseUser> value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$userModelAtom = Atom(name: '_UserControllerBase.userModel');

  @override
  ObservableFuture<dynamic> get userModel {
    _$userModelAtom.reportRead();
    return super.userModel;
  }

  @override
  set userModel(ObservableFuture<dynamic> value) {
    _$userModelAtom.reportWrite(value, super.userModel, () {
      super.userModel = value;
    });
  }

  final _$userListAtom = Atom(name: '_UserControllerBase.userList');

  @override
  ObservableStream<List<UserModel>> get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(ObservableStream<List<UserModel>> value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  final _$signInAsyncAction = AsyncAction('_UserControllerBase.signIn');

  @override
  Future signIn(String email, String password) {
    return _$signInAsyncAction.run(() => super.signIn(email, password));
  }

  final _$signInGoogleAsyncAction =
      AsyncAction('_UserControllerBase.signInGoogle');

  @override
  Future signInGoogle() {
    return _$signInGoogleAsyncAction.run(() => super.signInGoogle());
  }

  final _$signInFacebookAsyncAction =
      AsyncAction('_UserControllerBase.signInFacebook');

  @override
  Future signInFacebook() {
    return _$signInFacebookAsyncAction.run(() => super.signInFacebook());
  }

  final _$sendEmailVerificationAsyncAction =
      AsyncAction('_UserControllerBase.sendEmailVerification');

  @override
  Future sendEmailVerification() {
    return _$sendEmailVerificationAsyncAction
        .run(() => super.sendEmailVerification());
  }

  final _$_UserControllerBaseActionController =
      ActionController(name: '_UserControllerBase');

  @override
  dynamic signOut() {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.signOut');
    try {
      return super.signOut();
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic isEmailVerified() {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.isEmailVerified');
    try {
      return super.isEmailVerified();
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic signUp(String email, String password, String name) {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.signUp');
    try {
      return super.signUp(email, password, name);
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getUserInfo() {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.getUserInfo');
    try {
      return super.getUserInfo();
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getUser() {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.getUser');
    try {
      return super.getUser();
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
userModel: ${userModel},
userList: ${userList}
    ''';
  }
}
