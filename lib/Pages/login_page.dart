import 'package:flutter/material.dart';
import 'package:flutter_projects/Routes/MyRoutes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool btnChanged = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/login_image.png", fit: BoxFit.cover),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome, $name",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter UserName",
                          labelText: "UserName"),
                      validator: (value){
                        if(value?.isEmpty ?? true)
                          {
                            return "UserName Cannot be empty";
                          }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                          hintText: "Enter Password", labelText: "Password"),
                      validator: (value){
                        if(value?.isEmpty ?? true)
                          {
                            return "Password cannot be empty";
                          }
                        else if(value!.length <= 6)
                          {
                            return "password length should be atleast 6";
                          }
                        return null;
                      },
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Material(
                borderRadius: BorderRadius.circular(btnChanged?50:8),
                child: InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    width: btnChanged ? 50 : 150,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.deepPurple,
                        // shape: btnChanged?BoxShape.circle:BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(btnChanged ? 40 : 5)
                    ),
                    child: btnChanged?Icon(Icons.done,color: Colors.white,):Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  moveToHome(BuildContext context) async
  {
    if(_formKey.currentState!.validate()){
      setState(() {
      btnChanged = true;
    });
    await Future.delayed(Duration(seconds: 1));
    await Navigator.pushNamed(context, MyRoutes.homeRoute);
    setState(() {
      btnChanged = false;
    });
  }
  }
}
