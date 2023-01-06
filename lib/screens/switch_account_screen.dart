import 'dart:ui';

import 'package:flutter/material.dart';

class SwitchAccountScreen extends StatelessWidget {
  const SwitchAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/switch_account_background.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 190,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(255, 2555, 255, 0.5),
                              Color.fromRGBO(255, 255, 255, 0.2)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.red,
                        ),
                        height: 352,
                        width: 340,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 32,
                            ),
                            Image(image: AssetImage('images/profile.png')),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Nima Naderi',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 46,
                              width: 129,
                              child: ElevatedButton(
                                style:
                                    Theme.of(context).elevatedButtonTheme.style,
                                onPressed: () {},
                                child: Text(
                                  'Confirm',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Switch Account',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 63, top: 132),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? /',
                  style: TextStyle(
                    color: Colors.white.withOpacity(.5),
                    fontSize: 16,
                    fontFamily: 'GB',
                  ),
                ),
                Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'GB',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
