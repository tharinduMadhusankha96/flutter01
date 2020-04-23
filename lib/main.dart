import 'package:ctse02/searchservice.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: View(),
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
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Doctor Detail List"),
        leading: GestureDetector(
          onTap: (){
          },
          child: Icon(
            Icons.menu
          ),
        ),
      ),
      body: Cardiologists(),
    );
  }

  }
class MyHomePage1 extends StatefulWidget {
  MyHomePage1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState1 createState() => _MyHomePageState1();
}

class _MyHomePageState1 extends State<MyHomePage1> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Name of the Doctors"),
        leading: GestureDetector(
          onTap: (){
          },
          child: Icon(
              Icons.menu
          ),
        ),
      ),
      body: Cardiologists(),
    );
  }

}
class MyHomePage2 extends StatefulWidget {
  MyHomePage2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState2 createState() => _MyHomePageState2();
}

class _MyHomePageState2 extends State<MyHomePage2> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Name of the Doctors"),
        leading: GestureDetector(
          onTap: (){
          },
          child: Icon(
              Icons.menu
          ),
        ),
      ),
      body: Gastroenterologists(),
    );
  }

}
class MyHomePage3 extends StatefulWidget {
  MyHomePage3({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState3 createState() =>  _MyHomePageState3();
}

class  _MyHomePageState3 extends State<MyHomePage3> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Name of the Doctors"),
        leading: GestureDetector(
          onTap: (){
          },
          child: Icon(
              Icons.menu
          ),
        ),
      ),
      body: FamilyPhysicians(),
    );
  }

}
class MyHomePage4 extends StatefulWidget {
  MyHomePage4({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState4 createState() =>  _MyHomePageState4();
}

class  _MyHomePageState4 extends State<MyHomePage4> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Name of the Doctors"),
        leading: GestureDetector(
          onTap: (){
          },
          child: Icon(
              Icons.menu
          ),
        ),
      ),
      body: Endocrinologists(),
    );
  }
}
class MyHomePage5 extends StatefulWidget {
  MyHomePage5({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState5 createState() =>  _MyHomePageState5();
}

class  _MyHomePageState5 extends State<MyHomePage5> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Name of the Doctors"),
        leading: GestureDetector(
          onTap: (){
          },
          child: Icon(
              Icons.menu
          ),
        ),
      ),
      body: Dermatologists(),
    );
  }
}

class Cardiologists extends StatefulWidget {
  @override
  _CardiologistsState createState() => _CardiologistsState();
}

class _CardiologistsState extends State<Cardiologists> {
  Future _data;
  Future getPosts() async{
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("doctors").where("set",isEqualTo: "Cardiologists").getDocuments();
    return qn.documents;
  }
  navigateToDetail(DocumentSnapshot doctor){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(doctor: doctor,)));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = getPosts();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: _data,
        builder: (_,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text("Loading.."),
            );
          } else {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  return ListTile(

                    title: Text(snapshot.data[index].data["title"]),
                    onTap: () => navigateToDetail(snapshot.data[index]),

                  );

                });
          }
        }),
    );
  }
}
class Gastroenterologists extends StatefulWidget {
  @override
  _GastroenterologistsState createState() => _GastroenterologistsState();
}

class _GastroenterologistsState extends State<Gastroenterologists> {
  Future _data;
  Future getPosts() async{
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("doctors").where("set",isEqualTo: "Gastroenterologists").getDocuments();
    return qn.documents;
  }
  navigateToDetail(DocumentSnapshot doctor){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(doctor: doctor,)));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = getPosts();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: _data,
          builder: (_,snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading.."),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return ListTile(

                      title: Text(snapshot.data[index].data["title"]),
                      onTap: () => navigateToDetail(snapshot.data[index]),

                    );

                  });
            }
          }),
    );
  }
}

class FamilyPhysicians extends StatefulWidget {
  @override
  _FamilyPhysiciansState createState() => _FamilyPhysiciansState();
}

class _FamilyPhysiciansState extends State<FamilyPhysicians> {
  Future _data;
  Future getPosts() async{
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("doctors").where("set",isEqualTo: "Family Physicians").getDocuments();
    return qn.documents;
  }
  navigateToDetail(DocumentSnapshot doctor){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(doctor: doctor,)));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = getPosts();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: _data,
          builder: (_,snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading.."),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return ListTile(

                      title: Text(snapshot.data[index].data["title"]),
                      onTap: () => navigateToDetail(snapshot.data[index]),

                    );

                  });
            }
          }),
    );
  }
}
class Endocrinologists extends StatefulWidget {
  @override
  _EndocrinologistsState createState() =>  _EndocrinologistsState();
}

class  _EndocrinologistsState extends State<Endocrinologists> {
  Future _data;
  Future getPosts() async{
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("doctors").where("set",isEqualTo: "Endocrinologists").getDocuments();
    return qn.documents;
  }
  navigateToDetail(DocumentSnapshot doctor){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(doctor: doctor,)));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = getPosts();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: _data,
          builder: (_,snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading.."),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return ListTile(

                      title: Text(snapshot.data[index].data["title"]),
                      onTap: () => navigateToDetail(snapshot.data[index]),

                    );

                  });
            }
          }),
    );
  }
}

class Dermatologists extends StatefulWidget {
  @override
  _DermatologistsState createState() =>  _DermatologistsState();
}

class  _DermatologistsState extends State<Dermatologists> {
  Future _data;
  Future getPosts() async{
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("doctors").where("set",isEqualTo: "Dermatologists").getDocuments();
    return qn.documents;
  }
  navigateToDetail(DocumentSnapshot doctor){
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(doctor: doctor,)));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _data = getPosts();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
          future: _data,
          builder: (_,snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Text("Loading.."),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return ListTile(

                      title: Text(snapshot.data[index].data["title"]),
                      onTap: () => navigateToDetail(snapshot.data[index]),

                    );

                  });
            }
          }),
    );
  }
}

class DetailPage extends StatefulWidget {

  final DocumentSnapshot doctor;
  DetailPage({this.doctor});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.doctor.data["title"]),
      ),
      body: Container(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            Text("Specilization :" + widget.doctor.data["set"]),
            Text("Hospital :" + widget.doctor.data["Hospital"]),
            Text("Details :" + widget.doctor.data["content"]),
          ],
        ),

      ),
      ),
    );
  }
}

class View extends StatefulWidget {
  View({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ViewState createState() => _ViewState();

}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Specializations"),
        leading: GestureDetector(
          onTap: (){

          },
          child: Icon(
              Icons.menu
          ),
        ),
      ),
     body: Center(
       child: Column(
         mainAxisSize: MainAxisSize.min,
         children: <Widget>[
           const SizedBox(height: 30),
              RaisedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage1()),);
                },
                child: const Text(
                    'Cardiologists',
                style: TextStyle(fontSize: 20),
                ),
              ),
           const SizedBox(height: 30,width: 80),
              RaisedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage3()),);
                },
                child: const Text(
                  'Family Physicians',
                 style: TextStyle(fontSize: 20),
                ),
              ),
           const SizedBox(height: 30,width: 80),
           RaisedButton(
             onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage5()),);
             },
             child: const Text(
               'Dermatologists',
               style: TextStyle(fontSize: 20),
             ),
           ),
           const SizedBox(height: 30,width: 80),
           RaisedButton(
             onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage4()),);
             },
             child: const Text(
               'Endocrinologists',
               style: TextStyle(fontSize: 20),
             ),
           ),
           const SizedBox(height: 30,width: 80),
           RaisedButton(
             onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage2()),);
             },
             child: const Text(
               'Gastroenterologists',
               style: TextStyle(fontSize: 20),
             ),
           )
         ],
       ),
     ),
    );
  }
}


