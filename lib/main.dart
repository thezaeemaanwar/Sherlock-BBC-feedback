import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // canvasColor: Colors.grey,
          primarySwatch: Colors.teal,
          textTheme: TextTheme(
              headline3: TextStyle(color: Colors.teal, fontSize: 24))),
      home: MyHomePage(title: 'Sherlock BBC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropDownValue = 'Sherlock Holmes';
  List<bool> isSelected = [true, false];
  Map<String, bool> listValues = {
    'A Study in Pink': false,
    'The Blind Banker': false,
    'The Great Game': false,
    'A Scandal in Belgravia': false,
    'The Hounds of Baskerville': false,
    'The Reichenbatch fall': false,
    'Many Happy Returns': false,
    'The Empty Hearse': false,
    'The Sign of Three': false,
    'His Last Vow': false,
    'The Abominable Bride': false,
    'The Six Thatchers': false,
    'The Lying Detective': false,
    'The Final Problem': false
  };

  void setDropDown(String newVal) {
    this.setState(() {
      dropDownValue = newVal;
    });
  }

  void handleToggleButton(int ind) {
    this.setState(() {
      for (int i = 0; i < isSelected.length; i++) {
        isSelected[i] = i == ind;
      }
    });
  }

  void handleCheckBoxClick(bool check, String key) {
    this.setState(() {
      listValues[key] = check;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            margin: EdgeInsets.only(right: 50, left: 50),
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(),
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Text("Your Favorite Sherlock series character : ",
                        style: Theme.of(context).textTheme.headline3),
                    DropdownButton(
                      value: dropDownValue,
                      onChanged: (String nVal) => {setDropDown(nVal)},
                      underline: Container(
                        height: 2,
                        color: Colors.teal,
                      ),
                      items: <String>[
                        'Sherlock Holmes',
                        'Doctor Watson',
                        'Eurus Holmes',
                        'Mycroft Holmes',
                        'Mrs. Hudson'
                      ].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 50),
                    Text(
                        "Did Sherlock BBC recieved the fame and appreciation it deserved?",
                        style: Theme.of(context).textTheme.headline3),
                    ToggleButtons(
                      children: [Icon(Icons.check), Icon(Icons.close)],
                      onPressed: (int index) => {handleToggleButton(index)},
                      isSelected: isSelected,
                    ),
                    SizedBox(height: 50),
                    Text("Select your favorite episodes from below",
                        style: Theme.of(context).textTheme.headline3),
                    Column(
                        children: listValues.entries
                            .map((e) => CheckboxListTile(
                                title: Text(e.key),
                                value: e.value,
                                onChanged: (bool check) =>
                                    handleCheckBoxClick(check, e.key)))
                            .toList())
                  ],
                ),
              ),
            )));
  }
}
