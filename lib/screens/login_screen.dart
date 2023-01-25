import 'package:flutter/material.dart';
import 'package:instagram/screens/main_screen.dart';
import 'package:instagram/screens/switch_account_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailFocusNode.addListener(() {
      setState(() {});
    });

    passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff323A99),
            Color(0xffF98BFC),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            _getImageContainer(),
            _getContainerBox(),
          ],
        ),
      ),
    );
  }

  Widget _getContainerBox() {
    return Column(
      children: [
        Expanded(
          flex: 45,
          child: Container(),
        ),
        Expanded(
          flex: 55,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              color: Color(0xff1C1F2E),
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in to ',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Image(
                      image: AssetImage('images/mood.png'),
                    )
                  ],
                ),
                SizedBox(
                  height: 34,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    focusNode: emailFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 18,
                        color: emailFocusNode.hasFocus
                            ? Color(0xFFF35383)
                            : Color(0xFFC5C5C5),
                      ),
                      contentPadding: EdgeInsets.all(16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Color(0xffC5C5C5),
                          width: 3.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Color(0xFFF35383),
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44),
                  child: TextField(
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontFamily: 'GM',
                        fontSize: 18,
                        color: passwordFocusNode.hasFocus
                            ? Color(0xFFF35383)
                            : Color(0xFFC5C5C5),
                      ),
                      contentPadding: EdgeInsets.all(16),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Color(0xffC5C5C5),
                          width: 3.0,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Color(0xFFF35383),
                          width: 3.0,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                SizedBox(
                  height: 46,
                  width: 129,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => SwitchAccountScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'sign in',
                    ),
                  ),
                ),
                // SizedBox(
                //   height: 30,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       'Don\'t have an account? /',
                //       style: TextStyle(
                //         color: Colors.white.withOpacity(.5),
                //         fontSize: 16,
                //         fontFamily: 'GB',
                //       ),
                //     ),
                //     Text(
                //       'Sign up',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 20,
                //         fontFamily: 'GB',
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _getImageContainer() {
    return Positioned(
      top: 60,
      left: 0,
      right: 0,
      bottom: 0,
      child: Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage('images/rocket.png'),
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(),
          )
        ],
      ),
    );
  }
}
