import 'package:flutter/material.dart';
import 'package:peraplan/utils/styles.dart';
import 'package:peraplan/pages/perain_page.dart';
import 'package:peraplan/pages/peraout_page.dart'; // Import the PeraOutPage

class PeraButton extends StatelessWidget {
  const PeraButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildButton(
            context, Icons.add, white, "Pera In", subGreen, const PeraInPage()),
        SizedBox(width: large),
        _buildButton(context, Icons.remove, white, "Pera Out", subRed,
            const PeraOutPage()),
      ],
    );
  }

  Widget _buildButton(BuildContext context, IconData icon, Color color,
      String label, TextStyle textStyle, Widget pageToNavigate) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  pageToNavigate, // Navigate to the specified page
            ));
          },
          borderRadius: BorderRadius.circular(50),
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [hlblue, text]),
            ),
            child: Icon(
              icon,
              color: color,
              size: 35,
            ),
          ),
        ),
        Text(
          label,
          style: textStyle,
        ),
      ],
    );
  }
}
