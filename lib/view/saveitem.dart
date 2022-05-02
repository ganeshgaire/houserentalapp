import 'package:flutter/material.dart';

class SavedIteam extends StatefulWidget {
  const SavedIteam({Key? key}) : super(key: key);

  @override
  State<SavedIteam> createState() => _SavedIteamState();
}

class _SavedIteamState extends State<SavedIteam> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 140,
                ),
                Text(
                  'Saved Item',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              height: 1,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                SizedBox(
                  width: 30,
                ),
                Text(
                  'Items :',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  width: 200,
                ),
                Text(
                  'Clear all',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/house2.jpg'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              'The Moon House',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
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
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 36, top: 10),
                        child: Column(
                          children: [
                            const Text(
                              '\$3400',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: const [
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 1,
                    width: 300,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/house3.jpg'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              'The Royal House',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
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
                              Text('3 Bathroom')
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 36, top: 10),
                        child: Column(
                          children: [
                            const Text(
                              '\$4200',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  size: 14,
                                  color: Colors.orange,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('4.2')
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
