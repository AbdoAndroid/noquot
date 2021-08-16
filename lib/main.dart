import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('دفتر النقوط'),
        centerTitle: true,
        leading: const Icon(Icons.book),
      ),
      endDrawer: Drawer(
        elevation: 20.0,
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(
                "Developed by: Ahmed Abdo",
                style: TextStyle(fontSize: 22),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/photo.jpg",
                ),
              ),
              accountEmail: null,
            ),
            Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    tile("تسجيل نقطة لنا", Icons.edit),
                    tile("تسجيل نقطة علينا", Icons.edit),
                    tile("سجل النقوط لنا", Icons.book),
                    tile("سجل النقوط علينا", Icons.book),
                    tile("سجل النقوط لنا المشطوبة", Icons.book_outlined),
                    tile("سجل النقوط علينا المشطوبة", Icons.book_outlined),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  ListTile tile(String text, IconData icon) {
    return ListTile(
        leading: Icon(
          icon,
          color: Colors.blueAccent,
        ),
        title: Text(
          text,
          textDirection: TextDirection.rtl,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.blueAccent,
          ),
        ),
        onTap: () {
          var target = null;
          switch (text) {
            case 'تسجيل نقطة لنا':
              {
                // statements;
              }
              break;

            case 'تسجيل نقطة علينا':
              {
                //statements;
              }
              break;
            case 'سجل النقوط لنا':
              {
                //statements;
              }
              break;
            case 'سجل النقوط علينا':
              {
                //statements;
              }
              break;
            case 'سجل النقوط لنا المشطوبة':
              {
                //statements;
              }
              break;
            case 'سجل النقوط علينا المشطوبة':
              {
                //statements;
              }
              break;

            default:
              {
                //statements;
              }
              break;
          }
          /*Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Metricroll()));*/
        });
  }
}
