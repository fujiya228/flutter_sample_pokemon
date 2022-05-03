import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  const Help({Key? key, required this.helpMessage}) : super(key: key);

  final String helpMessage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      alignment: Alignment.topRight,
      child: IconButton(
        padding: const EdgeInsets.all(0),
        icon: const Icon(Icons.help_outline_outlined),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            builder: (BuildContext context) {
              return Container(
                height: 300,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 5,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).backgroundColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 24,
                        ),
                        child: Text(
                          helpMessage,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                        ),
                        child: const Text('閉じる'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
