import 'package:apk_perpus/screen/akses_admin_screen.dart';
import 'package:flutter/material.dart';
import 'package:apk_perpus/screen/home_scren.dart'; // Halaman anggota
import 'package:apk_perpus/screen/akses_admin_screen.dart'; // Halaman admin

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Color(0xFFF0EDE5),
      appBar: AppBar(
        title: Text("PERPUSTAKAAN DIGITAL"),
        backgroundColor: Color.fromARGB(255, 168, 126, 10),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Username Field
            const Text(
              'Username',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan username',
                filled: true,
                fillColor: Colors.grey[200],
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16),

            // Password Field
            const Text(
              'Password',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan password',
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 24),

            // Login Button
            ElevatedButton(
              onPressed: () {
                final username = usernameController.text.trim();
                final password = passwordController.text.trim();

                if (username.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Harap isi username dan password')),
                  );
                } else {
                  if (username == 'admin' && password == 'admin123') {
                    // Login sebagai Admin
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AksesAdminScreen()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login berhasil sebagai Admin')),
                    );
                  } else {
                    // Login sebagai Anggota
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login berhasil sebagai Anggota')),
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 168, 126, 10),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
