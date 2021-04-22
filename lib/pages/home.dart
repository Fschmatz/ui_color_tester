import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'configs/configs.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();

  Home({Key key}) : super(key: key);
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  //------------- HOME
  TextEditingController customControllerAppBackgroundColor =
      TextEditingController();
  TextEditingController customControllerAppTopBarColor =
      TextEditingController();
  TextEditingController customControllerAppBottomBarColor =
      TextEditingController();
  TextEditingController customControllerAccentColor = TextEditingController();
  Color backgroundColor;
  Color appTopBarColor;
  Color bottomBarColor;
  Color accentColor = Colors.tealAccent[700];

  void changeAccentColor(String colorCode) {
    try {
      setState(() {
        accentColor = Color(int.parse('0xFF' + colorCode));
      });
    } catch (exception) {
      Fluttertoast.showToast(
        msg: "Invalid Value",
      );
    }
  }

  void changeBackgroundColor(String colorCode) {
    try {
      setState(() {
        backgroundColor = Color(int.parse('0xFF' + colorCode));
      });
    } catch (exception) {
      Fluttertoast.showToast(
        msg: "Invalid Value",
      );
    }
  }

  void changeAppTopBarColor(String colorCode) {
    try {
      setState(() {
        appTopBarColor = Color(int.parse('0xFF' + colorCode));
      });
    } catch (exception) {
      Fluttertoast.showToast(
        msg: "Invalid Value",
      );
    }
  }

  void changeAppBottomBarColor(String colorCode) {
    try {
      setState(() {
        bottomBarColor = Color(int.parse('0xFF' + colorCode));
      });
    } catch (exception) {
      Fluttertoast.showToast(
          msg: "Invalid Value",
      );
    }
  }

  //------------- CARD
  TextEditingController customControllerCardColor = TextEditingController();
  TextEditingController customControllerCardBorderWidth =
      TextEditingController();
  TextEditingController customControllerCardElevation = TextEditingController();
  TextEditingController customControllerCardBorderRadius =
      TextEditingController();
  TextEditingController customControllerCardBorderOpacity =
      TextEditingController();
  TextEditingController customControllerFontSize = TextEditingController();

  Color cardColor;
  double cardBorderWidth = 1;
  double cardBorderRadius = 10;
  double cardElevation = 2.0;
  double cardTitleFontSize = 17;
  double cardSubtitleFontSize = 14.5;
  double cardBorderOpacity = 0.5;
  int cardBorderColor = 700;

  bool isSelectedGrey600 = false;
  bool isSelectedGrey700 = false;
  bool isSelectedGrey800 = false;
  bool isSelectedGrey900 = false;

  void changeCardColor(String colorCode) {
    try {
      setState(() {
        cardColor = Color(int.parse('0xFF' + colorCode));
      });
    } catch (exception) {
      Fluttertoast.showToast(
        msg: "Invalid Value",
      );
    }
  }

  void changeBorderColor(int colorCode) {
    setState(() {
      cardBorderColor = colorCode;
    });
  }

  void changeCardBorderWidth(double value) {
    setState(() {
      cardBorderWidth = value;
    });
  }

  void changeCardElevation(double value) {
    setState(() {
      cardElevation = value;
    });
  }

  void changeCardBorderRadius(double value) {
    setState(() {
      cardBorderRadius = value;
    });
  }

  void changeCardBorderOpacity(double value) {
      if(value <= 1){
        setState(() {
          cardBorderOpacity = value;
        });
      } else {
        Fluttertoast.showToast(
          msg: "Invalid Value\nMust Be <= 1",
        );
      }
  }

  void changeFontSize(double value) {
    setState(() {
      cardTitleFontSize = value;
      cardSubtitleFontSize = value - 2.5;
    });
  }

  void populateWithDefaults(bool useSetState) {
    //CARD
    customControllerCardColor.text = '282828';
    customControllerCardBorderWidth.text = cardBorderWidth.toString();
    customControllerCardElevation.text = cardElevation.toString();
    customControllerCardBorderRadius.text = cardBorderRadius.toString();
    customControllerCardBorderOpacity.text = cardBorderOpacity.toString();
    customControllerFontSize.text = cardTitleFontSize.toString();

    //APP
    customControllerAppBackgroundColor.text = '202020';
    customControllerAppTopBarColor.text = '202020';
    customControllerAppBottomBarColor.text = '181818';
    customControllerAccentColor.text = '00BFA5';
    isSelectedGrey600 = false;
    isSelectedGrey700 = true;
    isSelectedGrey800 = false;
    isSelectedGrey900 = false;

    if (useSetState) {
      //restore defaults
      changeCardColor('282828');
      changeCardBorderWidth(1.0);
      changeCardElevation(2.0);
      changeCardBorderRadius(10.0);
      changeCardBorderOpacity(0.5);
      changeFontSize(17.0);
      changeBorderColor(700);

      changeAccentColor('00BFA5');
      changeBackgroundColor('202020');
      changeAppTopBarColor('202020');
      changeAppBottomBarColor('181818');
    }
  }

  @override
  void initState() {
    super.initState();
    populateWithDefaults(false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appTopBarColor,
        title: Text("UI + Color Tester"),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: IconButton(
              icon: Icon(Icons.restore_outlined),
              tooltip: 'Reset to Defaults',
              color: Theme.of(context).hintColor,
              onPressed: () {
                populateWithDefaults(true);
              },
            ),
          ),
        ],
      ),
      body: ListView( children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 15),
          child: Card(
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cardBorderRadius),
              side: BorderSide(
                color: Colors.grey[cardBorderColor]
                    .withOpacity(cardBorderOpacity),
                width: cardBorderWidth,
              ),
            ),
            elevation: cardElevation,
            child: InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(cardBorderRadius),
              ),
              onTap: () {},
              child: Container(
                height: 110,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: accentColor,
                      radius: 22,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 32,
                        ),
                        Text("Ha! Ha! Ha! What A Story Mark!",
                            style: TextStyle(fontSize: cardTitleFontSize)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "You're Tearing Me Apart, Lisa!",
                          style: TextStyle(
                              fontSize: cardSubtitleFontSize,
                              color: Theme.of(context).hintColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 15, 20),
          child: Row(
            children: [
              const Text(
                "Card Options",
                style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: Divider(
                  indent: 15,
                  thickness: 2,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(children: [
            Expanded(
                child: Text(
              "Background\nDef: 252525",
              style: TextStyle(
                  fontSize: 12.5, color: Theme.of(context).hintColor),
            )),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: txtFieldFuncString(
                  customControllerCardColor, changeCardColor),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Text(
              "Elevation\nDef: 2.0",
              style: TextStyle(
                  fontSize: 12.5, color: Theme.of(context).hintColor),
            )),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: txtFieldFuncDouble(
                  customControllerCardElevation, changeCardElevation),
            ),
          ]),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(children: [
            Expanded(
                child: Text(
              "Border Width   \nDef: 1.0",
              style: TextStyle(
                  fontSize: 12.5, color: Theme.of(context).hintColor),
            )),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: txtFieldFuncDouble(
                  customControllerCardBorderWidth, changeCardBorderWidth),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: Text(
              "Border Rad.\nDef: 10.0",
              style: TextStyle(
                  fontSize: 12.5, color: Theme.of(context).hintColor),
            )),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: txtFieldFuncDouble(
                  customControllerCardBorderRadius, changeCardBorderRadius),
            ),
          ]),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                "Border Opac.\nDef: 0.5\n<= 1",
                style: TextStyle(
                    fontSize: 12.5, color: Theme.of(context).hintColor),
              )),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: txtFieldFuncDouble(customControllerCardBorderOpacity,
                    changeCardBorderOpacity),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Text(
                "Font Size\nDef: Title 17\nSub 14.5",
                style: TextStyle(
                    fontSize: 12.5, color: Theme.of(context).hintColor),
              )),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: txtFieldFuncDouble(
                    customControllerFontSize, changeFontSize),
              ),
            ],
          ),
        ),

        const SizedBox(
          height: 15,
        ),
        //Border COLOR BUTTONS
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 8, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: Row(
                children: [
                  Text(
                    "Border Color\nDef: Grey[700]",
                    style: TextStyle(
                        fontSize: 12.5, color: Theme.of(context).hintColor),
                  )
                ],
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      MaterialButton(
                        minWidth: 20,
                        height: 35,
                        child: isSelectedGrey600
                            ? Icon(
                                Icons.check,
                                color: Colors.white70,
                              )
                            : SizedBox.shrink(),
                        shape: CircleBorder(
                            side: BorderSide(
                                width: 2,
                                color: Colors.white.withOpacity(0.3),
                                style: BorderStyle.solid)),
                        elevation: 2,
                        color: Colors.grey[600],
                        onPressed: () {
                          setState(() {
                            isSelectedGrey600 = true;
                            isSelectedGrey700 = false;
                            isSelectedGrey800 = false;
                            isSelectedGrey900 = false;
                          });
                          changeBorderColor(600);
                        },
                      ),
                      Text(
                        "600",
                        style: TextStyle(
                            fontSize: 12.5,
                            color: Theme.of(context).hintColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      MaterialButton(
                        minWidth: 20,
                        height: 35,
                        child: isSelectedGrey700
                            ? Icon(
                                Icons.check,
                                color: Colors.white70,
                              )
                            : SizedBox.shrink(),
                        shape: CircleBorder(
                            side: BorderSide(
                                width: 2,
                                color: Colors.white.withOpacity(0.3),
                                style: BorderStyle.solid)),
                        elevation: 2,
                        color: Colors.grey[700],
                        onPressed: () {
                          setState(() {
                            isSelectedGrey600 = false;
                            isSelectedGrey700 = true;
                            isSelectedGrey800 = false;
                            isSelectedGrey900 = false;
                          });
                          changeBorderColor(700);
                        },
                      ),
                      Text(
                        "700",
                        style: TextStyle(
                            fontSize: 12.5,
                            color: Theme.of(context).hintColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      MaterialButton(
                        minWidth: 20,
                        height: 35,
                        child: isSelectedGrey800
                            ? Icon(
                                Icons.check,
                                color: Colors.white70,
                              )
                            : SizedBox.shrink(),
                        shape: CircleBorder(
                            side: BorderSide(
                                width: 2,
                                color: Colors.white.withOpacity(0.3),
                                style: BorderStyle.solid)),
                        elevation: 2,
                        color: Colors.grey[800],
                        onPressed: () {
                          setState(() {
                            isSelectedGrey600 = false;
                            isSelectedGrey700 = false;
                            isSelectedGrey800 = true;
                            isSelectedGrey900 = false;
                          });
                          changeBorderColor(800);
                        },
                      ),
                      Text(
                        "800",
                        style: TextStyle(
                            fontSize: 12.5,
                            color: Theme.of(context).hintColor),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      MaterialButton(
                        minWidth: 20,
                        height: 35,
                        child: isSelectedGrey900
                            ? Icon(
                                Icons.check,
                                color: Colors.white70,
                              )
                            : SizedBox.shrink(),
                        shape: CircleBorder(
                            side: BorderSide(
                                width: 2,
                                color: Colors.white.withOpacity(0.3),
                                style: BorderStyle.solid)),
                        elevation: 2,
                        color: Colors.grey[900],
                        onPressed: () {
                          setState(() {
                            isSelectedGrey600 = false;
                            isSelectedGrey700 = false;
                            isSelectedGrey800 = false;
                            isSelectedGrey900 = true;
                          });
                          changeBorderColor(900);
                        },
                      ),
                      Text(
                        "900",
                        style: TextStyle(
                            fontSize: 12.5,
                            color: Theme.of(context).hintColor),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
          child: Row(
            children: [
              const Text(
                "App Color Options",
                style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: Divider(
                  indent: 15,
                  thickness: 2,
                  height: 1,
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                "Background\nDef: 202020",
                style: TextStyle(
                    fontSize: 12.5, color: Theme.of(context).hintColor),
              )),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: txtFieldFuncString(customControllerAppBackgroundColor,
                    changeBackgroundColor),
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: Text(
                "TopBar\nDef: 202020",
                style: TextStyle(
                    fontSize: 12.5, color: Theme.of(context).hintColor),
              )),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: txtFieldFuncString(
                    customControllerAppTopBarColor, changeAppTopBarColor),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                "BottomBar\nDef: 181818",
                style: TextStyle(
                    fontSize: 12.5, color: Theme.of(context).hintColor),
              )),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: txtFieldFuncString(customControllerAppBottomBarColor,
                    changeAppBottomBarColor),
              ),
              const SizedBox(width: 20),
              Expanded(
                  child: Text(
                "Accent \nDef: 00BFA5",
                style: TextStyle(
                    fontSize: 12.5, color: Theme.of(context).hintColor),
              )),
              const SizedBox(
                width: 20,
              ),
              Flexible(
                child: txtFieldFuncString(
                    customControllerAccentColor, changeAccentColor),
              ),
            ],
          ),
        ),
        const SizedBox(
          height:20,
        )
      ]),

      //BOTTOMBAR
      bottomNavigationBar: BottomAppBar(
          color: bottomBarColor,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                    splashRadius: 30,
                    icon: Icon(
                      Icons.settings_outlined,
                      size: 24,
                      color: Theme.of(context).hintColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => Configs(),
                            fullscreenDialog: true,
                          ));
                    }),
              ],
            ),
          )),
    );
  }

  Widget txtFieldFuncString(
      TextEditingController controller, Function onSubmitFunc) {
    return TextField(
      textAlign: TextAlign.center,
      maxLength: 6,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      controller: controller,
      onSubmitted: (String s) => onSubmitFunc(s.toString()),
      decoration: InputDecoration(
          counterText: "",
          contentPadding:
              new EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: accentColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[700].withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(10.0)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[700].withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(10.0))),
      style: TextStyle(
        fontSize: 17,
      ),
    );
  }

  Widget txtFieldFuncDouble(
      TextEditingController controller, Function onSubmitFunc) {
    return TextField(
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(// only point
            RegExp(r'^(\d+)?\.?\d{0,2}'))
      ],
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      maxLength: 4,
      textAlign: TextAlign.center,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      controller: controller,
      onSubmitted: (String s) => onSubmitFunc(double.parse(s)),
      decoration: InputDecoration(
          counterText: "",
          contentPadding:
              new EdgeInsets.symmetric(vertical: 0.0, horizontal: 5.0),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: accentColor,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[700].withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(10.0)),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[700].withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(10.0))),
      style: TextStyle(
        fontSize: 17,
      ),
    );
  }
}