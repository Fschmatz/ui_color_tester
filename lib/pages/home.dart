import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'configs/configs.dart';

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
  Color accentColor = Colors.tealAccent;

  void changeAccentColor(String colorCode) {
    setState(() {
      accentColor = Color(int.parse('0xFF' + colorCode));
    });
  }

  void changeBackgroundColor(String colorCode) {
    setState(() {
      backgroundColor = Color(int.parse('0xFF' + colorCode));
    });
  }

  void changeAppTopBarColor(String colorCode) {
    setState(() {
      appTopBarColor = Color(int.parse('0xFF' + colorCode));
    });
  }

  void changeAppBottomBarColor(String colorCode) {
    setState(() {
      bottomBarColor = Color(int.parse('0xFF' + colorCode));
    });
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
  double cardElevation = 0;
  double cardTitleFontSize = 17;
  double cardSubtitleFontSize = 14.5;
  double cardBorderOpacity = 0.5;

  void changeCardColor(String colorCode) {
    setState(() {
      cardColor = Color(int.parse('0xFF' + colorCode));
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
    setState(() {
      cardBorderOpacity = value;
    });
  }

  void changeFontSize(double value) {
    setState(() {
      cardTitleFontSize = value;
      cardSubtitleFontSize = value - 2.5;
    });
  }

  void populateWithDefaults(bool useSetState) {
    //CARD
    customControllerCardColor.text = '202020';
    customControllerCardBorderWidth.text = cardBorderWidth.toString();
    customControllerCardElevation.text = cardElevation.toString();
    customControllerCardBorderRadius.text = cardBorderRadius.toString();
    customControllerCardBorderOpacity.text = cardBorderOpacity.toString();
    customControllerFontSize.text = cardTitleFontSize.toString();

    //APP
    customControllerAppBackgroundColor.text = '202020';
    customControllerAppTopBarColor.text = '202020';
    customControllerAppBottomBarColor.text = '181818';
    customControllerAccentColor.text = '64FFDA';

    if(useSetState){
      //restore defaults
      changeCardColor('202020');
      changeCardBorderWidth(1.0);
      changeCardElevation(0.0);
      changeCardBorderRadius(10.0);
      changeCardBorderOpacity(0.5);
      changeFontSize(17.0);

      changeAccentColor('64FFDA') ;
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
      body: Column(mainAxisSize: MainAxisSize.max, children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 25),
          child: Card(
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(cardBorderRadius),
              side: BorderSide(
                color: Colors.grey[600].withOpacity(cardBorderOpacity),
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
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      backgroundColor: accentColor,
                      radius: 21,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Text("Ha! Ha! What A Story Mark!",
                            style: TextStyle(fontSize: cardTitleFontSize)),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "You're tearing me apart, Lisa!",
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
        Divider(
          thickness: 2,
          height: 1,
          color: Colors.black,
        ),
        Expanded(
          child: ListView(
            children: [
              const SizedBox(height: 25),
              Center(
                  child: const Text(
                "Card Options",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Row(children: [
                  Flexible(
                    child: TextField(
                      maxLength: 6,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      controller: customControllerCardColor,
                      onSubmitted: (String s) => changeCardColor(s.toString()),
                      decoration: InputDecoration(
                          isDense: true,
                          helperText: "Color\nDef: 202020",
                          prefixIcon: Icon(Icons.edit_outlined, size: 20),
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10.0)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10.0))),
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(// only point
                            RegExp(r'^(\d+)?\.?\d{0,2}'))
                      ],
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: true),
                      maxLength: 4,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      controller: customControllerCardElevation,
                      onSubmitted: (String s) =>
                          changeCardElevation(double.parse(s)),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.edit_outlined, size: 20),
                          helperText: "Elevation\nDef: 0.0",
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 10.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10.0)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10.0))),
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Row(children: [
                  Expanded(
                    child: TextField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(// only point
                            RegExp(r'^(\d+)?\.?\d{0,2}'))
                      ],
                      keyboardType:
                      TextInputType.numberWithOptions(decimal: true),
                      maxLength: 4,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      controller: customControllerCardBorderWidth,
                      onSubmitted: (String s) =>
                          changeCardBorderWidth(double.parse(s)),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.edit_outlined, size: 20),
                          helperText: "Border Width\nDef: 1.0",
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10.0)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10.0))),
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(// only point
                            RegExp(r'^(\d+)?\.?\d{0,2}'))
                      ],
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      maxLength: 4,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      controller: customControllerCardBorderRadius,
                      onSubmitted: (String s) =>
                          changeCardBorderRadius(double.parse(s)),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.edit_outlined, size: 20),
                          helperText: "Border Radius\nDef: 10.0",
                          contentPadding: new EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 10.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10.0)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10.0))),
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(// only point
                              RegExp(r'^(\d+)?\.?\d{0,2}'))
                        ],
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        maxLength: 3,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: customControllerCardBorderOpacity,
                        onSubmitted: (String s) =>
                            changeCardBorderOpacity(double.parse(s)),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.edit_outlined, size: 20),
                            helperText: "Border Opacity\nGrey[600] <= 1\nDef: 0.5",
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 10.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10.0))),
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(// only point
                              RegExp(r'^(\d+)?\.?\d{0,2}'))
                        ],
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        maxLength: 4,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: customControllerFontSize,
                        onSubmitted: (String s) =>
                            changeFontSize(double.parse(s)),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.edit_outlined, size: 20),
                            helperText: "Font Size\nDef: Title = 17\nDef: SubTitle = 14.5",
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 10.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10.0))),
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Center(
                  child: const Text(
                "App Color Options",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        maxLength: 6,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: customControllerAppBackgroundColor,
                        onSubmitted: (String s) =>
                            changeBackgroundColor(s.toString()),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.edit_outlined, size: 20),
                            helperText: "Background Color\nDef: 202020",
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 10.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10.0))),
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: TextField(
                        maxLength: 6,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: customControllerAppTopBarColor,
                        onSubmitted: (String s) =>
                            changeAppTopBarColor(s.toString()),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.edit_outlined, size: 20),
                            helperText: "TopBar Color\nDef: 202020",
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 10.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10.0))),
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        maxLength: 6,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: customControllerAppBottomBarColor,
                        onSubmitted: (String s) =>
                            changeAppBottomBarColor(s.toString()),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.edit_outlined, size: 20),
                            helperText: "BottomBar Color\nDef: 181818",
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 10.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10.0))),
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Flexible(
                      child: TextField(
                        maxLength: 6,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: customControllerAccentColor,
                        onSubmitted: (String s) =>
                            changeAccentColor(s.toString()),
                        decoration: InputDecoration(
                            isDense: true,
                            helperText: "Accent Color\nDef: 64FFDA",
                            prefixIcon: Icon(Icons.edit_outlined, size: 20),
                            contentPadding: new EdgeInsets.symmetric(
                                vertical: 0.0, horizontal: 15.0),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.withOpacity(0.3),
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10.0)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                borderRadius: BorderRadius.circular(10.0))),
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 150),
            ],
          ),
        ),
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
}

//keyboardType: TextInputType.numberWithOptions(decimal: true),
