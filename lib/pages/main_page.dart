import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _controller = TextEditingController();

  void changeText(String text) {
    var updatedText = _controller.text;
    List<String> textAsList = _controller.text.split('');
    final index = textAsList.length - 1;

    if (Random().nextBool()) {
      textAsList[index] = textAsList[index].toUpperCase();
      updatedText = textAsList.join('');
    }
    _controller.value = _controller.value.copyWith(
      text: updatedText,
      selection: TextSelection.collapsed(offset: updatedText.length),
    );
  }

  String _randomizeUppercaseTitle(String title) {
    List<String> titleAsList = title.split('');
    return titleAsList
        .map((e) => Random().nextBool() ? e.toUpperCase() : e)
        .join('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_randomizeUppercaseTitle("Angry text app")),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Lottie.network(
                        'https://assets9.lottiefiles.com/packages/lf20_syxn7sbq.json'),
                  ),
                  SizedBox(
                    width: 100,
                    height: 30,
                    child: Lottie.network(
                        'https://assets9.lottiefiles.com/packages/lf20_CZ5mts.json'),
                  ),
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: Lottie.network(
                        'https://assets8.lottiefiles.com/packages/lf20_hBdwKJ.json'),
                  ),
                  SizedBox(
                    width: 30,
                    height: 30,
                    child: Lottie.network(
                        'https://assets8.lottiefiles.com/packages/lf20_syxn7sbq.json'),
                  )
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              TextField(
                  controller: _controller,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  onChanged: changeText,
                  decoration: InputDecoration(
                    hintText: 'Express your self 😉',
                    suffixIcon: IconButton(
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: _controller.text))
                            .then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Copied to your clipboard !')));
                        });
                      },
                      icon: const Icon(Icons.copy),
                    ),
                  )),
            ],
          ),
        )));
  }
}
