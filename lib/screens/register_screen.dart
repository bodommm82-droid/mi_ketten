import 'package:flutter/material.dart'
    show
        AppBar,
        BuildContext,
        Column,
        EdgeInsets,
        ElevatedButton,
        InputDecoration,
        Navigator,
        Padding,
        Scaffold,
        ScaffoldMessenger,
        SizedBox,
        SnackBar,
        State,
        StatefulWidget,
        Text,
        TextEditingController,
        TextField,
        Widget;
import 'package:provider/provider.dart';
import "../providers/user_provider.dart";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  Future<Widget> build(BuildContext context) async {
    return Scaffold(
      appBar: AppBar(title: const Text("Regisztráció")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: "Felhasználónév")),
            TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email")),
            TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: "Jelszó"),
                obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Meghívjuk az AuthService regisztrációs metódusát
                // Érdemes a UserProviderbe áttenni ezt a logikát is
                final success = await context.read<UserProvider>().registerUser(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                      _usernameController.text.trim(),
                    );

                if (success != null) {
                  Navigator.pop(
                      // ignore: use_build_context_synchronously
                      context); // Vissza a loginra vagy a főképernyőre
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Hiba történt!")));
                }
              },
              child: const Text("Regisztráció"),
            ),
          ],
        ),
      ),
    );
  }
}
