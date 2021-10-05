import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String? text, image;
  final String hour;
  final bool isSender;

  final sender = _Style(
    color: Colors.white,
    backgroundColor: Colors.pink[200],
    border: const BorderRadius.only(
      bottomLeft: Radius.circular(10),
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
    ),
    alignment: CrossAxisAlignment.end,
  );
  final receiver = const _Style(
    color: null,
    backgroundColor: Colors.white,
    border: BorderRadius.only(
      bottomRight: Radius.circular(10),
      topLeft: Radius.circular(10),
      topRight: Radius.circular(10),
    ),
    alignment: CrossAxisAlignment.start,
  );

  ChatMessage({
    Key? key,
    this.text,
    this.image,
    required this.isSender,
    required this.hour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _Style style = isSender ? sender : receiver;

    return Column(
      crossAxisAlignment: style.alignment,
      children: [
        image != null
            ? _Stick(image as String)
            : _Message(style: style, text: text as String),
        Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(hour, style: const TextStyle(color: Colors.grey))),
      ],
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({
    Key? key,
    required this.style,
    required this.text,
  }) : super(key: key);

  final _Style style;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: style.border,
        color: style.backgroundColor,
      ),
      child: Text(text, style: TextStyle(color: style.color)),
    );
  }
}

class _Stick extends StatelessWidget {
  final String image;

  const _Stick(this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      height: 150,
    );
  }
}

class _Style {
  final Color? color, backgroundColor;
  final BorderRadius border;
  final CrossAxisAlignment alignment;

  const _Style({
    required this.color,
    required this.backgroundColor,
    required this.border,
    required this.alignment,
  });
}
