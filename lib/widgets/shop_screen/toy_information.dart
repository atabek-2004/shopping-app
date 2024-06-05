import 'package:flutter/material.dart';
import 'package:smart_school_app/resources/resources.dart';

class ToyInformationWidget extends StatefulWidget {
  final int id;
  const ToyInformationWidget({super.key, required this.id});

  @override
  State<ToyInformationWidget> createState() => _ToyInformationWidgetState();
}

class _ToyInformationWidgetState extends State<ToyInformationWidget> {
  @override
  Widget build(BuildContext context) {
    return const ToyInformationWidgetBody();
  }
}

class ToyInformationWidgetBody extends StatelessWidget {
  const ToyInformationWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 38, 54),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Shopping'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: ListView(
          children: const [
            Image(image: AssetImage(Images.bus2)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'School Bus',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black),
                ),
                Text('\$105.00', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
