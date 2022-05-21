import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  late String _userToDO;
  late String _userPass;
  Map<String, String> flutterApplication3List = {
    "sc880008@gmail.com": "553304",
    "augustinStock@gmail.com": "9509017007hgtc",
    "augustWern@gmail.com": "441745hgtcADS",
    "dashasozhnikova@gmail.com": "441745",
  };
  

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Менеджер паролей'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: flutterApplication3List.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(flutterApplication3List.keys.toList()[index]),
              child: Card(
                child: ListTile(
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete_sweep,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          String key = flutterApplication3List.keys.toList()[index];
                          flutterApplication3List.remove(key);
                        });
                      },
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Логин: " + flutterApplication3List.keys.toList()[index]),
                        Text("Пароль: " + flutterApplication3List.values.toList()[index]),
                      ],
                    )),
              ),
              onDismissed: (direction) {
                setState(() {
                  String key = flutterApplication3List.keys.toList()[index];
                  flutterApplication3List.remove(key);
                });
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Добавить логин и пароль'),
                  content: Column(
                    children: [
                      TextField(
                        onChanged: (String value) {
                          _userToDO = value;
                        },
                      ),
                      TextField(
                        onChanged: (String value) {
                          _userPass = value;
                        },
                      ),
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            flutterApplication3List[_userToDO] = _userPass;
                          });
                          Navigator.of(context).pop();
                        },
                        child: Text('Добавить'))
                  ],
                )
                ;
              });
        },
        child: Icon(
          Icons.add_box_outlined,
          color: Colors.white,
        ),
      ),
    );
  }
  
}

