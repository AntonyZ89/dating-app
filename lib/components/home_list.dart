import 'package:flutter/material.dart';

class HomeList extends StatelessWidget {
  const HomeList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(bottom: 20),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) => const _Profile()),
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2.5),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF937EE1), Color(0xFFFFC1DD)],
          stops: [0, 1],
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(28),
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(1.5),
        child: Container(
          padding: const EdgeInsets.all(6.5),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(27),
              topLeft: Radius.circular(27),
              topRight: Radius.circular(27),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(99),
              topLeft: Radius.circular(99),
              topRight: Radius.circular(99),
            ),
            child: Image.network(
              'https://via.placeholder.com/1080x1920',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
