import 'package:flutter/material.dart';

class HousePage2 extends StatefulWidget {
  const HousePage2({
    Key? key,
  }) : super(key: key);

  @override
  State<HousePage2> createState() => _HousePage2State();
}

class _HousePage2State extends State<HousePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/house3.jpg',
                    ),
                    fit: BoxFit.fill),
              ),
            ),
            Positioned(
              bottom: 300,
              left: 10,
              child: InkWell(
                onTap: (() {
                  Navigator.pop(context);
                }),
                child: const Icon(
                  Icons.navigate_before_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
            const Positioned(
              bottom: 300,
              left: 320,
              child: Icon(
                Icons.bookmark_add_rounded,
                color: Colors.orange,
              ),
            ),
          ]),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 20),
            child: Text(
              'Gyawali Niwas',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              'Butwal-11,Rupendehi',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              '12 dhur ',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  'Rs.15000',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10, left: 5),
                child: Text(
                  'Per Month',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: Row(
              children: [
                const Icon(
                  Icons.bed,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '2 Bedroom',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 40,
                ),
                const Icon(
                  Icons.bathroom,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '1 Bathroom',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '1 Toilet',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 5),
            child: Row(
              children: [
                const Icon(
                  Icons.kitchen,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '2 Kitchen',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '120 sqft',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                const SizedBox(
                  width: 98,
                ),
                const Icon(
                  Icons.garage_rounded,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '2 Parking',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      '180 sqft',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 24, left: 10),
            child: Text(
              'About',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Flexible(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'This House is in buddhanagar near the temple ',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              height: 40,
              width: 340,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.purple),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) {
                    return const HousePage2();
                  })));
                },
                child: const Text(
                  'Book Now',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
