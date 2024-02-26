import 'package:flutter/material.dart';
import 'package:weather_api/util/constants.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 25.0,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: kTextFieldInputDecoration,
                  onChanged: (value) {
                    cityName = value;
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, cityName);
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.onPrimary)),
                child: const Text(
                  'Get Weather',
                  style: kLabelTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
