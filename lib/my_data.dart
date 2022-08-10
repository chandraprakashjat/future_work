import 'package:flutter/material.dart';

class MyDataWidget extends StatelessWidget {
  const MyDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Builder'),
      ),
      body: FutureBuilder(
          future: _getUserDetails(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              if (snapshot.hasData) {
                return Center(
                  child: Text('Data Value ${snapshot.data}'),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }
          }),
    );
  }

  _getUserDetails() {
    return Future.delayed(const Duration(seconds: 10), () => 25);
  }
}
