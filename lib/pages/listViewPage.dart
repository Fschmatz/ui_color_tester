import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  Color back;
  Color top;
  Color bottomBar;
  double titleFontSize;
  double subtitleFontSize;
  Function() populateWithDefaultsValues;
  Function() refreshUI;

  ListViewPage(
      {Key key,
      this.back,
      this.top,
      this.bottomBar,
      this.populateWithDefaultsValues,
      this.refreshUI,
      this.titleFontSize,
      this.subtitleFontSize})
      : super(key: key);

  @override
  _ListViewPageState createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  bool showDivider = true;

  @override
  Widget build(BuildContext context) {
    Icon iconShowDivider = showDivider
        ? Icon(
            Icons.visibility_off_outlined,
            color: Theme.of(context).textTheme.headline6.color.withOpacity(0.7),
          )
        : Icon(
            Icons.visibility_outlined,
            color: Theme.of(context).textTheme.headline6.color.withOpacity(0.7),
          );

    return Scaffold(
      backgroundColor: widget.back,
      appBar: AppBar(
        backgroundColor: widget.top,
        title: Text("ListView + Divider"),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
            child: IconButton(
              icon: Icon(Icons.restore_outlined),
              tooltip: 'Reset to Defaults',
              color:
                  Theme.of(context).textTheme.headline6.color.withOpacity(0.7),
              onPressed: () {
                widget.refreshUI();
                widget.populateWithDefaultsValues();
                setState(() {
                  widget.top = Color(0xFF202020);
                  widget.back = Color(0xFF202020);
                  widget.bottomBar = Color(0xFF171717);
                  widget.titleFontSize = 16;
                  widget.subtitleFontSize = 14;
                });
              },
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListView.separated(
              separatorBuilder: (context, index) => showDivider
                  ? Divider(
                      height: 15,
                    )
                  : SizedBox(height: 15),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (context, index) {
                if (index % 2 == 0) {
                  return ListTile(
                      onTap: () {},
                      title: Text(
                          "Johnny: I did not hit her, it's not true! It's bullshit! I did not hit her!\n[throws water bottle]\nJohnny: I did *not*. Oh hi, Mark!",
                          style: TextStyle(
                            fontSize: widget.titleFontSize,
                          )),
                      subtitle: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Roof Scene",
                            style: TextStyle(fontSize: widget.subtitleFontSize),
                          ),
                          IconButton(
                              color: Theme.of(context).hintColor,
                              icon: Icon(Icons.share_outlined),
                              onPressed: () {}),
                        ],
                      ));
                }
                if (index % 3 == 0) {
                  return ListTile(
                    onTap: () {},
                    title: Text(
                        "Mark: How was work today?\n"
                        "Johnny: Oh, pretty good. We got a new client and the bank will make a lot of money.\n"
                        "Mark: What client?\n"
                        "Johnny: I cannot tell you; it's confidential.\n"
                        "Mark: Aw, come on. Why not?\n"
                        "Johnny: No, I can't. Anyway, how is your sex life?",
                        style: TextStyle(
                          fontSize: widget.titleFontSize,
                        )),
                  );
                } else {
                  return ListTile(
                    onTap: () {},
                    title: Text(
                        "Johnny: I kill you, you bastard!\n"
                        "Mark: You couldn't kill me if you tried.\n"
                        "Johnny: You betrayed me! You're not good. You, you're just a chicken. Chip-chip-chip-chip-cheep-cheep.",
                        style: TextStyle(
                          fontSize: widget.titleFontSize,
                        )),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "06/27/2003",
                          style: TextStyle(
                              fontSize: widget.subtitleFontSize,
                              color: Theme.of(context).hintColor),
                        ),
                        IconButton(
                            color: Theme.of(context).hintColor,
                            icon: Icon(Icons.share_outlined),
                            onPressed: () {}),
                      ],
                    ),
                  );
                }
              })
        ],
      ),
      bottomNavigationBar: BottomAppBar(
          color: widget.bottomBar,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    splashRadius: 30,
                    icon: iconShowDivider,
                    tooltip: 'Show/Hide Divider',
                    onPressed: () {
                      setState(() {
                        showDivider = !showDivider;
                      });
                    }),
              ],
            ),
          )),
    );
  }
}
