
import 'package:flutter/material.dart';
import 'package:bottom_bar_matu/bottom_bar_matu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Bottom Bar Bubble'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override 
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController controller = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title,style: const TextStyle(fontSize: 15),),centerTitle: true,),
        bottomNavigationBar: Container(
        color: Colors.green,
        child: BottomBarBubble(
          selectedIndex: currentIndex,
          color: Colors.white,
          items: [
            BottomBarItem(
              iconBuilder: (color) {
                return const Icon(Icons.home,color: Colors.white,);
              },
            ),
            BottomBarItem(
              iconBuilder: (color) {
                return const Icon(Icons.chat,color: Colors.white,);
              },
            ),
            BottomBarItem(
              iconBuilder: (color) {
                return const Icon(Icons.notifications,color: Colors.white,);
              },
            ),
            BottomBarItem(
              iconBuilder: (color) {
                return const Icon(Icons.calendar_month,color: Colors.white,);
              },
            ),
            BottomBarItem(
              iconBuilder: (color) {
                return const Icon(Icons.settings,color: Colors.white,);
              },
            ),
          ],
          onSelect: (index) {
            setState(() {
              currentIndex =index;
            });
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
          child:  currentIndex == 0 ?  
            const Padding(
              padding: EdgeInsets.only(top: 160),
              child: Center(child: Text("Home",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            )
            : 
            currentIndex == 1 ?
            const Center(child: Padding(
              padding: EdgeInsets.only(top: 160),
              child: Text("Message",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ))
            : 
            currentIndex == 2 ?
            const Padding(
              padding: EdgeInsets.only(top: 160),
              child: Center(child: Text("Notification",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            )
            :
            currentIndex == 3 ?
            const Padding(
              padding: EdgeInsets.only(top: 160),
              child: Center(child: Text("Calender",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            )
            :
            const Padding(
              padding: EdgeInsets.only(top: 160),
              child: Center(child: Text("Setting",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            )
          ),
        ],
      ),
    );
  }
}