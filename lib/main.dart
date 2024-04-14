import 'package:flutter/material.dart';
import 'package:medievidle/data.dart';
import 'package:medievidle/woodcut.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medievidle',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: globalFontColor,
        fontFamily: "CourierPrime",
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 36.0,), // AppBar
          bodyMedium: TextStyle(fontSize: 21.0,), // Text
          labelLarge: TextStyle(fontSize: 24), // Button
        ),
      ),
      home: const MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  double sizedBoxH = 20;

  getScreenWidth(BuildContext ctx){return MediaQuery.of(ctx).size.width;}
  getScreenHeight(BuildContext ctx){return MediaQuery.of(ctx).size.height;}

  OutlinedButton myOutlinedButton(String title, Widget target){
    return OutlinedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => target)
      ),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        )),
        minimumSize: MaterialStatePropertyAll(Size(getScreenWidth(context)*0.35, MediaQuery.of(context).size.height*0.10)),
        side: MaterialStateProperty.all(BorderSide(
          color: globalAccentColor,
          width: 2.0,
        )),
        foregroundColor: MaterialStateProperty.all(globalFontColor)
      ),
      child: Text(title)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: globalFontColor),),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Column(
            children: [
              Divider(height: 1, color: globalAccentColor,),
              SizedBox(height: sizedBoxH,)
            ],
          ),
        )
      ),
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("V Skills V"),
              SizedBox(height: sizedBoxH),
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                spacing: 20,
                runSpacing: 20,
                children: [
                  myOutlinedButton("woodcut", const WoodcutPage()),
                  myOutlinedButton("woodcut", const WoodcutPage()),
                  myOutlinedButton("woodcut", const WoodcutPage()),
                  myOutlinedButton("woodcut", const WoodcutPage()),
                ],
              ),
              SizedBox(height: sizedBoxH),
              Divider(height: 1, color: globalAccentColor,),
              SizedBox(height: sizedBoxH),
              const Text("V current working V"),
              SizedBox(height: sizedBoxH),
            ],
          ),
        )
      ),
    );
  }
}

