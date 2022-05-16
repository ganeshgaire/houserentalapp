import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddHouse extends StatefulWidget {
  const AddHouse({Key? key}) : super(key: key);

  @override
  State<AddHouse> createState() => _AddHouseState();
}

class _AddHouseState extends State<AddHouse> {
  TimeOfDay selectedtime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  final timeformat = DateFormat('hh:mm');
  var myFormat = DateFormat('yyyy-MM-d');
  String text1 = '';
  String text2 = '';

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  dateTimePicker() async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate,
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });

      print(selectedDate);
    }
  }

  timePicker() async {
    final TimeOfDay? picked =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (picked != null && picked != selectedtime) {
      setState(() {
        selectedtime = picked;
      });
    }
  }

  formatTime(context, selectedtime) {
    final localizations = MaterialLocalizations.of(context);
    final formattedTimeOfDay = localizations.formatTimeOfDay(selectedtime);

    return formattedTimeOfDay.toString();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.2,
              width: width * 0.6,
              color: Colors.amber,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 20,
                    width: 100,
                    color: Colors.blue,
                    child: Text(text1),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 100,
                    height: 20,
                    color: Colors.blue,
                    child: Text(text2),
                  ),
                ],
              ),
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 225, 216, 216),
              ),
              child: TextField(
                controller: email,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    border: InputBorder.none,
                    hintText: 'Email'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromARGB(255, 225, 216, 216),
              ),
              child: TextField(
                controller: password,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: InputBorder.none,
                    hintText: 'Password'),
              ),
            ),
            ElevatedButton(
              autofocus: true,
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  maximumSize: Size(width * 0.6, 40),
                  minimumSize: Size(width * 0.6, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
              onPressed: () {
                setState(() {
                  text1 = email.text;
                  text2 = password.text;
                });
              },
              child: const Text(
                'Log in ',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            TextField(
              keyboardType: TextInputType.none,
              onTap: dateTimePicker,
              decoration:
                  InputDecoration(hintText: (myFormat.format(selectedDate))),
            ),
            TextField(
                keyboardType: TextInputType.none,
                onTap: timePicker,
                decoration: InputDecoration(
                  hintText: formatTime(context, selectedtime),
                )),
          ],
        ),
      ),
    );
  }
}
