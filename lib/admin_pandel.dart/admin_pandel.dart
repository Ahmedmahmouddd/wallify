import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallify/admin_pandel.dart/add_wallpaper.dart';
import 'package:wallify/admin_pandel.dart/components/admin_login_button.dart';
import 'package:wallify/admin_pandel.dart/components/admin_login_textfield.dart';
import 'package:wallify/admin_pandel.dart/components/gradient_black_container.dart';
import 'package:wallify/admin_pandel.dart/components/lets_start_admin_text.dart';

class AdminPandel extends StatefulWidget {
  const AdminPandel({super.key});

  @override
  State<AdminPandel> createState() => _AdminPandelState();
}

class _AdminPandelState extends State<AdminPandel> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    loginadmin() {
      FirebaseFirestore.instance.collection("admin").get().then((snapshot) {
        // ignore: avoid_function_literals_in_foreach_calls
        snapshot.docs.forEach((result) {
          if (emailController.text.isEmpty || passwordController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: Colors.black38,
                  content: Text("Email and password are required",
                      style: TextStyle(fontFamily: 'p', fontWeight: FontWeight.w600, color: Colors.white))),
            );
          } else if (result.data()["id"] != emailController.text) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: Colors.black38,
                  content: Text("Wrong Email",
                      style: TextStyle(fontFamily: 'p', fontWeight: FontWeight.w600, color: Colors.white))),
            );
          } else if (result.data()["password"] != passwordController.text) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: Colors.black38,
                  content: Text("Wrong Password",
                      style: TextStyle(fontFamily: 'p', fontWeight: FontWeight.w600, color: Colors.white))),
            );
          } else {
            Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (context) => const AddWallpaper()), (result) => false);
          }
        });
      });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: Stack(
          children: [
            const GradientBlackContainer(),
            Container(
              padding: const EdgeInsets.only(top: 20, right: 25, left: 25),
              child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    const LetsStartAsAdmin(),
                    SizedBox(height: height / 8),
                    Material(
                      borderRadius: BorderRadius.circular(25),
                      elevation: 10,
                      child: Container(
                        decoration:
                            BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(25)),
                        height: height / 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            children: [
                              SizedBox(height: height / 14),
                              AdminLoginTextField(hint: "Enter your email", controller: emailController),
                              const SizedBox(height: 20),
                              AdminLoginTextField(
                                  hint: "Enter your password", controller: passwordController),
                              SizedBox(height: height / 14),
                              AdminLoginButton(onTap: loginadmin, text: "Login")
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
