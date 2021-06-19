import 'package:flutter/material.dart';

class FakeHome extends StatefulWidget {
  Color back;
  Color top;
  Color bottomBar;
  double titleFontSize;
  double subtitleFontSize;
  Color accentColor;
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
      this.accentColor,
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
                  widget.accentColor = Color(0xFF00BFA5);
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
          ListTile(
            leading: SizedBox(
              height: 0.1,
            ),
            title: Text("Flower Shop Scene".toUpperCase(),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: widget.accentColor)),
          ),
          ListTile(
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
            leading: CircleAvatar(
              backgroundColor: widget.accentColor,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: SizedBox(
              height: 0.1,
            ),
            title: Text("Pizza Scene".toUpperCase(),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: widget.accentColor)),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                '''
Lisa: Do you want me to order a pizza?
Johnny: Whatever, I don't care.
Lisa: I already ordered a pizza.
Johnny: You think about everything, ha ha ha.
''',
                style: TextStyle(fontSize: widget.titleFontSize),
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: widget.accentColor,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: SizedBox(
              height: 0.1,
            ),
            title: Text("Mom Talk Scene".toUpperCase(),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: widget.accentColor)),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                '''
Claudette: Everything goes wrong all at once. Nobody wants to help me. And I'm dying.
Lisa: You're not dying, mom.
Claudette: I got the results of the test back - I definitely have breast cancer.
''',
                style: TextStyle(fontSize: widget.titleFontSize),
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: widget.accentColor,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: SizedBox(
              height: 0.1,
            ),
            title: Text("Johnny's Birthday Scene".toUpperCase(),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: widget.accentColor)),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                '''
Johnny: Thank you, honey, this is a beautiful party! You invited all my friends. Good thinking!
''',
                style: TextStyle(fontSize: widget.titleFontSize),
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: widget.accentColor,
            ),
            onTap: () {},
          ),
          ListTile(
            leading: SizedBox(
              height: 0.1,
            ),
            title: Text("Drug Dealer Scene".toUpperCase(),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: widget.accentColor)),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Text(
                '''
Chris-R: Hey, Denny.
Denny: Chris-R. I've been lookin' for you.
Chris-R: Yeah, sure you have. You have my money, right?
Denny: Yeah. It's comin'. It'll be here in a few minutes.
Chris-R: What do you mean it's coming, Denny? Where's... my money?
Denny: Okay. Just- Just give me five minutes. Just give me five.
Chris-R: Five minutes? You want five fucking minutes, Denny? You know what? I haven't got five fucking minutes!
[Draws his gun, grabs Denny and pulls him towards the ground]
Chris-R: I'm gonna ask you again, Denny. Where's my money?
Denny: I don't have anything.
Chris-R: Where's my money, Denny? Where's my *fucking* money, Denny? What did you do with my fucking money?
Denny: I swear to God. It's coming.
Chris-R: Where's my fuckin' money, Denny?
Denny: Put the gun down!
[Johnny and Mark arrive, running to Denny to help him]
Chris-R: My fucking money! Where's my fucking money, Denny?
Johnny: What's with this guy?
Chris-R: Get off! You're fuckin' dead, Denny!
Lisa: What's going on here? Somebody help!
Johnny: Let's take him to the police.
''',
                style: TextStyle(fontSize: widget.titleFontSize),
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: widget.accentColor,
            ),
            onTap: () {},
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
      floatingActionButton: Container(
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: widget.accentColor,
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
                const SizedBox(
                  height: 48,
                ),
              ],
            ),
          )),
    );
  }
}
