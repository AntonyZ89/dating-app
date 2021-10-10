import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String label, logo;
  final Color color, labelColor;

  const LoginButton({
    Key? key,
    required this.label,
    required this.logo,
    required this.color,
    required this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('home');
        },
        child: Row(
          children: [
            _Logo(logo: logo),
            _Label(label: label, labelColor: labelColor),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(99),
          ),
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label({
    Key? key,
    required this.label,
    required this.labelColor,
  }) : super(key: key);

  final String label;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 16, color: labelColor),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  final String logo;

  const _Logo({
    Key? key,
    required this.logo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Image.asset(logo, width: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withOpacity(0.2),
            )
          ]),
    );
  }
}
