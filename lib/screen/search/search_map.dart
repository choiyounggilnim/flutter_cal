import 'package:flutter/material.dart';

class SearchMap extends StatelessWidget {
  const SearchMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
              children: [
                Text("map 기술조사"),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pop(context);
                }, child: Text("pop"))
              ],
            )
        )
    );
  }
}
