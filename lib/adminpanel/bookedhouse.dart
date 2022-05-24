import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookedPage extends StatefulWidget {
  const BookedPage({Key? key}) : super(key: key);

  @override
  State<BookedPage> createState() => _BookedPageState();
}

class _BookedPageState extends State<BookedPage> {
  String? housename;

  String? location;
  String? price;
  String? customernumber;

  String customername = '';
  String? houseimage;
  bool isbook = false;
  userdataread() async {
    final prefs = await SharedPreferences.getInstance();
    final String? hname = prefs.getString('housename');
    final String? loc = prefs.getString('location');
    final String? pric = prefs.getString('price');
    final String? cusnum = prefs.getString('customernumber');
    final String? cusnam = prefs.getString('customername');
    final String? himage = prefs.getString('houseimage');
    final bool? isbooked = prefs.getBool('isbooked');

    setState(() {
      housename = hname.toString();
      location = loc.toString();
      price = pric.toString();
      customernumber = cusnum.toString();
      customername = cusnam.toString();
      houseimage = himage.toString();
      isbook = isbooked!;
    });
    print(customernumber);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userdataread();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booked House"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            isbook == true
                ? Card(
                    color: const Color.fromARGB(255, 247, 239, 239),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                height: 160,
                                width: 140,
                                child: Image.network(
                                  houseimage.toString(),
                                  errorBuilder: (context, error, stackTrace) {
                                    return const Icon(Icons.home);
                                  },
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                housename.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Address : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    location.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Price : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    price.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Customer Name : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    customername.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  const Text(
                                    "Customer\n Number ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    " : " + customernumber.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
