import 'package:bubble/data/colors.dart';
import 'package:bubble/data/variables.dart';
import 'package:bubble/screens/home_screen.dart';
import 'package:bubble/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  void signUpFunc() {
    if (signUpUsernameController.text.isNotEmpty &&
        signUpEmailController.text.isNotEmpty &&
        signUpEmailController.text.contains("@gmail.com") &&
        signUpPasswordController.text.isNotEmpty &&
        signUpPasswordController.text.length >= 8 &&
        signUpPasswordController.text.length <= 16) {
      print("O'tdi");
      Username = signUpUsernameController.text;
      Email = signUpEmailController.text;
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
          (route) => false);
    } else {
      print("O'tmadi");
      if (signUpUsernameController.text.isEmpty) {
        setState(() {
          errorMessage = "Ismingizni kiriting.";
        });
      } else if (signUpEmailController.text.isEmpty) {
        setState(() {
          errorMessage = "Emailga malumot kiriting.";
        });
      } else if (signUpEmailController.text.contains(" ")) {
        setState(() {
          errorMessage = "Emailda bo'sh joy bor.";
        });
      } else if (signUpEmailController.text.contains("@gmail.com") == false) {
        setState(() {
          errorMessage =
              "Emailning oxiri @gmail.com kalit so'zi bilan tugashi kerak.";
        });
      } else if (signUpPasswordController.text.isEmpty ||
          signUpPasswordController.text.length > 16 ||
          signUpPasswordController.text.length < 8) {
        setState(() {
          errorMessage = "Parolning uzunligi kamida 8 ta bo'lishi kerak";
        });
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: bottomNavigationColor,
          content: Text("Error!\n$errorMessage"),
          showCloseIcon: true,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        backgroundColor: background,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignIn(),
                ),
              );
            },
            child: Text(
              "Sign in",
              style: usernameStyle,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: background,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height / 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 45,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: signUpUsernameController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    onEditingComplete: () {
                      setState(() {
                        Username = signUpUsernameController.text;
                      });
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: bubbleColor,
                          )),
                      hintText: "Username",
                      hintStyle: const TextStyle(
                        color: Colors.blueGrey,
                      ),
                      suffixIconColor: bubbleColor,
                      suffixIcon: const Icon(
                        Icons.person_rounded,
                      ),
                      fillColor: bottomNavigationColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: signUpEmailController,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    onEditingComplete: () {
                      setState(() {
                        Email = signUpEmailController.text;
                      });
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: bubbleColor,
                          )),
                      hintText: "Email",
                      hintStyle: const TextStyle(
                        color: Colors.blueGrey,
                      ),
                      suffixIconColor: bubbleColor,
                      suffixIcon: const Icon(
                        Icons.email_rounded,
                      ),
                      fillColor: bottomNavigationColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    controller: signUpPasswordController,
                    onSubmitted: (value) {
                      setState(() {});
                    },
                    obscureText: !checkValueUp,
                    onEditingComplete: () {
                      setState(() {
                        checkValueUp = false;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        passwordIndex = value.length;
                      });
                    },
                    maxLength: 16,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: bubbleColor,
                          )),
                      counterText: "${signUpPasswordController.text.length}:16",
                      counterStyle: const TextStyle(
                        color: Colors.blueGrey,
                      ),
                      hintText: "Password",
                      hintStyle: const TextStyle(
                        color: Colors.blueGrey,
                      ),
                      suffixIconColor: bubbleColor,
                      suffixIcon: Icon(
                        checkValueUp
                            ? Icons.lock_open_rounded
                            : Icons.lock_rounded,
                      ),
                      fillColor: bottomNavigationColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onLongPress: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Home(),
                              ),
                              (route) => false);
                        },
                        child: Checkbox(
                          side: const BorderSide(
                            color: bubbleColor,
                            width: 2,
                          ),
                          activeColor: bubbleColor,
                          tristate: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3)),
                          value: checkValueUp,
                          onChanged: (value) {
                            setState(() {
                              checkValueUp = !checkValueUp;
                            });
                          },
                        ),
                      ),
                      const Text(
                        "Show password",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 15,
                  ),
                  child: Builder(builder: (context) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() {
                          signUpFunc();
                        });
                      },
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                        bottomNavigationColor,
                      )),
                      child: SizedBox(
                        width: size.width,
                        height: 50,
                        child: const Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: bubbleColor,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
