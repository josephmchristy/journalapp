import 'package:flutter/material.dart';

class WelcomeScreenWidget extends StatelessWidget {
  const WelcomeScreenWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: const [
                IconTheme(
                  data: const IconThemeData(color: Colors.white),
                  child: Icon(
                    Icons.library_books_outlined,
                    size: 120,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Tap the button below to begin journaling.',
                      style: TextStyle(
                        fontSize: 15,
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
          
        ]
      )
    );
  }
}