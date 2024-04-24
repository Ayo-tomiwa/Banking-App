import 'package:bankingapp/screens/transfer.dart';
import 'package:bankingapp/utilities/theme.dart';
import 'package:bankingapp/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _phoneNumber = '';
  String _password = '';

  void _handleLogin() async {
    // Implement login logic using phone number and password
    // Update login state in provider if login is successful
    Provider.of<UserData>(context, listen: false).setLogin(true);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  labelText: 'Phone Number',
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your phone number' : null,
                  onSaved: (value) => _phoneNumber = value!,
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10.0),
                CustomTextField(
                  labelText: 'Password',
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter your password' : null,
                  onSaved: (value) => _password = value!,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 20.0),
                CustomButton(text: 'Login', onPressed: _handleLogin),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
