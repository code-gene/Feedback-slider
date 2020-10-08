import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demoji/demoji.dart';

void main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Feedback',

    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double ratings = 1.0;
  String emoji = Demoji.neutral_face;
  String emojiLabel = 'COULD BE BETTER';

  void ratingsUpdate() {
    setState(() {
      switch (ratings.round()) {
        case 0: {
          ratings = 1.0;
          emoji = Demoji.neutral_face;
          emojiLabel = 'COULD BE BETTER';
          break;
        }

        case 1:
          {
            ratings = 1.0;
            emoji = Demoji.neutral_face;
            emojiLabel = 'COULD BE BETTER';
            break;
          }

        case 2:
          {
            ratings = 2.0;
            emoji = Demoji.sweat_smile;
            emojiLabel = 'AVERAGE';
            break;
          }

        case 3:
          {
            ratings = 3.0;
            emoji = Demoji.smiley;
            emojiLabel = 'GOOD';
            break;
          }

        case 4:
          {
            ratings = 4.0;
            emoji = Demoji.star_struck;
            emojiLabel = 'EXCELLENT';
            break;
          }

        case 5:
          {
            ratings = 5.0;
            emoji = Demoji.heart_eyes;
            emojiLabel = 'OUTSTANDING';
            break;
          }
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],

      appBar: AppBar(
        elevation: 0.0,
        title: Text(
            'Feedback'
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.star),
          )
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            SizedBox(
              height: 70,
            ),

            Text(
              'How do you rate our service ?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(
              height: 30,
            ),

            Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(20),
              shadowColor: Colors.blueGrey[50],
              color: Colors.white,

              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: 450,

                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(30.0),

                      child: Text(
                        emojiLabel,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    Container(
                        height: 100,
                        width: 100,
                        child: Text(
                          emoji,
                          style: TextStyle(
                            fontSize: 90,
                          ),
                        )
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Slider(
                        value: ratings,
                        onChanged: (newTip) {
                          ratings = newTip;
                          ratingsUpdate();
                        },
                        min: 0,
                        max: 5,
                        activeColor: Colors.blue,
                        inactiveColor: Colors.blue[100],
                        divisions: 5,
                      ),
                    ),

                    Text(
                      'Your Ratings : $ratings',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(
                      height: 50,
                    ),

                    RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                      onPressed: () {},
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
