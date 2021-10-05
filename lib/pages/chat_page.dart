import 'dart:async';
import 'package:intl/intl.dart';

import 'package:dating_app/components/components.dart';
import 'package:dating_app/models/models.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final _scrollController = ScrollController();

  final _messages = [
    const ChatMessageModel(
      text: 'Hi Reiner, Nice to meet you! Thanks for add me here 😁',
      isSender: false,
      hour: '10:20',
    ),
    const ChatMessageModel(
      text: "Hello Caroline! I'm fine thanks. Nice to meet you too 😂",
      isSender: true,
      hour: '10:20',
    ),
    const ChatMessageModel(
      text: 'Wanna play with me? :D',
      isSender: false,
      hour: '10:20',
    ),
    const ChatMessageModel(
      image: 'assets/stick/pink panther.png',
      isSender: true,
      hour: '10:20',
    ),
  ];

  void sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        final DateTime now = DateTime.now();
        final hour = DateFormat('H:m').format(now);

        _messages.add(
          ChatMessageModel(
              text: _messageController.text, isSender: true, hour: hour),
        );

        _messageController.text = '';

        Timer(const Duration(milliseconds: 100), () {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 750),
          );
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const ChatAppBar(),
        backgroundColor: Colors.pink[50],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 12),
                  controller: _scrollController,
                  children: _messages
                      .map(
                        (message) => ChatMessage(
                          text: message.text,
                          image: message.image,
                          isSender: message.isSender,
                          hour: message.hour,
                        ),
                      )
                      .toList(),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                padding: const EdgeInsets.only(
                    top: 10, right: 10, bottom: 10, left: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          labelStyle: TextStyle(
                            fontSize: 16,
                          ),
                          hintText: 'Send Messages',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 30,
                      child: Transform.rotate(
                        angle: math.pi / -3.5,
                        child: IconButton(
                          icon: const Icon(Icons.send),
                          onPressed: sendMessage,
                          color: Colors.black87,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
