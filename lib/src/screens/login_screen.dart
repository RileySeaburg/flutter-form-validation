// Copyright (c) 2022 Evolving Software Corporation
//
// This software is released under the MIT License.
// https://opensource.org/licenses/MIT

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {

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
      validator: ( value) {
        // return null if the value is valid
        if (!value!.contains('@')) {
          return 'Please enter a valid email address';
        }
        return null;
      },
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
        validator: ( value) {
          // return null if the value is valid
          if (value!.length < 6) {
            return 'Please enter a valid password';
          }
          return null;
        },
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
