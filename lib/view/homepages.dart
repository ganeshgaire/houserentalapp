import 'package:flutter/material.dart';
import 'package:testapp/components/nearyou.dart';
import 'package:testapp/components/normal.dart';
import 'package:testapp/components/toprecom.dart';

import 'package:testapp/view/profile.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  int selectedIndex = 0;
  List iteams = [
    {
      "title": "Top Recomended",
    },
    {"title": 'Near you'},
    {"title": 'Normal'}
  ];
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, left: 2, right: 2),
          child: AppBar(
            elevation: 0,
            leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.navigate_before_outlined,
                  size: 40,
                  color: Colors.black,
                )),
            backgroundColor: Colors.white,
            title: const Text('House Rental App'),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) {
                        return const ProfilePage();
                      }),
                    ),
                  );
                },
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/avatar.png'),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hello Ganesh!',
              style: TextStyle(fontSize: 15),
            ),
            const Text(
              'Find your sweet Home',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color.fromARGB(255, 231, 225, 225),
              ),
              child: Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.search),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search houses near you'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 50,
              // child: ListView(
              //   scrollDirection: Axis.horizontal,
              //   children: [
              //     Column(
              //       children: [
              //         const Text(
              //           'Top Recommended',
              //           style: TextStyle(
              //               fontSize: 18,
              //               color: Colors.purple,
              //               fontWeight: FontWeight.bold),
              //         ),
              //         const SizedBox(
              //           height: 10,
              //         ),
              //         Container(
              //           color: Colors.purple,
              //           height: 3,
              //           width: 150,
              //         )
              //       ],
              //     ),
              //     const SizedBox(
              //       width: 15,
              //     ),
              //     const Text(
              //       'Near You',
              //       style: TextStyle(fontSize: 18, color: Colors.grey),
              //     ),
              //     const SizedBox(
              //       width: 15,
              //     ),
              //     const Text(
              //       'Normal',
              //       style: TextStyle(fontSize: 18, color: Colors.grey),
              //     ),
              //     const SizedBox(
              //       width: 15,
              //     ),
              //     const Text(
              //       'Vip Room',
              //       style: TextStyle(fontSize: 18, color: Colors.grey),
              //     ),
              //     const Text(
              //       'Best',
              //       style: TextStyle(fontSize: 18, color: Colors.grey),
              //     ),
              //   ],
              // ),

              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: iteams.length,
                  itemBuilder: ((context, index) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Column(
                            children: [
                              Text(
                                iteams[index]['title'],
                                style: TextStyle(
                                    fontSize: 16,
                                    color: index == selectedIndex
                                        ? Colors.purple
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              index == selectedIndex
                                  ? Container(
                                      color: Colors.purple,
                                      height: 3,
                                      width: 120,
                                    )
                                  : Container()
                            ],
                          ),
                        ));
                  })),
            ),
            const SizedBox(
              height: 20,
            ),
            selectedIndex == 0
                ? TopRecom()
                : selectedIndex == 1
                    ? NearYou()
                    : NormalRoom(),
            const SizedBox(
              height: 25,
            ),
            Row(
              children: const [
                Text(
                  'Best Offer',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 210,
                ),
                Text(
                  'See All',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 229, 226, 226),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: height * 0.23,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          image: AssetImage('assets/house.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text(
                          'The Moon House',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.share_location),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '972 lokeshere Ct',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.bed),
                          SizedBox(
                            width: 8,
                          ),
                          Text('3 Bedroom'),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.bathroom),
                          SizedBox(
                            width: 8,
                          ),
                          Text('4 Bathroom')
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: const [
                          Text(
                            '\$3400',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Colors.orange,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('4.8')
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 229, 226, 226),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: height * 0.23,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    width: width * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          image: AssetImage('assets/house1.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Text(
                          'The Royal House',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.share_location),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            '972 Mahendra st',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.bed),
                          SizedBox(
                            width: 8,
                          ),
                          Text('4 Bedroom'),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: const [
                          Icon(Icons.bathroom),
                          SizedBox(
                            width: 8,
                          ),
                          Text('3 Bathroom')
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: const [
                          Text(
                            '\$2800',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Icon(
                            Icons.star,
                            size: 14,
                            color: Colors.orange,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text('4.5')
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
