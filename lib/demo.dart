import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: futureError,
        child: const Icon(Icons.add),
      ),
    );
  }

  void perform() async {
    var value =
        _fetchId(12).then((id) => _getUserName(id)).then((name) => print(name));

    print('Cascase Async calling');
  }

  _fetchId(int i) {
    return Future.delayed(const Duration(seconds: 2), () => 1001);
  }

  _getUserName(int id) {
    return Future.delayed(const Duration(seconds: 4), () => 'Prakash');
  }

  void futureError() {
    var list = List.unmodifiable([1, 2]);
    Future.delayed(const Duration(seconds: 5), () {
      list.add(12);
      return 'Prakash';
    })
        .then((value) => print('on Value $value'))
        .catchError((error) {
          print('Catch Error');
          throw error;
        }, test: (error) => error.runtimeType == UnsupportedError)
        .whenComplete(() => print('completed successfully'))
        .onError((error, stackTrace) => print('on Error $error'));
  }
}
