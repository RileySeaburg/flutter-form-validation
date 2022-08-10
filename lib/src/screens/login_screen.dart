// Copyright (c) 2022 Evolving Software Corporation
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}
/// Copyright (c) 2022 Evolving Software Corporation
/// LoginScreenState is a stateful widget that contains the state of the login screen.
/// It is a stateful widget because it needs to keep track of the user's input.
/// It also contains the logic for validating the user's input using a ValidationMixin.
class LoginScreenState extends State<LoginScreen> with ValidationMixin{

  final _formKey = GlobalKey<FormState>();
  String password = '';
  String email = '';

  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
          // render the email, password and button widgets
          emailField(),
          passwordField(),
          Container(margin: const EdgeInsets.only(top: 20.0)),
          submitButton(),
          ]
        ),
      ),
    );
  }

  // Create email widget
  Widget emailField() {
    return TextFormField(
      keyboardAppearance: Brightness.dark,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email Address',
        border: OutlineInputBorder(),
        hintText: 'Enter your email ex: you@example.com',
      ),
      validator: validateEmail,
      onSaved: ( value) {
        email = value!;
      },
    );
  }

  // // Create password widget
  Widget passwordField() {
   return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: TextFormField(
        keyboardAppearance: Brightness.dark,
        obscureText: true,
        decoration: const InputDecoration(
          labelText: 'Password',
          border: OutlineInputBorder(),
          hintText: 'Enter your password',
        ),
        validator: validatePassword,
        onSaved: ( value) {
          password = value!;
        },
      ),
      
    );
  }

  // // Create submit button
  Widget submitButton() {
    return ElevatedButton(
      child: Text('Login'),
      onPressed: () {
        // access the form state and validate the form
       if (_formKey.currentState!.validate()) {
          // if the form is valid, save the form
          _formKey.currentState!.save();
          print('Email: ${email}');
          print('Password: ${password}');
          // show a snackbar
       }
      },
      
    );
  }
}
