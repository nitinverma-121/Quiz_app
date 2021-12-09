import 'package:flutter/material.dart';
import 'package:quiz_app/Questions..dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List questionbank = [
    Questionset(
        "In the second half of the 19th century, the U.S. Southwest and the Mexican North were divided both by politics and by nature.",
        false),
    Questionset(
        "By the 1890s, the majority of Arizona copper was controlled by the powerful Phelps Dodge Company.",
        true),
    Questionset(
        "The western surveys conducted between 1867 and 1879 established the foundational knowledge for the organized settlement of the West.",
        true),
    Questionset(
        "What set the graveyard of Ely, Nevada, apart from others in the West was its ethnic and racial integration.",
        false),
    Questionset(
        "The laboratory for an expanding global cattle industry throughout the 1800s was the Pacific Northwest.",
        false),
    Questionset(
        "The most important factor in the decline of the western buffalo herds was cattle ranching.",
        false),
    Questionset(
        "The Office of Indian Affairs grew concerned with the Ghost Dancers when their numbers reached frightening proportions.",
        false),
    Questionset(
        "Gifford Pinchot learned the techniques of scientific history in France and Germany.",
        true),
    Questionset(
        "The claim that individual hunters like Buffalo Bill killed as many as 1,000 buffalos a day was often exaggerated.",
        true),
    Questionset(
        "It was a coalition of Christian leaders who successfully urged President Grant to pursue a peace policy with Native American tribes in the West.",
        true),
  ];

  int _index = 0;
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade400,
        centerTitle: true,
        title: Text(
          "True Citizen",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.blueGrey.shade200),
        child: Column(
          children: [
            Image(image: AssetImage('images/flag.png')),
            Container(
              width: 320,
              height: 100,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              alignment: Alignment.center,
              child:
                  (questionbank.length == _index) //QUIZ ENDED SHOW THE SCORES
                      ? ListTile(
                          tileColor: Colors.green[50],
                          title: Text(
                            "SCORE- $_score",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          subtitle: InkWell(
                            child: Container(
                              height: 30,
                              width: 20,
                              child: Text(
                                "Play again",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                _index = 0;
                                _score = 0;
                              });
                            },
                          ),
                        )
                      : Text(
                          " ${_index + 1}).  ${questionbank[_index % questionbank.length].question}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, letterSpacing: 1),
                        ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                    child: Container(
                        decoration: BoxDecoration(color: Colors.black),
                        alignment: Alignment.center,
                        height: 20,
                        width: 60,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (_index == 0) {
                                _index = questionbank.length;
                              } else {
                                _index--;
                              }
                            });
                          },
                          child: Icon(
                            Icons.forward,
                            textDirection: TextDirection.rtl,
                            color: Colors.white,
                          ),
                        ))),

                //TRUE BUTTION
                InkWell(
                    onTap: () {
                      if (questionbank[_index].iscorrect == true) {
                        //print("Correct answer");

                        final mysnackBar = SnackBar(
                          content: Text("CORRECT ANSWER"),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 1),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(mysnackBar);
                        setState(() {
                          _index++;
                          _score++;
                        });
                      } else {
                        //print("Wrong answer");
                        final mysnackBar = SnackBar(
                          content: Text("WRONG ANSWER"),
                          backgroundColor: Colors.redAccent,
                          duration: Duration(seconds: 1),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(mysnackBar);
                        setState(() {
                          _index++;
                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(color: Colors.black),
                      alignment: Alignment.center,
                      height: 20,
                      width: 60,
                      child: Text(
                        "TRUE",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                InkWell(
                    onTap: () {
                      if (questionbank[_index].iscorrect == false) {
                        //print("Correct answer");
                        final mysnackBar = SnackBar(
                          content: Text("CORRECT ANSWER"),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 1),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(mysnackBar);
                        setState(() {
                          _index++;
                          _score++;
                        });
                      } else {
                        //print("Wrong answer");
                        final mysnackBar = SnackBar(
                          content: Text("WRONG ANSWER"),
                          backgroundColor: Colors.redAccent,
                          duration: Duration(seconds: 1),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(mysnackBar);
                        setState(() {
                          _index++;
                        });
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 20,
                      width: 60,
                      decoration: BoxDecoration(color: Colors.black),
                      child: Text(
                        "FALSE",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                InkWell(
                    child: Container(
                        decoration: BoxDecoration(color: Colors.black),
                        alignment: Alignment.center,
                        height: 20,
                        width: 60,
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              if (_index == questionbank.length) {
                                _index = 0;
                              } else {
                                _index++;
                              }
                            });
                          },
                          child: Icon(
                            Icons.forward,
                            color: Colors.white,
                          ),
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade400,
          centerTitle: true,
          title: Text(
            "True Citizen",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          color: Colors.blueGrey,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 50,
              ),
              Card(
                color: Colors.transparent,
                elevation: 20,
                shadowColor: Colors.pink,
                child: Text(
                  "A 10 QUESTION US QUIZ APP",
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Image(
                    image: NetworkImage(
                        "https://images.unsplash.com/photo-1592976532851-b8a1f377ec05?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80")),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (buildContext) => Home()));
                },
                child: Container(
                  decoration: BoxDecoration(color: Colors.black),
                  child: Text(
                    "CLICK TO CONTINUE",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
