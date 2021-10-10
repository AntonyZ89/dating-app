import 'package:dating_app/models/models.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatefulWidget implements PreferredSizeWidget {
  final UserModel item;

  const ChatAppBar(this.item, {Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _ChatAppBarState createState() => _ChatAppBarState();
}

class _ChatAppBarState extends State<ChatAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: _Title(widget.item),
      foregroundColor: Colors.black87,
      actions: [
        IconButton(
          icon: const Icon(Icons.call),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.info_outline),
          onPressed: () {},
        ),
      ],
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }
}

class _Title extends StatelessWidget {
  final UserModel item;

  const _Title(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          child: const Icon(Icons.person),
          backgroundColor: Colors.grey[350],
          foregroundColor: Colors.white,
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),
                  const Text(
                    'Status',
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
