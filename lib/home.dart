import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> titles = [];
  List<String> descriptions = [];

  // var a = titles.length;
  List<bool> isExpanded;

  @override
  void initState() {
    super.initState();
    titles = ["first", "second", "third", "fourth"];
    descriptions = [
      "this is the first task",
      "this is the second task",
      "this is the third task",
      "this is the fourth task"
    ];
    isExpanded = List.filled(titles.length, false);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
        floatingActionButton: (IconButton(
          icon: Icon(
            Icons.add_outlined,
          ),
          iconSize: mediaQuery.height * 0.08,
          onPressed: () {},
        )),
        drawer: Drawer(
          child: Container(
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 70,
                ),
                Row(
                  children: [
                    Container(
                      color: Colors.cyan,
                      padding: EdgeInsets.only(left: 10),
                      child: CircleAvatar(
                        child: Icon(
                          Icons.perm_identity_sharp,
                          size: 60,
                        ),
                        radius: 40,
                        backgroundColor: Colors.yellow,
                      ),
                    ),
                    Container(
                      color: Colors.cyan,
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        children: [
                          Text(
                            "Firstname",
                            textScaleFactor: 3,
                          ),
                          Text(
                            "Lastname",
                            textScaleFactor: 2,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                FlatButton(
                    onPressed: null,
                    child: Text(
                      "My Account",
                      textScaleFactor: 2,
                    )),
                FlatButton(
                    onPressed: null,
                    child: Text(
                      "Upcoming Events",
                      textScaleFactor: 2,
                    )),
                FlatButton(
                    onPressed: null,
                    child: Text(
                      "About",
                      textScaleFactor: 2,
                    )),
                FlatButton(
                    onPressed: null,
                    child: Text(
                      "Settings",
                      textScaleFactor: 2,
                    )),
                FlatButton(
                    onPressed: null,
                    child: Text(
                      "Help!",
                      textScaleFactor: 2,
                    )),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(''),
          actions: [
            IconButton(
              icon: Icon(Icons.calendar_today_outlined),
              onPressed: () {},
              padding: EdgeInsets.only(right: 10),
              iconSize: mediaQuery.height * 0.04,
            )
          ],
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   onPressed: () {},
          //   iconSize: mediaQuery.height * 0.05,
          //   padding: EdgeInsets.only(left: 10),
          // ),
        ),
        body: Container(
          height: mediaQuery.height * 0.8,
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Container(
                  //padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(10.0),
                  width: mediaQuery.width * 0.8,
                  height: isExpanded[index] ? 180 : 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: mediaQuery.width * 0.948,
                            height: 30,
                            padding: EdgeInsets.only(left: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              color: Colors.cyanAccent,
                            ),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Task ${index + 1}",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 22,
                                backgroundColor: Colors.cyanAccent,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            color: Colors.red,
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.only(left: 10),
                            child: Text(titles[index],
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                )),
                          ),
                          Container(
                              color: Colors.red,
                              // margin: EdgeInsets.only(top: 38),
                              alignment: Alignment.bottomRight,
                              child: IconButton(
                                icon: Icon(isExpanded[index]
                                    ? Icons.keyboard_arrow_up_outlined
                                    : Icons.keyboard_arrow_down_outlined),
                                onPressed: () {
                                  setState(() {
                                    isExpanded[index] = !isExpanded[index];
                                  });
                                },
                              ))
                        ],
                      ),
                      if (isExpanded[index])
                        Row(
                          children: [
                            Container(
                              color: Colors.red,
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(left: 10),
                              child: Text(descriptions[index],
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  )),
                            )
                          ],
                        )
                    ],
                  ));
            },
          ),
        ));
  }
}
