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
  Color accentColor = Colors.tealAccent.withOpacity(0.8);

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

  changeCardBorderOpacity(double value) {
    setState(() {
      cardBorderOpacity = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appTopBarColor,
        title: Text("UI + Color Tester"),
        elevation: 0,
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
              child: SizedBox(
                height: 100,
                width: 800,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(40, 0, 60, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor: accentColor,
                        radius: 22,
                      ),
                      Column(
                        children: [
                          SizedBox(height: 30),
                          Text("Ha! Ha! What A Story Mark!",
                              //"Title",
                              style: TextStyle(fontSize: cardTitleFontSize)),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "You're tearing me apart, Lisa!",
                            // "Subtitle"
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
        ),
        Divider(
          thickness: 2,
          height: 1,
          color: Colors.black,
        ),
        Expanded(
          child: ListView(
            children: [
              const SizedBox(height: 20),
              Center(
                  child: const Text(
                "Card Options",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Row(children: [
                  Flexible(
                    child: TextField(
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(// only point
                            RegExp(r'^(\d+)?\d{0,2}'))
                      ],
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      controller: customControllerCardColor,
                      onSubmitted: (String s) => changeCardColor(s.toString()),
                      decoration: InputDecoration(
                          isDense: true,
                          helperText: "Card Color",
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
                      maxLength: 3,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      controller: customControllerCardBorderWidth,
                      onSubmitted: (String s) =>
                          changeCardBorderWidth(double.parse(s)),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.edit_outlined, size: 20),
                          helperText: "Card Border Width",
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
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Row(children: [
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
                      controller: customControllerCardElevation,
                      onSubmitted: (String s) =>
                          changeCardElevation(double.parse(s)),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.edit_outlined, size: 20),
                          helperText: "Card Elevation",
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
                      maxLength: 3,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      controller: customControllerCardBorderRadius,
                      onSubmitted: (String s) =>
                          changeCardBorderRadius(double.parse(s)),
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.edit_outlined, size: 20),
                          helperText: "Card Border Radius",
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
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 225, 0),
                child: TextField(
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(// only point
                        RegExp(r'^(\d+)?\.?\d{0,2}'))
                  ],
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  maxLength: 3,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  controller: customControllerCardBorderOpacity,
                  onSubmitted: (String s) =>
                      changeCardBorderOpacity(double.parse(s)),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.edit_outlined, size: 20),
                      helperText: "Card Border Opacity Grey[600]   <= 1",
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
              const SizedBox(height: 20),
              Center(
                  child: const Text(
                "Background Options",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              )),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(// only point
                              RegExp(r'^(\d+)?\d{0,2}'))
                        ],
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        maxLength: 6,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: customControllerAppBackgroundColor,
                        onSubmitted: (String s) =>
                            changeBackgroundColor(s.toString()),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.edit_outlined, size: 20),
                            helperText: "Background Color",
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
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(// only point
                              RegExp(r'^(\d+)?\d{0,2}'))
                        ],
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        maxLength: 6,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: customControllerAppTopBarColor,
                        onSubmitted: (String s) =>
                            changeAppTopBarColor(s.toString()),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.edit_outlined, size: 20),
                            helperText: "TopBar Color",
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
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.allow(// only point
                              RegExp(r'^(\d+)?\d{0,2}'))
                        ],
                        keyboardType:
                            TextInputType.numberWithOptions(decimal: true),
                        maxLength: 6,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        controller: customControllerAppBottomBarColor,
                        onSubmitted: (String s) =>
                            changeAppBottomBarColor(s.toString()),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.edit_outlined, size: 20),
                            helperText: "BottomBar Color",
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
                            helperText: "Accent Color",
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
              const SizedBox(height: 50),
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
