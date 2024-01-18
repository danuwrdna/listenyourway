import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listenyourway/view/page/TabBarPage.dart';
import 'package:lottie/lottie.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: screenSize.height / 40),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenSize.height / 2,
                      width: screenSize.width / 2,
                      child: FutureBuilder(
                        future: _loadLottieAnimation(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Lottie.network(
                              "https://lottie.host/91f66877-d476-4ea7-80ac-c75d8fdddf32/kJv8xtVzlc.json",
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: screenSize.width / 10),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Your Email",
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: screenSize.width / 10,
                            vertical: screenSize.height / 60,
                          ),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: "Your Password",
                              hintStyle: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TabBarPage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenSize.width / 2.8,
                                    vertical: screenSize.height / 40,
                                  ),
                                ),
                                child: Text("Login"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: screenSize.height / 60,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "Or Login With",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w300,
                              fontSize: 12,
                            ),
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: screenSize.width / 50,
                                      vertical: screenSize.height / 60,
                                    ),
                                    height: screenSize.height / 20,
                                    width: screenSize.width / 20,
                                    child: Image.asset("assets/Googlelogo.png"),
                                  ),
                                  Container(
                                    height: screenSize.height / 20,
                                    width: screenSize.width / 20,
                                    child: Image.asset("assets/Facbook.png"),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    child: Text(
                                      "Don't Have Account Sign Up Here",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _loadLottieAnimation() async {
    await Future.delayed(Duration(seconds: 3));
  }
}
