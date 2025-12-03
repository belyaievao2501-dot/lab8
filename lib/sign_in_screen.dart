import 'package:flutter/material.dart';
import 'package:lab8/password_screen.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();

  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Будь ласка, введіть логін або email';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                   Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/1024px-Google-flutter-logo.svg.png",
                    width: 200,
                  ),

                  const Text(
                    'Вхід у систему',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 32.0),

                  const Text('Логін', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: _loginController,
                    validator: _validateEmail,
                    decoration: const InputDecoration(
                      hintText: 'Введіть логін',
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  const Text('Пароль', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Будь ласка, введіть пароль';
                      }
                      if (value.length < 6) {
                        return 'Пароль має містити мінімум 6 символів';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Введіть пароль',
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ResetPasswordScreen()),
                        );
                      },
                      child: const Text("Забули пароль?"),
                    ),
                  ),
                  const SizedBox(height: 24.0),

                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Виконується вхід...')),
                        );
                      }
                    },
                    child: const Text("Увійти"),
                  ),

                  const SizedBox(height: 16.0),

                  const Row(children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("або"),
                    ),
                    Expanded(child: Divider()),
                  ]),

                  const SizedBox(height: 16.0),

                  OutlinedButton(
                    onPressed: () {
                      _formKey.currentState?.reset();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignUpScreen()),
                      );
                    },
                    child: const Text("Створити акаунт"),
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