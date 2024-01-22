import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daily_recipes2/pages/Loginpage.dart';
import 'package:daily_recipes2/pages/homepage.dart';
import 'package:provider/provider.dart';
import 'package:daily_recipes2/provider/app_auth.provider.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  void initState() {
    Provider.of<AppAuthProvider>(context, listen: false).providerInit();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("Assets/images/logo.jpg"),
                  fit: BoxFit.cover)),
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(30),
          child: Consumer<AppAuthProvider>(
            builder: (context, authProvider, _) => Form(
              key: authProvider.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Center(
                          child: Container(
                              width: 300,
                              height: 150,
                              child: Image.asset("Assets/images/logo2.png")),
                        ),
                      ),
                      const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      TextField(
                          controller: authProvider.nameController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              label: const Text('Full Name',
                                  style: TextStyle(color: Colors.white)),
                              prefixIcon:
                              Icon(Icons.person, color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide:
                                  BorderSide(color: Colors.white)))),
                      const SizedBox(height: 5),
                      TextField(
                          controller: authProvider.emailController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              label: const Text('Email Address',
                                  style: TextStyle(color: Colors.white)),
                              prefixIcon:
                              Icon(Icons.mail, color: Colors.white),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide:
                                  BorderSide(color: Colors.white)))),
                      const SizedBox(height: 5),
                      TextField(
                          controller: authProvider.passwordController,
                          obscureText: authProvider.obsecureText,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              label: const Text('Password',
                                  style: TextStyle(color: Colors.white)),
                              prefixIcon:
                              Icon(Icons.lock, color: Colors.white),
                              suffixIcon: InkWell(
                                onTap: () => authProvider.toggleObsecure(),
                                child: authProvider.obsecureText
                                    ? Icon(
                                  Icons.visibility_off,
                                  color: Colors.white,
                                )
                                    : Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(18),
                                  borderSide: BorderSide(
                                      color: Colors.white, width: 2)))),
                      const SizedBox(height: 50),
                    ],
                  ),
                  Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => HomePage()));
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )),
                  ),
                  TextButton(
                    onPressed: () {
                      authProvider.signUp(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already registered  ',
                            style:
                            TextStyle(color: Colors.white, fontSize: 15)),
                        Text('Sign in.',
                            style:
                            TextStyle(color: Colors.orange, fontSize: 15))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}