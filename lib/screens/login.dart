import 'package:bankingapp/screens/transfer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bankingapp/screens/home.dart';
import 'package:bankingapp/utilities/theme.dart';
import 'package:bankingapp/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _phoneNumber = '';
  String _password = '';

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Simulate authentication (Replace this with your actual authentication logic)
      bool loginSuccessful = await _authenticate(_phoneNumber, _password);

      if (loginSuccessful) {
        // Set the user's account number as their phone number
        String accountNumber = _phoneNumber;

        // Update login state in provider
        Provider.of<UserData>(context, listen: false).setLogin(true);
        Provider.of<UserData>(context, listen: false)
            .setAccountNumber(accountNumber);

        // Navigate to home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content:
                Text('Invalid phone number or password. Please try again.'),
          ),
        );
      }
    }
  }

  Future<bool> _authenticate(String phoneNumber, String password) async {
    // Simulate a delay to mimic network request
    await Future.delayed(Duration(seconds: 2));

    // Simulate successful authentication (Replace this with your actual logic)
    // For demonstration purposes, check if phone number is valid (starts with '080') and password is 'password'
    if (phoneNumber.startsWith('080') && password == 'password') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: myTheme, // Assuming myTheme is defined in utilities/theme.dart
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  labelText: 'Phone Number (Account Number)',
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
