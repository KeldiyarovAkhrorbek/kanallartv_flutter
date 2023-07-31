import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    checkUserConnection(context);
    super.didChangeDependencies();
  }

  Future<void> checkUserConnection(BuildContext context) async {
    try {
      final response = await http.get(Uri.parse('https://api.country.is/'));
      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body) as Map<String, dynamic>;
        if (responseBody['country'] == 'UZ') {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/channels-screen', (Route<dynamic> route) => false);
        } else {
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/calculator', (Route<dynamic> route) => false);
        }
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/calculator', (Route<dynamic> route) => false);
      }
    } catch (e) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/calculator', (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
