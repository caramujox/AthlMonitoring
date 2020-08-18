import 'dart:convert';

import 'package:athl_monitoring/app/modules/home/models/user_model.dart';
import 'package:athl_monitoring/app/modules/home/repositories/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'interfaces/base_auth_interface.dart';

class AuthService implements IBaseAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookLogin facebookLogin = new FacebookLogin();
  final UserRepository userRepository;

  AuthService({@required this.userRepository});

  @override
  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return user;
  }

  @override
  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _auth.currentUser();
    return user.isEmailVerified;
  }

  @override
  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _auth.currentUser();
    user.sendEmailVerification();
  }

  @override
  Future<FirebaseUser> signIn(String email, String password) async {
    AuthResult res = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = res.user;
    return user;
  }

  @override
  Future<FirebaseUser> singInGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    UserUpdateInfo info = new UserUpdateInfo();
    info.photoUrl = googleUser.photoUrl;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    user.updateProfile(info);

    userRepository.save(new UserModel(
        nome: user.displayName,
        urlPhoto: user.photoUrl,
        email: user.email,
        uid: user.uid));

    return user;
  }

  @override
  Future<FirebaseUser> singInFacebook() async {
    final FacebookLoginResult result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        FacebookAccessToken facebookAccessToken = result.accessToken;
        AuthCredential credential = FacebookAuthProvider.getCredential(
            accessToken: facebookAccessToken.token);

        UserUpdateInfo info = new UserUpdateInfo();
        Response graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,picture.width(800).height(800),first_name,last_name,email&access_token=${facebookAccessToken.token}');
        final profile = jsonDecode(graphResponse.body);
        info.photoUrl = profile['picture']['data']['url'].toString();
        FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
        user.updateProfile(info);
        userRepository.save(new UserModel(
            nome: user.displayName,
            urlPhoto: user.photoUrl,
            email: user.email,
            uid: user.uid));

        return user;
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("Canceladah");
        return null;
        break;
      case FacebookLoginStatus.error:
        print(result.errorMessage);
        break;
    }
    return null;
  }

  @override
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  @override
  Future<FirebaseUser> signUp(
      String email, String password, String name) async {
    FirebaseUser userC = (await _auth.createUserWithEmailAndPassword(
            email: email, password: password))
        .user;
    UserUpdateInfo info = UserUpdateInfo();
    info.displayName = name;
    await userC.updateProfile(info);
    await userC.reload();
    FirebaseUser user = await _auth.currentUser();

    userRepository.save(new UserModel(
        nome: user.displayName,
        urlPhoto: user.photoUrl,
        email: user.email,
        uid: user.uid));

    return user;
  }

  @override
  Stream<List<UserModel>> get() {
    return userRepository.get();
  }

  
}
