import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Result.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Shared preferences
  setData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (gender != null) sp.setString('Gender', gender!);
    sp.setDouble('Hight', hight);
    sp.setDouble('Weight', weight);
    sp.setInt('Age', age);
  }

  getData() async {
    SharedPreferences sp2 = await SharedPreferences.getInstance();
    setState(() {
      gender = sp2.getString('Gender');
      hight = sp2.getDouble('Hight')!;
      weight = sp2.getDouble('Weight')!;
      age = sp2.getInt('Age')!;
    });
  }

  // Information variables
  String? gender;
  double hight = 150;
  double weight = 60;
  int age = 30;
  double? result;

  // App colors variables
  Color mainColor = Colors.teal;
  Color backGroundColor = const Color.fromRGBO(255, 220, 174, 0.2);
  Color white = const Color.fromRGBO(255, 255, 255, 1);
  Color secondColor = const Color.fromRGBO(206, 216, 158, 1);
  Color maleButtonColor = Colors.teal;
  Color femaleButtonColor = Colors.teal;
  Color selectedButtonColor = const Color.fromRGBO(118, 186, 153, 0.9);

  // Font style
  TextStyle textStyle = const TextStyle(
      color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Expanded(
          child: Container(
            color: backGroundColor,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ******** For gender selecting ********
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(2.00),
                          child: OutlinedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      maleButtonColor)),
                              onPressed: () {
                                setState(() {
                                  gender = 'Male';
                                  maleButtonColor = selectedButtonColor;
                                  femaleButtonColor = mainColor;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/male.png'),
                                  Text(
                                    'Male',
                                    style: textStyle,
                                  ),
                                ],
                              )),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(2),
                          child: OutlinedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      femaleButtonColor)),
                              onPressed: () {
                                setState(() {
                                  gender = 'Female';
                                  femaleButtonColor = selectedButtonColor;
                                  maleButtonColor = mainColor;
                                });
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset('assets/images/female.png'),
                                  Text(
                                    'Female',
                                    style: textStyle,
                                  ),
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                  // ******** For Hight selecting ********
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.all(5),
                        padding: const EdgeInsets.all(2.00),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: mainColor),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Hight',
                              style: textStyle,
                            ),
                            Text(
                              '$hight ',
                              style: TextStyle(
                                  color: white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23),
                            ),
                            Slider(
                              value: hight,
                              onChanged: (double val) =>
                                  setState(() => hight = val),
                              min: 45,
                              max: 250,
                              divisions: 205,
                              inactiveColor: secondColor,
                              activeColor: secondColor,
                            )
                          ],
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ******** For weight selecting ********
                      Expanded(
                        child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(20.00),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: mainColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Weight',
                                  style: textStyle,
                                ),
                                Text(
                                  '$weight',
                                  style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23),
                                ),
                                // ******** Plus & Minuse Sighns********
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        color: mainColor,
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              weight += 1;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: white,
                                          ),
                                        )),
                                    Container(
                                        color: mainColor,
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              weight -= 1;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                            color: white,
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            )),
                      ),

                      // ******** For age selecting ********
                      Expanded(
                        child: Container(
                            margin: const EdgeInsets.all(5),
                            padding: const EdgeInsets.all(20.00),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: mainColor),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Age',
                                  style: textStyle,
                                ),
                                Text(
                                  '$age',
                                  style: TextStyle(
                                      color: white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23),
                                ),
                                // ******** Plus & Minuse Sighns********
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        //height: 2.0,
                                        //width: 2.0,
                                        color: mainColor,
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              age += 1;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.add,
                                            color: white,
                                          ),
                                        )),
                                    Container(
                                        //height: 2.0,
                                        //width: 2.0,
                                        color: mainColor,
                                        child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              age -= 1;
                                            });
                                          },
                                          icon: Icon(
                                            Icons.remove,
                                            color: white,
                                          ),
                                        )),
                                  ],
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  // ******** Calculate button ********
                  Builder(builder: (ctx) {
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(top: 5),
                            color: mainColor,
                            child: TextButton(
                              child: Text(
                                'Calculate',
                                style: textStyle,
                              ),
                              onPressed: () {
                                setState(() {
                                  result = (weight / (hight * hight)) * 10000;
                                  if (gender != null) {
                                    Navigator.of(ctx).push(MaterialPageRoute(
                                        builder: (_) => Result(
                                              gender: gender!,
                                              hight: hight,
                                              weight: weight,
                                              age: age,
                                              result: result!,
                                            )));
                                    setData();
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    );
                  })
                ]),
          ),
        ),
      ),
    );
  }
}
