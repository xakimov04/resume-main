import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:resume_app/views/widgets/contact_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: CircleAvatar(
                radius: 120,
                backgroundColor: Colors.grey.shade300,
                child: CircleAvatar(
                  radius: 115,
                  child: Expanded(
                    child: Image.asset(
                      "assets/person.gif",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'John Doe',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              'Flutter mobile developer\nAndroid native developer\n',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            const Text(
              '1+ years experience',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.blueAccent),
                SizedBox(width: 5),
                Text(
                  'Tashkent, Uzbekistan',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1.5),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: ContactWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
