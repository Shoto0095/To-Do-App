import 'package:flutter/material.dart';
import 'package:learn/Todo.dart';
import '../model.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoslist = Test.todoList();
  List<Test> findtodo = [];
  final textchanged = TextEditingController();
  @override
  void initState() {
    findtodo = todoslist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildappbar(),
        body: Stack(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Column(
                  children: [
                    searchbox(),
                    Expanded(
                        child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 30,
                            bottom: 20,
                          ),
                          child: Text(
                            "All ToDo's",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          ),
                        ),
                        for (Test todoo in findtodo.reversed)
                          toDo(
                            todo: todoo,
                            OnToDochanged: _handleToDochange,
                            OnDeletechanged: _deleteitems,
                          ),
                      ],
                    )),
                  ],
                )),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(children: [
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: textchanged,
                      style: TextStyle(fontSize: 20),
                      decoration: InputDecoration(
                          hintText: 'Add to do items',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.blue))),
                    ),
                  )),
                  ElevatedButton(
                      onPressed: () {
                        addtodo(textchanged.text);
                      },
                      child: Text(
                        '+',
                        style: TextStyle(fontSize: 40),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          minimumSize: Size(60, 60),
                          elevation: 10,
                          side: BorderSide(style: BorderStyle.solid))),
                ]))
          ],
        ));
  }

  void _handleToDochange(Test todosss) {
    setState(() {
      todosss.isDone = !todosss.isDone;
    });
  }

  void _deleteitems(String id) {
    setState(() {
      todoslist.removeWhere((item) => item.id == id);
    });
  }

  void addtodo(String todo) {
    setState(() {
      todoslist.add(Test(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: todo));
    });
    textchanged.clear();
  }

  void luffyzoro(String value) {
    List<Test> results = [];
    if (value.isEmpty) {
      results = todoslist;
    } else {
      results = todoslist
          .where((item) =>
              item.todoText!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    setState(() {
      findtodo = results;
    });
  }

  Widget searchbox() {
    return Container(
        child: TextField(
      onChanged: (value) => luffyzoro(value),
      decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          fillColor: Color(808080),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(25))),
    ));
  }
}

AppBar buildappbar() {
  return AppBar(
    toolbarHeight: 70,
    backgroundColor: Colors.pink[600],
    title: Row(
      children: [
        Icon(
          Icons.menu,
          size: 30,
        ),
        SizedBox(
          width: 270,
        ),
        CircleAvatar(
          backgroundImage: AssetImage('assets/shoto.png'),
          radius: 28,
        )
      ],
    ),
  );
}
