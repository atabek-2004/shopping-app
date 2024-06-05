import 'package:flutter/material.dart';
import 'package:smart_school_app/resources/resources.dart';
import 'package:smart_school_app/widgets/navigation/main_navigation.dart';

class RegistrationWidget extends StatelessWidget {
  const RegistrationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.background),
            fit: BoxFit.cover,
          ),
        ),
        child: const RegisterWidgetBody(),
      ),
    );
  }
}

class RegisterWidgetBody extends StatefulWidget {
  const RegisterWidgetBody({super.key});

  @override
  State<RegisterWidgetBody> createState() => _RegisterWidgetBodyState();
}

class _RegisterWidgetBodyState extends State<RegisterWidgetBody> {
  final controllerName = TextEditingController(text: 'Atabek');
  final emailController = TextEditingController(text: '@');
  final passwordController = TextEditingController(text: 'Atabek2004');
  final confirmPassController = TextEditingController(text: 'Atabek2004');
  String? errorText;

  @override
  Widget build(BuildContext context) {
    void checkFunc() {
      final name = controllerName.text;
      final email = emailController.text;
      final password = passwordController.text;
      final confirmPass = confirmPassController.text;

      if (name.isEmpty) {
        errorText = 'Заполните имя';
      } else if (email.isEmpty) {
        errorText = 'Заполните Email';
      } else if (!email.contains('@') && email.isNotEmpty) {
        errorText = 'Заполните Email правильно';
      } else if (password.length < 6) {
        errorText = 'Пароль должен быть не менше 6 символов';
      } else if (password != confirmPass) {
        errorText = 'Пароль должен быть совпадать';
      } else {
        errorText = null;
        Navigator.of(context).pushNamed(MAinNavigationRoutesName.login);
      }
      setState(() {});
    }

    return ListView(
      children: [
        Column(
          children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                color: Colors.grey.withAlpha(130),
              ),
              child: const ClipRRect(
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (errorText != null)
              Text(
                errorText!,
                style: const TextStyle(color: Colors.red, fontSize: 18),
              ),
            const SizedBox(height: 30),
            TextField(
              controller: controllerName,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                isCollapsed: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                filled: true,
                fillColor: Colors.grey.withAlpha(100),
                prefixIcon: const Icon(Icons.person),
                prefixIconColor: Colors.white,
                hintText: 'User',
                hintStyle: const TextStyle(color: Colors.white60, fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                isCollapsed: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                filled: true,
                fillColor: Colors.grey.withAlpha(100),
                prefixIcon: const Icon(Icons.phone),
                prefixIconColor: Colors.white,
                hintText: 'Phone',
                
                hintStyle: const TextStyle(color: Colors.white60, fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                isCollapsed: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                filled: true,
                fillColor: Colors.grey.withAlpha(100),
                prefixIcon: const Icon(Icons.email),
                prefixIconColor: Colors.white,
                hintText: 'Email',
                hintStyle: const TextStyle(color: Colors.white60, fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              style: const TextStyle(color: Colors.white),
              obscureText: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                isCollapsed: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                filled: true,
                fillColor: Colors.grey.withAlpha(100),
                prefixIcon: const Icon(Icons.lock),
                prefixIconColor: Colors.white,
                hintText: 'Password',
                hintStyle: const TextStyle(color: Colors.white60, fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: confirmPassController,
              style: const TextStyle(color: Colors.white),
              obscureText: true,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                isCollapsed: true,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                filled: true,
                fillColor: Colors.grey.withAlpha(100),
                prefixIcon: const Icon(Icons.lock),
                prefixIconColor: Colors.white,
                hintText: 'Confirm Password',
                hintStyle: const TextStyle(color: Colors.white60, fontSize: 18),
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        ElevatedButton(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
            backgroundColor:
                const WidgetStatePropertyAll(Color.fromARGB(255, 85, 39, 224)),
            padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(vertical: 20)),
          ),
          onPressed: () {
            checkFunc();
          },
          child: const Text(
            'Register',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Already have an account?',
              style: TextStyle(color: Colors.white70, fontSize: 18),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Login',
                style: TextStyle(
                    color: Color.fromARGB(255, 110, 56, 236), fontSize: 20),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
