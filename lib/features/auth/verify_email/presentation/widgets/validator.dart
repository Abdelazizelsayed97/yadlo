
import 'package:flutter/material.dart';

class Validator {

  // Define the global key for the form
  final _formKey = GlobalKey<FormState>();

  // Define the controllers for the input fields
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Define the focus nodes for the input fields
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  // Define the variables to store the input values
  final String _email = '';
  final String _password = '';

  // Define the validation logic for the email field
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  // Define the validation logic for the password field
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  // Define the method to handle the submission of the form
  void _submitForm() {
    // Validate the input fields
    if (_formKey.currentState!.validate()) {
      // Save the input values
      _formKey.currentState!.save();
      // Print the input values for debugging
      print('Email: $_email');
      print('Password: $_password');
      // TODO: Implement the login logic
    }
  }
}

