import 'package:bubble/data/colors.dart';
import 'package:bubble/data/variables.dart';
import 'package:bubble/screens/home_screen.dart';
import 'package:bubble/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  void signInFunc() {
    if (signInEmailController.text.isNotEmpty &&
        signInEmailController.text.contains("@gmail.com") &&
        signInPasswordController.text.isNotEmpty &&
        signInPasswordController.text.length >= 8 &&
        signInPasswordController.text.length <= 16) {
      print("O'tdi");
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
          (route) => false);
    } else {
      print("O'tmadi");
      if (signInEmailController.text.isEmpty) {
        setState(() {
          errorMessage = "Emailga malumot kiriting.";
        });
      } else if (signInEmailController.text.contains("@gmail.com") == false) {
        setState(() {
          errorMessage =
              "Emailning oxiri @gmail.com kalit so'zi bilan tugashi kerak.";
        });
      } else if (signInPasswordController.text.isEmpty ||
          signInPasswordController.text.length > 16 ||
          signInPasswordController.text.length < 8) {
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
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
            size: 35,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ),
              );
            },
            child: Text(
              "Sign Up",
              style: usernameStyle,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: background,
          // image: DecorationImage(
          //   image: AssetImage("assets/images/back_login.jpg"),
          //   fit: BoxFit.fill,
          // ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height / 8,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Sign In",
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
                  controller: signInEmailController,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  enableInteractiveSelection: false,
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
                  style: TextStyle(
                    color:
                        checkValueIn ? Colors.white : Colors.blueGrey.shade200,
                  ),
                  controller: signInPasswordController,
                  onSubmitted: (value) {
                    setState(() {});
                  },
                  obscureText: !checkValueIn,
                  onEditingComplete: () {
                    setState(() {
                      checkValueIn = false;
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
                    counterText: "${signInPasswordController.text.length}:16",
                    counterStyle: const TextStyle(
                      color: Colors.blueGrey,
                    ),
                    hintText: "Password",
                    hintStyle: const TextStyle(
                      color: Colors.blueGrey,
                    ),
                    suffixIconColor: bubbleColor,
                    suffixIcon: Icon(
                      checkValueIn
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
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Checkbox(
                      side: const BorderSide(
                        color: bubbleColor,
                        width: 2,
                      ),
                      activeColor: bubbleColor,
                      tristate: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3)),
                      value: checkValueIn,
                      onChanged: (value) {
                        setState(() {
                          checkValueIn = !checkValueIn;
                        });
                      },
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
                  vertical: 25,
                ),
                child: Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        signInFunc();
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
                          "Sign In",
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
    );
  }
}
