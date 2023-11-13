import 'package:flutter/material.dart';
import 'package:peraplan/pages/home_page.dart';
import 'package:peraplan/components/balance_section.dart';
import 'package:peraplan/utils/styles.dart';

class UsernameSec extends StatefulWidget {
  const UsernameSec({Key? key}) : super(key: key);

  @override
  _UsernameSecState createState() => _UsernameSecState();
}

class _UsernameSecState extends State<UsernameSec> {
  final TextEditingController _usernameController = TextEditingController();

  // Function to navigate to the BalanceSection and HomePage
  void navigateToBalanceSectionAndHomePage() {
    String username = _usernameController.text;

    // Navigate to BalanceSection with the username
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => BalanceSection(username: username),
    ));

    // Navigate to HomePage with the username
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => HomePage(), //To Fix
    ));

    print('Username: $username');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'Pera', style: titlePera),
                  TextSpan(
                    text: 'Plan',
                    style: titlePlan,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _usernameController,
                style: inpAmt,
                textAlign: TextAlign.center, // Center-align entered text
                decoration: InputDecoration(
                  labelText: 'Enter your username',
                  labelStyle: hintAmt,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Color(0xFF0CC0DF),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(
                      color: Color(0xFF0CC0DF),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: navigateToBalanceSectionAndHomePage,
              style: ElevatedButton.styleFrom(
                backgroundColor: hlblue,
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(10.0),
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }
}
