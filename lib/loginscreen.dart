import 'package:flutter/material.dart';
/*void main(){
  // Wrap your LoginScreen inside the 'home' property of a MaterialApp
  runApp(const MaterialApp(
    home: LoginScreen(),
    debugShowCheckedModeBanner: false, // This hides the ugly "DEBUG" banner!
  ));
}*/
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page'),),
      body: Padding(padding: const EdgeInsets.all(16.0),
      child: Form(key: _formKey,
      child: Column(
        children: [
          const Text('Welcome Back!'),
          const SizedBox(height: 40),
          TextFormField(
            controller: emailController, // <--- Attached!
            decoration: const InputDecoration(labelText: 'Email Address'),
            validator: (value){
              if(value == null || value.isEmpty) {
                return 'Please enter your email'; // Fails if empty
              }
              if(!value.contains('@')){
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField( obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(labelText: 'Password'),
            validator:(value){
              // 1. Check if it is completely empty
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }

              // 2. Check if it is too short
              if (value.length < 6) {
                return 'Password must be at least 6 characters';
              }

              // 3. If it passes both checks, return null (meaning no errors!)
              return null;
              },
          ),
          const SizedBox(height: 30),
          ElevatedButton(onPressed: (){
            if(_formKey.currentState!.validate()){
              print('Attempting login with Email: ${emailController.text}');
              print('Password entered: ${passwordController.text}');
            }
            else {
              print('Validation Failed! Fix the red errors.');
            }


          }, child: const Text('Login')),
        ],
      ),),)

    );
  }
}
