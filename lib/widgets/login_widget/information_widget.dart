import 'package:flutter/material.dart';
import 'package:smart_school_app/resources/resources.dart';
import 'package:smart_school_app/widgets/navigation/main_navigation.dart';

class InformationWidget extends StatelessWidget {
  const InformationWidget({super.key});

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
        child: const InformationWidgetBody(),
      ),
    );
  }
}

class InformationWidgetBody extends StatefulWidget {
  const InformationWidgetBody({super.key});

  @override
  State<InformationWidgetBody> createState() => _InformationWidgetBodyState();
}

class _InformationWidgetBodyState extends State<InformationWidgetBody> {
  bool? isChecked = true;

  void registerScreen() {
    if (isChecked == true) {
      Navigator.of(context).pushNamed(MAinNavigationRoutesName.registrtion);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            const Text(
              'Here you will find great products at competitive prices. Select the products you like, add them to your cart and pay in just a few steps. Happy shopping!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 2,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 30),
            const Text(
              'Explore our range of quality products. Add items to your cart, place your order and enjoy your shopping. Fast, convenient and safe!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  letterSpacing: 2,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 40),
            const Text(
              'Application Version 1.0',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  letterSpacing: 2,
                  fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 40),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.compare,
                  color: Colors.red,
                ),
                SizedBox(width: 15),
                Text(
                  'Company Green',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: 2,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: const ButtonStyle(
                padding: WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 100, vertical: 15)),
                backgroundColor:
                    WidgetStatePropertyAll(Color.fromARGB(255, 25, 59, 84)),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              onPressed: () {
                registerScreen();
              },
              child: const Text(
                'REGISTER',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Checkbox(
                  checkColor: Colors.blue,
                  fillColor: const WidgetStatePropertyAll(Colors.white),
                  value: isChecked,
                  onChanged: (newBool) {
                    setState(() {
                      isChecked = newBool;
                    });
                  },
                ),
                const Text(
                  'I agree with the terms',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'User Agreement',
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
