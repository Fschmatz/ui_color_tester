import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_color_tester/util/changelog.dart';
import 'package:ui_color_tester/util/theme.dart';
import 'appInfoPage.dart';
import 'changelogPage.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();

  SettingsPage({Key key}) : super(key: key);
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  void initState() {
    super.initState();
  }

  Color themeColorApp = Color(0xFF449EBC);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings"),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Card(
                elevation: 1,
                margin: const EdgeInsets.fromLTRB(16, 20, 16, 25),
                color: themeColorApp,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: ListTile(
                  title: Text(
                    Changelog.appName + " " + Changelog.appVersion,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17.5, color: Colors.black),
                  ),
                ),
              ),
              const Divider(),
              ListTile(
                leading: SizedBox(height: 0.1,),
                title:    Text(
                    "About".toUpperCase(),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: themeColorApp)
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.info_outline,
                ),
                title: Text(
                  "App Info",
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => AppInfoPage(),
                        fullscreenDialog: true,
                      ));
                },
              ),
              const SizedBox(
                height: 10.0,
              ),
              ListTile(
                leading: Icon(
                  Icons.article_outlined,
                ),
                title: Text(
                  "Changelog",
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => ChangelogPage(),
                        fullscreenDialog: true,
                      ));
                },
              ),
              const Divider(),
              ListTile(
                leading: SizedBox(height: 0.1,),
                title:    Text(
                    "General".toUpperCase(),
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: themeColorApp)
                ),
              ),
              Consumer<ThemeNotifier>(
                builder: (context, notifier, child) => SwitchListTile(
                    title: Text(
                      "Dark Theme",
                      style: TextStyle(fontSize: 16),
                    ),
                    secondary: Icon(Icons.brightness_6_outlined),
                    activeColor: Colors.blue,
                    value: notifier.darkTheme,
                    onChanged: (value) {
                      notifier.toggleTheme();
                    }),
              ),
              ListTile(
                leading: SizedBox(height: 0.1,),
                title:    Text(
                  "All default values are set for the dark theme,"
                      " to use with the white theme they must be set manually.",
                  style: TextStyle(
                      fontSize: 16, color: Theme.of(context).hintColor),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              FutureBuilder(
                  future: ShowBorderWidthOpacity()._loadFromPrefs(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SwitchListTile(
                          title: Text(
                            "Show Border Width and Opacity Options",
                            style: TextStyle(fontSize: 16),
                          ),
                          secondary: Icon(Icons.tune_outlined),
                          activeColor: Colors.blue,
                          value: snapshot.data,
                          onChanged: (value) {
                            setState(() {
                              ShowBorderWidthOpacity().toggleShowCount(value);
                            });
                          });
                    }
                    return SizedBox.shrink();
                  })
          ],
          ),
        ));
  }
}

class ShowBorderWidthOpacity {
  final String key = 'ShowBorderWidthOpacity';
  SharedPreferences prefs;
  bool _showBorderWidthOpacity;

  _initPrefs() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

  toggleShowCount(bool value) {
    _showBorderWidthOpacity = value;
    _saveToPrefs();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    return prefs.getBool(key) ?? false;
  }

  _saveToPrefs() async {
    await _initPrefs();
    prefs.setBool(key, _showBorderWidthOpacity);
  }
}

