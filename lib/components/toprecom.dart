import 'package:flutter/material.dart';
import 'package:testapp/view/housepage.dart';

class TopRecom extends StatefulWidget {
  TopRecom({Key? key}) : super(key: key);

  @override
  State<TopRecom> createState() => _TopRecomState();
}

class _TopRecomState extends State<TopRecom> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) {
                    return const HousePage();
                  }),
                ),
              );
            },
            child: Stack(
              children: [
                Container(
                  height: 250,
                  width: 180,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/house.jpg')),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.yellow),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 90,
                    width: 180,
                    color: Colors.white.withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Text(
                                'The Royal House',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.favorite_border_rounded,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          const Text(
                            'The Royal House',
                            style: TextStyle(),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Stack(
            children: [
              Container(
                height: 250,
                width: 180,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/house1.jpg')),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.yellow),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 90,
                  width: 180,
                  color: Colors.white.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'The Royal House',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.favorite_border_rounded,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'The Royal House',
                          style: TextStyle(),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Stack(
            children: [
              Container(
                height: 250,
                width: 180,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/house3.jpg')),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.yellow),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 90,
                  width: 180,
                  color: Colors.white.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'The Royal House',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.favorite_border_rounded,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'The Royal House',
                          style: TextStyle(),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Stack(
            children: [
              Container(
                height: 250,
                width: 180,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/house4.jpg')),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.yellow),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 90,
                  width: 180,
                  color: Colors.white.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'The Royal House',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.favorite_border_rounded,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'The Royal House',
                          style: TextStyle(),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Stack(
            children: [
              Container(
                height: 250,
                width: 180,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/house5.jpg')),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.yellow),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 90,
                  width: 180,
                  color: Colors.white.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'The Royal House',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.favorite_border_rounded,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'The Royal House',
                          style: TextStyle(),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Stack(
            children: [
              Container(
                height: 250,
                width: 180,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/house6.jpg')),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.yellow),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 90,
                  width: 180,
                  color: Colors.white.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: const [
                            Text(
                              'The Royal House',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.favorite_border_rounded,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        const Text(
                          'The Royal House',
                          style: TextStyle(),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
