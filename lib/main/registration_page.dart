import 'package:flutter/material.dart';
import 'package:jad_app/main/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'login_page.dart';

//final nameController = TextEditingController();
//final passController = TextEditingController();
//final emailController = TextEditingController();
//final countryController = TextEditingController();
//final cityController = TextEditingController();

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

//enum FormType{
//  login,
//  register
//}

class _RegisterState extends State<Register> {

//  final formKey = GlobalKey<FormState>();
  FormType _formType = FormType.register;

//  @override
//  void dispose() {
//    // Clean up the controller when the Widget is disposed
//    nameController.dispose();
//    passController.dispose();
//    emailController.dispose();
//    countryController.dispose();
//    cityController.dispose();
//    super.dispose();
//  }

  @override
  void initState() {
    nameController.clear();
    emailController.clear();
    passController.clear();
    countryController.clear();
    cityController.clear();

    super.initState();
  }

  bool validateAndSave(){
    final form = formKey.currentState;
    form.save();
    if (form.validate()){
      form.save();
      return true;
    }else{
      return false;
    }
  }

  void createUser() async {
    if (validateAndSave()){
      try {
        FirebaseUser user = await FirebaseAuth
            .instance
            .createUserWithEmailAndPassword(
            email: emailController.text,
            password: passController.text);
      }catch (e){
        print('Error>>>>>>>>>>>>>>>$e');
      }
    }
  }


  void moveToLogin(){
    setState(() {
      _formType = FormType.login;
    });
  }

  var checkboxVal = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[ Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text.rich(
                  TextSpan(text: 'Sign In'),
                  style: TextStyle(fontSize: 25.0, color: Colors.black54),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Username'),
                controller: nameController,
                validator: (value)=>value.isEmpty ? 'Username is reqired': null,
              ),
              TextFormField(
//                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(labelText: 'Email'),
                controller: emailController,
                validator: (value)=>value.isEmpty ? 'Email is reqired': null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                controller: passController,
                validator: (value)=>value.isEmpty ? 'Password is reqired': null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter your country'),
                controller: countryController,
                validator: (value)=>value.isEmpty ? 'Country is reqired': null,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Enter your city'),
                controller: cityController,
                validator: (value)=>value.isEmpty ? 'City is reqired': null,
              ),
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        activeColor: Colors.lightBlueAccent,
                        value: checkboxVal,
                        onChanged: (bool newValue) {
                          setState(() {
                            checkboxVal = newValue;
                          });
                        },
                      ),
                      Text(
                        'Subscribe on news',
                        style: TextStyle(color: Colors.black45),
                      )
                    ],
                  )),
              Container(padding: EdgeInsets.all(16.0),
                child: MaterialButton(
                  onPressed: (){
                    Navigator.pop(context);
                    createUser();
//            MyDatabase().createUser(
//              nameController.text,
//              emailController.text,
//              passController.text,
//              countryController.text,
//              cityController.text,
//              checkboxVal,
//            );
                  },
                  child: Text('Register',
                    style: TextStyle(color: Colors.black54, fontSize: 20.0),
                  ),
                ),
              ),
              Container(padding: EdgeInsets.all(16.0),
                child: MaterialButton(
                    onPressed: (){
                      moveToLogin();
                    },
                  child: Text('Sign in',
                    style: TextStyle(color: Colors.black54, fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
        ],
      ),

    );
  }
}
