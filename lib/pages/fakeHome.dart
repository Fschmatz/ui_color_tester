import 'package:flutter/material.dart';

class FakeHome extends StatefulWidget {
  Color back;
  Color top;
  Color bottomBar;
  double titleFontSize;
  double subtitleFontSize;
  Color accentButton;
  Function() populateWithDefaultsValues;
  Function() refreshUI;

  FakeHome(
      {Key key,
        this.back,
        this.top,
        this.bottomBar,
        this.populateWithDefaultsValues,
        this.refreshUI,
        this.titleFontSize,
        this.accentButton,
        this.subtitleFontSize})
      : super(key: key);

  @override
  _FakeHomeState createState() => _FakeHomeState();
}

class _FakeHomeState extends State<FakeHome> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: widget.back,
      appBar: AppBar(
        backgroundColor: widget.top,
        title: Text("Fake Home"),
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
                  widget.accentButton = Color(0xFF00BFA5);
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
              separatorBuilder: (context, index) =>  Divider(
              ),

              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                      '''
Johnny: [walks into flower shop] Hi.
Flower Shop Clerk: Can I help you?
Johnny: Yeah, can I have a dozen red roses, please?
Flower Shop Clerk: Oh, hi, Johnny. I didn't know it was you.
[grabs bouquet of roses]
Flower Shop Clerk: Here you go.
Johnny: That's me. How much is it?
Flower Shop Clerk: It'll be eighteen dollars.
Johnny: [hands over cash] Here you go. Keep the change.
[grabs flowers and pats dog on the counter]
Johnny: Hi, doggy.
Flower Shop Clerk: You're my favorite customer.
Johnny: Thanks a lot. Bye!
Flower Shop Clerk: Buh-bye!''',
                      style: TextStyle(fontSize: widget.titleFontSize),
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text(
                     'Flower Shop Scene',
                      style: TextStyle(fontSize: widget.subtitleFontSize,),
                    ),
                  ),
                  leading: CircleAvatar(
                      backgroundColor: widget.accentButton,),
                  onTap: () {},
                );
              }
               ),
          const SizedBox(height: 40,)
        ],
      ),
      floatingActionButton: Container(
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: widget.accentButton,
            elevation: 0.0,
            onPressed: () {},
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          color: widget.bottomBar,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(height: 48,),
              ],
            ),
          )),
    );
  }
}
