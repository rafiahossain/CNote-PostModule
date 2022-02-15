import 'dart:html';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:uuid/uuid.dart';
import 'package:geolocator/geolocator.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:firebase_storage/firebase_storage.dart';


import 'package:cloud_firestore/cloud_firestore.dart';
// FirebaseFirestore firestore = FirebaseFirestore.instance;
final postRef = FirebaseFirestore.instance.collection('posts');


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to CNote',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'CNote'),
    );

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        //THE CHILDREN PROPERTY IS A LIST[] OF WIDGETS
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(10.0),
            child: Image(image: AssetImage('assets/CNote-InApp-Logo.png')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () {
                  //GO TO MAKE POST PAGE
                  //OBTAIN AN INSTANCE OF THE NAVIGATOR CLASS USING THE .of() METHOD
                  //USE THE .push(); METHOD
                  //PASSED IN THE MaterialPageRoute TO IT
                  //WHICH TOOK IN A BUILDER THAT RETURNS THE DIARY PAGE
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MakePost(),
                    ),
                  );
                },
                color: Colors.deepPurple[300],
                child: Text(
                  'Make Post',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                splashColor: Colors.purple,
              ),
              
              //
              // GO TO EVIDENCE DIARY PAGE
              //
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () {
                  //GO TO DIARY
                  //OBTAIN AN INSTANCE OF THE NAVIGATOR CLASS USING THE .of() METHOD
                  //USE THE .push(); METHOD
                  //PASSED IN THE MaterialPageRoute TO IT
                  //WHICH TOOK IN A BUILDER THAT RETURNS THE DIARY PAGE
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Diary(),
                    ),
                  );
                },
                color: Colors.deepPurple[300],
                child: Text(
                  'Diary',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                splashColor: Colors.purple,
              ),

              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () {
                  //GO TO EMERGENCY PAGE
                  //OBTAIN AN INSTANCE OF THE NAVIGATOR CLASS USING THE .of() METHOD
                  //USE THE .push(); METHOD
                  //PASSED IN THE MaterialPageRoute TO IT
                  //WHICH TOOK IN A BUILDER THAT RETURNS THE DIARY PAGE
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Emergency(),
                    ),
                  );
                },
                color: Colors.deepPurple[300],
                child: Text(
                  'Emergency',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                splashColor: Colors.purple,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            margin: EdgeInsets.all(10.0),
            child: Text('About Us'),
          ),
          Container(
            color: Colors.deepPurple[100],
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(10.0),
            child: Text(
                'Our system, CNote, is introduced in order to bring a higher level of comfort to communities, and aid in justice and the inhibition of criminal and/or predatory activities. This project will mainly focus on the Sustainable Development Goal (SDG) 16 i.e., Peace, Justice and Strong Institutions, and support other SDGs such as SDG 11 (Sustainable Cities and Communities) as well as SDG 5 (Gender Equality). Our application is needed to put an end to just accepting life as it is, with harassment and violence remaining as the norm in secret. '),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            margin: EdgeInsets.all(10.0),
            child: Text('Contact Us'),
          ),
          Container(
            color: Colors.deepPurple[200],
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(10.0),
            child: Text(
                'Pamela Rabecca Saraswathy  146958  pamelarabecca12@student.usm.my\nKirtiniroopa A/P Shankar  146127  kirtini31@student.usm.my\nRafia Hossain 149684  rafiahossain@student.usm.my\nAdli bin Jabir 147161  adlijabir@student.usm.my'),
          ),
        ],
      ),


    );
  }
}

//
///
////
/////
//////
// MAKE POST CLASS

class MakePost extends StatefulWidget {
  //const MakePost({Key? key}) : super(key: key);
  @override
  _MakePostState createState() => _MakePostState();

}

class _MakePostState extends State<MakePost>{

  TextEditingController locationController = TextEditingController ();
  TextEditingController captionController = TextEditingController ();
  
  String postID = Uuid().v4();
  
  postInFirestore(String location, String caption) {
    postRef
    .doc(postID)
    .set({
      "postID" : postID,
      "caption" : caption,
      "location" : location,
      // "timestamp": Timestamp,
    });
  }

  getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    //Placeholder placemark = position;
    // List<Placemark> placemarks = await Geolocator.placemarkFromCoordinates(position.latitude, position.longitude);
    // Placemark placemark = placemarks[0];
    // String completeAddress =
   
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Make Post')),

      //Button at the bottom right corner of screen
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //GO BACK TO HOME PAGE/MyApp
          //OBTAIN AN INSTANCE OF THE NAVIGATOR CLASS USING THE .of() METHOD
          //USE THE .pop(); METHOD
          //PASSED IN THE MaterialPageRoute TO IT
          //WHICH TOOK IN A BUILDER THAT RETURNS THE DIARY PAGE
          Navigator.of(context).pop();
        },
        child: Icon(Icons.home),
        splashColor: Colors.purple,
      ), // This trailing comma makes auto-formatting nicer for build methods.

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        //THE CHILDREN PROPERTY IS A LIST[] OF WIDGETS
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(10.0),
            child: Image(image: AssetImage('assets/CNote-InApp-Logo.png')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[],
          ),
          ListTile(
            title: Container(
                width: 250.0,
                child: TextField(
                  controller: captionController,
                  decoration: InputDecoration(
                    hintText: 'Write a caption...',
                    border: InputBorder.none,
                  ),
                )),
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.pin_drop,
              color: Colors.pink,
              size: 35.0,
            ),
            title: Container(
              width: 250.0,
              child: TextField(
                controller: locationController,
                decoration: InputDecoration(
                  hintText: "Where did the incident occur?",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            width: 200.0,
            height: 100.0,
            alignment: Alignment.center,
            child: RaisedButton.icon(
              label: Text(
                'Use Current Location',
                style: TextStyle(color: Colors.white),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.deepPurple[200],
              onPressed: () {
                //FUNCTION TO USE CURRENT LOCATION
                getUserLocation();
              },
              icon: Icon(
                Icons.my_location,
                color: Colors.white,
              ),
            ),
          ),
          RaisedButton(
            onPressed: () { 
              postInFirestore(locationController.text, captionController.text);
              captionController.clear();
              locationController.clear();
              setState(() {
                //TO ENSURE POSTS ARE NOT REWRITTEN TO THE SAME ID
                postID = Uuid().v4();
              });
            },// FUNCTION TO EXECUTE WHEN POST IS CLICKED
            color: Colors.deepPurple[300],
            child: Text('Post', style: TextStyle(color: Colors.white)),
          ),
          Divider(),
          RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () {
                  //GO TO VIEW POST PAGE
                  //OBTAIN AN INSTANCE OF THE NAVIGATOR CLASS USING THE .of() METHOD
                  //USE THE .push(); METHOD
                  //PASSED IN THE MaterialPageRoute TO IT
                  //WHICH TOOK IN A BUILDER THAT RETURNS THE DIARY PAGE
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ViewPost(postID, locationController.text, captionController.text),
                    ),
                  );
                },
                color: Colors.deepPurple[300],
                child: Text(
                  'View Posts in the area',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                  ),
                ),
                splashColor: Colors.purple,
              ),

        ],
      ),
    );
  }
}



//
///
////
/////
//////
// VIEW POST CLASS

class ViewPost extends StatefulWidget {
  //const ViewPost({Key? key}) : super(key: key);

  final String postID;
  final String location;
  final String caption;

  ViewPost(
    this.postID,
    this.location,
    this.caption,
  );

  factory ViewPost.fromDocument(DocumentSnapshot doc){
    return ViewPost(doc['postID'], doc['location'], doc['caption']);
  }


  @override
  _ViewPostState createState() => _ViewPostState(this.postID, this.location, this.caption);

  
}

class _ViewPostState extends State<ViewPost> {
  
  List<ViewPost> posts = [];

  @override
  void initState(){
    getPosts();
    super.initState();
  }

  getPosts() async{
    QuerySnapshot snapshot = await postRef
    .orderBy('timestamp', descending: true)
    .get();

    setState(() {
      posts = snapshot.docs.map((doc) => ViewPost.fromDocument(doc)).toList();
    });
    // .get().then((QuerySnapshot snapshot){
    //   snapshot.docs.forEach((DocumentSnapshot docOB){
    //     print(docOB.data);
    //     print(docOB.id);
    //     print(docOB.exists);
    //   });
    // });
  }

  final String postID;
  final String location;
  final String caption;

  _ViewPostState(
    this.postID,
    this.location,
    this.caption,
  );

  buildPost(){
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10),),
            Expanded(child: Text(caption)),
            ListTile(subtitle: Text(location)),
          ],
        ),
      ],
    );
  }

  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View Post')),
      //Button at the bottom right corner of screen
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //GO BACK TO HOME PAGE/MyApp
          //OBTAIN AN INSTANCE OF THE NAVIGATOR CLASS USING THE .of() METHOD
          //USE THE .pop(); METHOD
          //PASSED IN THE MaterialPageRoute TO IT
          //WHICH TOOK IN A BUILDER THAT RETURNS THE DIARY PAGE
          Navigator.of(context).pop();
        },
        child: Icon(Icons.home),
        splashColor: Colors.purple,
      ), // This trailing comma makes auto-formatting nicer for build methods.

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        //THE CHILDREN PROPERTY IS A LIST[] OF WIDGETS
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(10.0),
            child: Image(image: AssetImage('assets/CNote-InApp-Logo.png')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[],
          ),
          buildPost(),
          Divider(),
        ],
      ),
    );
  }


}

//
///
////
/////
//////
// DIARY CLASS

class Diary extends StatelessWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Diary')),
      //Button at the bottom right corner of screen
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //GO BACK TO HOME PAGE/MyApp
          //OBTAIN AN INSTANCE OF THE NAVIGATOR CLASS USING THE .of() METHOD
          //USE THE .pop(); METHOD
          //PASSED IN THE MaterialPageRoute TO IT
          //WHICH TOOK IN A BUILDER THAT RETURNS THE DIARY PAGE
          Navigator.of(context).pop();
        },
        child: Icon(Icons.home),
        splashColor: Colors.purple,
      ), // This trailing comma makes auto-formatting nicer for build methods.

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        //THE CHILDREN PROPERTY IS A LIST[] OF WIDGETS
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(10.0),
            child: Image(image: AssetImage('assets/CNote-InApp-Logo.png')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[],
          ),
        ],
      ),
    );
  }
}

//
///
////
/////
//////
//EMERGENCY CLASS

class Emergency extends StatelessWidget {
  const Emergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Emergency')),
      //Button at the bottom right corner of screen
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //GO BACK TO HOME PAGE/MyApp
          //OBTAIN AN INSTANCE OF THE NAVIGATOR CLASS USING THE .of() METHOD
          //USE THE .pop(); METHOD
          //PASSED IN THE MaterialPageRoute TO IT
          //WHICH TOOK IN A BUILDER THAT RETURNS THE DIARY PAGE
          Navigator.of(context).pop();
        },
        child: Icon(Icons.home),
        splashColor: Colors.purple,
      ), // This trailing comma makes auto-formatting nicer for build methods.

      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        //THE CHILDREN PROPERTY IS A LIST[] OF WIDGETS
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.all(10.0),
            child: Image(image: AssetImage('assets/CNote-InApp-Logo.png')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[],
          ),
        ],
      ),
    );
  }
}

//
///
////
/////
//////

//////////////////////////////