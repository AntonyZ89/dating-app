import 'package:dating_app/components/components.dart';
import 'package:dating_app/factories/user_factory.dart';
import 'package:dating_app/models/models.dart';
import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<UserModel> profiles = UserFactory().generateFakeList(length: 10);
  final List<UserModel> profilesList =
      UserFactory().generateFakeList(length: 10);

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomeList(profilesList),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TransformerPageView(
                  loop: true,
                  onPageChanged: (newIndex) {
                    if (newIndex != null) {
                      setState(() {
                        index = newIndex;
                      });
                    }
                  },
                  transformer: ScaleAndFadeTransformer(),
                  itemBuilder: (BuildContext context, int index) =>
                      Card(profiles[index]),
                  itemCount: profiles.length,
                ),
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
                      Navigator.of(context)
                          .pushNamed('chat', arguments: profiles[index]);
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
  final UserModel item;

  const Card(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Stack(
            children: [
              const Center(child: CircularProgressIndicator()),
              Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.zero,
                    bottomRight: Radius.circular(40),
                  ),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: item.picture,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          left: MediaQuery.of(context).size.width / 6.5,
          right: MediaQuery.of(context).size.width / 6.5,
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
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.place, size: 18),
                    Text(
                      item.location,
                      style: const TextStyle(
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
