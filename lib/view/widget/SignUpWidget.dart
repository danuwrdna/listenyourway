import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({super.key});
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
                      child: LottieBuilder.network(
                          "https://lottie.host/91f66877-d476-4ea7-80ac-c75d8fdddf32/kJv8xtVzlc.json"),
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: screenSize.width / 10),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Your Email",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12, fontWeight: FontWeight.w300)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: screenSize.width / 10,
                              vertical: screenSize.height / 60),
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                hintText: "Your Password",
                                hintStyle: GoogleFonts.poppins(
                                    fontSize: 12, fontWeight: FontWeight.w300)),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: screenSize.width / 2.8,
                                            vertical: screenSize.height / 40)),
                                    child: Text("Create")))
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
