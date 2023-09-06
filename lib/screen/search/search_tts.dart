import 'package:flutter/material.dart';

class SearchTTS extends StatelessWidget {
  const SearchTTS({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
              children: [
                Text("tts 기술조사"),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pop(context);
                }, child: Text("pop"))
              ],
            )
        )
    );
  }
}
