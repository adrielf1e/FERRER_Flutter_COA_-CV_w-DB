import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'homepage.dart'; // Replace with the actual import for your homepage

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true; // State variable for password visibility
  bool isLogin = true; // Toggle between Login & Signup

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My CVitae Login Page'),
        backgroundColor: const Color.fromARGB(255, 83, 109, 253),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('images/icon.png'),
                height: 200,
                width: 200,
              ),
              TextFormField(
                style: const TextStyle(
                  fontFamily: 'RobotoMono',
                  color: Colors.indigoAccent,
                ),
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    color: Colors.indigoAccent,
                    fontFamily: 'RobotoMono',
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                      .hasMatch(value)) {
                    return 'Invalid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(
                  fontFamily: 'RobotoMono',
                  color: Colors.indigoAccent,
                ),
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    color: Colors.indigoAccent,
                    fontFamily: 'RobotoMono',
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (_passwordController.text.length < 8) {
                    return 'Password Length should be more than 8 characters';
                  } else if (!RegExp(
                          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]+$')
                      .hasMatch(value)) {
                    return 'Password must meet the requirement';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent),
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    isLogin ? performLogin(context) : performSignup(context);
                  }
                },
                child: Text(
                  isLogin ? 'Login' : 'Sign Up',
                  style: const TextStyle(
                    fontFamily: 'RobotoMono',
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              TextButton(
                onPressed: () => setState(() {
                  isLogin = !isLogin;
                  // Clear the input fields
                  _usernameController.clear();
                  _passwordController.clear();
                }),
                child: Text(
                  isLogin ? 'Create new account' : 'I already have an account',
                  style: const TextStyle(
                    fontFamily: 'RobotoMono',
                    color: Colors.indigoAccent,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  void performLogin(BuildContext context) async {
    var response = await http.post(
      Uri.parse('http://127.0.0.1/test/login.php'),
      body: {
        'email': _usernameController.text,
        'password': _passwordController.text
      },
    );

    final responseData = json.decode(response.body);
    if (responseData == "Login successful") {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) =>
                const Firstpage()), // Replace with your homepage
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid credentials')),
      );
    }
  }

  void performSignup(BuildContext context) async {
    var response = await http.post(
      Uri.parse('http://127.0.0.1/test/signup.php'),
      body: {
        'email': _usernameController.text,
        'password': _passwordController.text
      },
    );

    final responseData = json.decode(response.body);
    if (responseData == "User registered successfully") {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Successfully Signed up, you may now log in')),
      );
      setState(() {
        isLogin = true; // Switch back to login page
        // Clear the input fields
        _usernameController.clear();
        _passwordController.clear();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error during sign up')),
      );
    }
  }
}
