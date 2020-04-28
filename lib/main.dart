import 'package:ctse02/searchservice.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image/image.dart';
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
        backgroundColor: Colors.indigoAccent,
        leading: GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context)=>MyApp()
                ));
          },
          child: Icon(
              Icons.arrow_back
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
        backgroundColor: Colors.indigoAccent,
        leading: GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context)=>MyApp()
                ));
          },
          child: Icon(
              Icons.arrow_back
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
        backgroundColor: Colors.indigoAccent,
        leading: GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context)=>MyApp()
                ));
          },
          child: Icon(
              Icons.arrow_back
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
        backgroundColor: Colors.indigoAccent,
        leading: GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context)=>MyApp()
                ));
          },
          child: Icon(
              Icons.arrow_back
          ),
        ),
      ),
      body: Endocrinologists(),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  return new Scaffold(
    appBar: new AppBar(
      title: new Text("Name of the Doctors"),
      backgroundColor: Colors.indigoAccent,
      leading: GestureDetector(
        onTap: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context)=>MyApp()
              ));
        },
        child: Icon(
            Icons.arrow_back
        ),
      ),
    ),
    body: Psychiatrist(),
  );
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
        backgroundColor: Colors.indigoAccent,
        leading: GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context)=>MyApp()
                ));
          },
          child: Icon(
              Icons.arrow_back
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
      color: Colors.black12,
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

                      title: Text(snapshot.data[index].data["title"],style: TextStyle(fontWeight:FontWeight.bold, fontSize:20 ),),
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
      color: Colors.black12,
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

                      title: Text(snapshot.data[index].data["title"],style: TextStyle(fontWeight:FontWeight.bold, fontSize:20 ),),
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
      color: Colors.black12,
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

                      title: Text(snapshot.data[index].data["title"],style: TextStyle(fontWeight:FontWeight.bold, fontSize:20 ),),
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
      color: Colors.black12,
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

                      title: Text(snapshot.data[index].data["title"],style: TextStyle(fontWeight:FontWeight.bold, fontSize:20 ),),
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
      color: Colors.black12,
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

                      title: Text(snapshot.data[index].data["title"],style: TextStyle(fontWeight:FontWeight.bold, fontSize:20 ),),
                      onTap: () => navigateToDetail(snapshot.data[index]),

                    );
                  });
            }
          }),
    );
  }
}

class Psychiatrist extends StatefulWidget {
  @override
  _PsychiatristState createState() =>  _PsychiatristState();
}

class  _PsychiatristState extends State<Psychiatrist> {
  Future _data;
  Future getPosts() async{
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("doctors").where("set",isEqualTo: "Psychiatrist").getDocuments();
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
      color: Colors.black12,
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

                      title: Text(snapshot.data[index].data["title"],style: TextStyle(fontWeight:FontWeight.bold, fontSize:20 ),),
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
        backgroundColor: Colors.indigoAccent,
      ),
      body: Container(
        color: Colors.white,

        child: Card(
          color: Colors.blueGrey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Text("Specilization :  " + widget.doctor.data["set"],style: TextStyle(fontWeight:FontWeight.bold, fontSize:20 ),),
              new Padding(padding: const EdgeInsets.all(10.0)),
              Text("Hospital          :  " + widget.doctor.data["Hospital"],style: TextStyle(fontWeight:FontWeight.bold, fontSize:20 ),),
              new Padding(padding: const EdgeInsets.all(10.0)),
              Text("Details             :  "+ widget.doctor.data["content"],style: TextStyle(fontWeight:FontWeight.bold, fontSize:20 ),),
              new Padding(padding: const EdgeInsets.all(10.0)),
              Text("About              :  ", style: TextStyle(fontWeight:FontWeight.bold, fontSize:20 ),),
              new Padding(padding: const EdgeInsets.all(10.0)),
              Text(                         "The doctor specialized in Cardiologist Specilization in North American CTSE University in USA 1987. Since doctors are responsible for their patients' well-being, this occupation is one of the most demanding than most. In addition to having a comprehensive knowledge of medicine, they need to be able to communicate their findings to patients who typically do not possess the same knowledge. They work with people when they are at their most vulnerable and this requires empathy in addition to the required technical knowledge.", style: TextStyle(fontWeight:FontWeight.normal, fontSize:20 ),),

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
        title: new Text("Specializations" ),
        backgroundColor: Colors.indigoAccent,
        leading: GestureDetector(
          onTap: (){

          },
          child: Icon(
              Icons.home
          ),
        ),
      ),
        body:  new Padding(
                padding: const EdgeInsets.all(20.0),
                child:new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[



                    new RaisedButton(
                      shape: StadiumBorder(),
                      color: Colors.grey[400],
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage1()),);
                      },
                      child: const Text(
                        'Cardiologists',

                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    new Padding(padding: const EdgeInsets.all(10.0)),

                    new RaisedButton(
                      shape: StadiumBorder(),
                      color: Colors.grey[400],
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage3()),);
                      },
                      child: const Text(
                        'Family Physicians',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    new Padding(padding: const EdgeInsets.all(10.0)),

                    new RaisedButton(
                      shape: StadiumBorder(),
                      color: Colors.grey[400],
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage5()),);
                      },
                      child: const Text(
                        'Dermatologists',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    new Padding(padding: const EdgeInsets.all(10.0)),

                    new RaisedButton(
                      shape: StadiumBorder(),
                      color: Colors.grey[400],
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage4()),);
                      },
                      child: const Text(
                        'Endocrinologists',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    new Padding(padding: const EdgeInsets.all(10.0)),
                    new RaisedButton(
                      shape: StadiumBorder(),
                      color: Colors.grey[400],
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage3()),);
                      },
                      child: const Text(
                        'Psychiatrist',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    new Padding(padding: const EdgeInsets.all(10.0)),
                    new RaisedButton(
                      shape: StadiumBorder(),
                      color: Colors.grey[400],
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage2()),);
                      },
                      child: new Text(
                        'Gastroenterologists',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    new Padding(padding: const EdgeInsets.all(10.0)),

                    new RaisedButton(
                      shape: RoundedRectangleBorder(),
                      color: Colors.indigoAccent,
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorDetails()),);
                      },
                      child: new Text(
                        'Add Doctor Details',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),



                    new Padding(padding: const EdgeInsets.all(10.0))

                  ],
                ),

              ),
            );

  }
}

class DoctorDetails extends StatefulWidget {
  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {

  String doctorName, doctorSpe, doctorHospital, doctorContent;

  getDoctorName(name){
    this.doctorName = name;
  }
  getDoctorSpe(specialization){
    this.doctorSpe = specialization;
  }
  getDoctorHospital(hospital){
    this.doctorHospital = hospital;
  }
  getDoctorContent(content){
    this.doctorContent = content;
  }
  createData(){
    DocumentReference documentReference =
    Firestore.instance.collection("doctors").document(doctorName);

    Map<String, dynamic> doctors = {
      "title" : doctorName,
      "set" : doctorSpe,
      "Hospital" : doctorHospital,
      "content" : doctorContent
    };
    documentReference.setData(doctors).whenComplete((){
      Fluttertoast.showToast(
          msg: "$doctorName Created",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );

    });
  }
  readData(){
    DocumentReference documentReference =
    Firestore.instance.collection("doctors").document(doctorName);
    documentReference.get().then((datasnapshot){
      print(datasnapshot.data["title"]);
      print(datasnapshot.data["set"]);
      print(datasnapshot.data["Hospital"]);
      print(datasnapshot.data["content"]);
    });
  }
  updateData(){
    DocumentReference documentReference =
    Firestore.instance.collection("doctors").document(doctorName);

    Map<String, dynamic> doctors = {
      "title" : doctorName,
      "set" : doctorSpe,
      "Hospital" : doctorHospital,
      "content" : doctorContent
    };
    documentReference.setData(doctors).whenComplete((){
      Fluttertoast.showToast(
          msg: "$doctorName Updated",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });
  }
  deleteData(){
    DocumentReference documentReference=
    Firestore.instance.collection("doctors").document(doctorName);

    documentReference.delete().whenComplete((){
      Fluttertoast.showToast(
          msg: "$doctorName Deleted",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Doctor Details"),
          backgroundColor: Colors.indigoAccent,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom:6.0),
                  child:TextFormField(
                    decoration: InputDecoration(
                      labelText: "Name",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigoAccent,
                              width: 2.0
                          )
                      ),
                    ),
                    onChanged: (String name){
                      getDoctorName(name);
                    },
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(bottom:6.0),
                  child:TextFormField(
                    decoration: InputDecoration(
                      labelText: "Specialization",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigoAccent,
                              width: 2.0
                          )
                      ),
                    ),
                    onChanged: (String specialization){
                      getDoctorSpe(specialization);

                    },
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(bottom:6.0),
                  child:TextFormField(
                    decoration: InputDecoration(
                      labelText: "Hospital",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigoAccent,
                              width: 2.0
                          )
                      ),
                    ),
                    onChanged: (String hospital){
                      getDoctorHospital(hospital);

                    },
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(bottom:6.0),
                  child:TextFormField(
                    decoration: InputDecoration(
                      labelText: "Content",
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.indigoAccent,
                              width: 2.0
                          )
                      ),
                    ),
                    onChanged: (String content){
                      getDoctorContent(content);

                    },
                  )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Text("ADD"),
                    textColor: Colors.white,
                    onPressed: (){
                      createData();
                    },
                  ),

                  RaisedButton(
                    color: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Text("UPDATE"),
                    textColor: Colors.white,
                    onPressed: (){
                      updateData();
                    },
                  ),
                  RaisedButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)
                    ),
                    child: Text("DELETE"),
                    textColor: Colors.white,
                    onPressed: (){
                      deleteData();
                    },
                  )
                ],
              ),

            ],
          ),
        ));

  }
}