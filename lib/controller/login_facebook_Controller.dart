import 'dart:convert';

import 'package:chat_bot/core/constant/lists.dart';
import 'package:chat_bot/services/get_posts_service.dart';
import 'package:chat_bot/views/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../core/constant/app_routes.dart';

abstract class LoginController extends GetxController {
  loginWithFacebook();
  logOut();
  isLoggedIn();
  goToHomeScreen();
  goToLoginScreen();
}

class LoginControllerImp extends LoginController {
  FacebookAuth facebookAuth = FacebookAuth.instance;
  Map<String, dynamic> userProfile = {};

  ref() {
    update();
  }

  // log in
  @override
  Future loginWithFacebook() async {
    final LoginResult result = await facebookAuth.login();
    if (result.status == LoginStatus.success) {
      // You have successfully logged in with Facebook.
      final AccessToken? accessToken = result.accessToken;
      // You can now use the Facebook API to fetch user data.
      goToHomeScreen();
    } else {
      // There was an error logging in with Facebook.
      print('Error logging in with Facebook: ${result.message}');
    }
  }

  // log out
  @override
  logOut() async {
    await facebookAuth.logOut();
    goToLoginScreen();
    print("Logged out");
  }

  // chce user Login or not
  @override
  Future<bool> isLoggedIn() async {
    AccessToken? accessToken = await FacebookAuth.instance.accessToken;
    bool isLoggedIn = accessToken != null && !accessToken.isExpired;
    if (isLoggedIn) {
      print('User is logged in with Facebook');
      return true;
    } else {
      print('User is not logged in with Facebook');
      return false;
    }
  }

  // go to home screen
  @override
  goToHomeScreen() {
    Get.offNamed(AppRoutes.home);
  }

  // bace to login screen
  @override
  goToLoginScreen() {
    Get.offNamed(AppRoutes.login);
  }

  Future getProfilePictureUrl() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    print(accessToken);
    final graphResponse = await http.get(Uri.parse(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.width(400)&access_token=${accessToken!.token}'));

    // final graphResponse = await http.get(Uri.parse(
    //     'https://graph.facebook.com/v12.0/me?fields=picture.width(400)&access_token=${accessToken!.token}'));
    final profile = jsonDecode(graphResponse.body);
    userProfile = await profile;
    print('!!!!!!!!!!!!!!!!!!!!!!!!!profile = ${profile}');
    return profile['picture']['data'];
  }

  // with the beginning of the page check if user login go to home
  @override
  void onInit() async {
    await getProfilePictureUrl();
    print(userProfile['first_name']);
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
