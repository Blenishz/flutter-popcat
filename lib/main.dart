import 'package:material_ui/material_ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.lightGreen),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0;
  String imagePath = "image/catoriginal.png";
  //   build ใช้แสดงผลข้อมูล
  @override
  Widget build(BuildContext context) {
    List<Widget> data = getData(3);
    data.add(
      Text("Press button to add number", style: TextStyle(fontSize: 20)),
    );
    data.add(Text(number.toString(), style: TextStyle(fontSize: 60)));

    List<Widget> tk = [];
    tk.add(
      Text(
        "Click!",
        style: TextStyle(fontSize: 30, color: Colors.deepOrange),
      ),
    );
    tk.add(
      Image.asset(
        imagePath,
        width: 200,
        height: 200,
      ),
    );
    tk.add(
      Text("Pop POP PoP Pop", style: TextStyle(fontSize: 30, color: Colors.amber)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Pop Counter", style: TextStyle(fontSize: 30)),
        backgroundColor: const Color.fromARGB(255, 196, 210, 144),
        foregroundColor: const Color.fromARGB(255, 62, 103, 192),
      ),
      body: //ListView.builder(
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [...data, ...tk],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNumber,
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> addNumber() async {
    setState(() {
      number++;
      imagePath = "image/catoriginal.jpg";
    });

    await Future.delayed(Duration(seconds: 1));

    if (!mounted) return;

    setState(() {
      imagePath = "image/catmeme.png";
    });
  }

  //    widget ใช้เตรียมข้อมูล
  List<Widget> getData(int count) {
    //    กลุ่มข้อมูล Text Widget
    List<Widget> data = [];
    data.add(Text("beginning..."));
    for (var i = 1; i <= count; i++) {
      data.add(
        ListTile(
          title: Text(
            "POP $i",
            style: TextStyle(
              fontSize: 20,
              color: const Color.fromARGB(255, 78, 57, 13),
            ),
          ),
          subtitle: Text(
            "pop $i",
            style: TextStyle(
              fontSize: 15,
              color: const Color.fromARGB(255, 189, 157, 40),
            ),
          ),
        ),
      );
    }
    return data;
  }
}
