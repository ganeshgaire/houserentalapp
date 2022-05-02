import 'package:flutter/material.dart';

class OwnSearchPage extends StatefulWidget {
  const OwnSearchPage({Key? key}) : super(key: key);

  @override
  State<OwnSearchPage> createState() => _OwnSearchPageState();
}

class _OwnSearchPageState extends State<OwnSearchPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(179, 214, 208, 208),
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
                height: 20,
              ),
              const Text(
                'Recent Searches',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Moon House',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'The Royal House',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'The Royal House',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
