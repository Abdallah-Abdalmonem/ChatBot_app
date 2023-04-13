import 'package:chatbot_app/data/models/user_model.dart';
import 'package:chatbot_app/shared/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AccessToken? _accessToken;

  UserModel? _currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.blue,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: AppColor.white,
                  ),
                  height: 300,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Text(
                            'Login with facebook',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                final AccessToken? accessToken =
                                    await FacebookAuth.instance.accessToken;
// or FacebookAuth.i.accessToken
                                if (accessToken != null) {
                                  print('user is logged');
                                } else {
                                  print('user is Not logged');
                                }
                              },
                              child: Text('check login')),
                          ElevatedButton(
                              onPressed: () async {
//                                 final LoginResult result = await FacebookAuth
//                                     .instance
//                                     .login(); // by default we request the email and the public profile
// // or FacebookAuth.i.login()
//                                 if (result.status == LoginStatus.success) {
//                                   // you are logged
//                                   final AccessToken accessToken =
//                                       result.accessToken!;
//                                 } else {
//                                   print(result.status);
//                                   print(result.message);
//                                 }

                                // Future<void> loginWithFacebook() async {
                                final LoginResult result =
                                    await FacebookAuth.i.login();
                                if (result.status == LoginStatus.success) {
                                  print('success!!!!!');
                                  _accessToken = result.accessToken;

                                  final data =
                                      await FacebookAuth.i.getUserData();
                                  UserModel model = UserModel.fromJson(data);

                                  // You can now use the Facebook API to fetch user data.
                                } else {
                                  print(
                                      'Error logging in with Facebook: ${result.message}');
                                }
                                // }
                                print(
                                    '${_accessToken!.userId.toString()} !!!!!!!!!!!!!!');
                                setState(() {});
                              },
                              child: const Text('Login with facebook')),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                homeScreen(),
              ],
            ),
          ),
        ));
  }

  Widget homeScreen() {
    // HomeScreen({super.key});
    UserModel? user = _currentUser;
    if (user == Null) {
      return SafeArea(
        child: Row(
          children: [
            CircleAvatar(
              radius: _currentUser!.pictureModel!.width! / 6,
              child: Image.network(
                _currentUser!.pictureModel!.url!,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(_currentUser!.name!),
          ],
        ),
      );
    } else
      return Text(
        'not found',
        style: TextStyle(color: AppColor.white, fontSize: 23),
      );
  }
}
