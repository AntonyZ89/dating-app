import 'package:dating_app/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const HomeDrawer(),
        appBar: AppBar(
            title: const Text('Dating Ape'),
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.black,
            elevation: 0,
            actions: [
              CircleAvatar(
                child: const Icon(Icons.person),
                backgroundColor: Colors.grey[350],
                foregroundColor: Colors.white,
              ),
            ]),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HomeList(),
            Expanded(
              child: TransformerPageView(
                loop: true,
                transformer: ScaleAndFadeTransformer(),
                itemBuilder: (BuildContext context, int index) => const Card(),
                itemCount: 3,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 30,
                    top: 25,
                    bottom: 25,
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.black87,
                    radius: 30,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.close),
                      color: Colors.white,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.red[50],
                  radius: 30,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('chat');
                    },
                    icon: const Icon(Icons.favorite),
                    color: Colors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
              bottomLeft: Radius.zero,
              bottomRight: Radius.circular(40),
            ),
            child: Image.network('https://via.placeholder.com/1080x1920'),
          ),
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 5,
          right: MediaQuery.of(context).size.width / 5,
          child: Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name Here',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.place,
                      size: 18,
                    ),
                    Text(
                      'Name Here',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
