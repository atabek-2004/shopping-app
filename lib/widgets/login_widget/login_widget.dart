import 'package:flutter/material.dart';
import 'package:smart_school_app/resources/resources.dart';
import 'package:smart_school_app/widgets/navigation/main_navigation.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

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
        child: ListView(
          children: const [LoginWidgetBody()],
        ),
      ),
    );
  }
}

class LoginWidgetBody extends StatefulWidget {
  const LoginWidgetBody({super.key});

  @override
  State<LoginWidgetBody> createState() => _LoginWidgetBodyState();
}

class _LoginWidgetBodyState extends State<LoginWidgetBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100),
        const Text(
          'Online Shop',
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 250),
        TextField(
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
        const SizedBox(height: 15),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(MAinNavigationRoutesName.registrtion);
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.grey, fontSize: 18),
              )),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ButtonStyle(
              shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
              backgroundColor: const WidgetStatePropertyAll(
                  Color.fromARGB(255, 85, 39, 224)),
              padding: const WidgetStatePropertyAll(
                  EdgeInsets.symmetric(vertical: 20)),
            ),
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(MAinNavigationRoutesName.homePage);
            },
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
