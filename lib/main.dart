import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
void main() async {

WidgetsFlutterBinding.ensureInitialized();
await FlutterDownloader.initialize(
  debug: true // printing logs to console
);

  runApp(MyApp());




}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Download Test'),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 150,
              height: 50,
              child: FlatButton(
                onPressed: () async {
                  final userStatus=  await Permission.storage.request();

if(userStatus.isGranted){
  // download part
  
final extDir = await getExternalStorageDirectory();
 FlutterDownloader.enqueue(url: "https://drive.google.com/u/0/uc?id=1K2_0tPQrX5e59l9vrBeSwiIqAdU7MROh&export=download", savedDir: extDir.path,
  fileName: "Swaraj.jpg",
  showNotification: true,
  openFileFromNotification: true);
  
} else{
// can't download
print('Permission Denied');

}

                },
                child: Text('Download'),
                color: Colors.green,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
