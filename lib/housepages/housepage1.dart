import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HousePage extends StatefulWidget {
  String? id;
  String? houseimage;
  String? housename;
  String? location;
  String? bedroomno;
  String? bathroomno;
  String? price;
  String? customernumber;
  String? customername;
  String? description;

  HousePage(
      {Key? key,
      this.id,
      this.houseimage,
      this.housename,
      this.location,
      this.bedroomno,
      this.bathroomno,
      this.price,
      this.customernumber,
      this.customername,
      this.description})
      : super(key: key);

  @override
  State<HousePage> createState() => _HousePageState();
}

class _HousePageState extends State<HousePage> {
  bool isbooked = false;
  Future readData() async {
    print(widget.customernumber);
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isbooked', true);
    prefs.setString('housename', widget.housename.toString());
    prefs.setString('location', widget.location.toString());
    prefs.setString('price', widget.price.toString());
    prefs.setString('customernumber', widget.customernumber.toString());
    prefs.setString('customername', widget.customername.toString());
    prefs.setString('houseimage', widget.houseimage.toString());
  }

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
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      widget.houseimage.toString(),
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
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 20),
            child: Text(
              widget.housename.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: Text(
              widget.location.toString(),
              style: const TextStyle(color: Colors.grey),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Text(
                  "Rs." + widget.price.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
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
                  children: [
                    Text(
                      widget.bedroomno.toString() + ' Bedroom',
                      style: const TextStyle(color: Colors.grey),
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
                  children: [
                    Text(
                      widget.bathroomno.toString() + ' Bathroom',
                      style: const TextStyle(color: Colors.grey),
                    ),
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
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                widget.description.toString(),
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          isbooked == false
              ? Center(
                  child: SizedBox(
                    height: 40,
                    width: 340,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.purple),
                      onPressed: () {
                        setState(() {
                          isbooked = true;
                          readData();
                        });
                        Navigator.pop(context);
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
              : const SizedBox()
        ],
      ),
    );
  }
}
