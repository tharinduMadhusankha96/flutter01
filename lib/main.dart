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
      home: Search(),
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
          onTap: (){Navigator.of(context)
              .push(MaterialPageRoute(
              builder: (context) =>Search()
          ));},
          child: Icon(
            Icons.menu
          ),
        ),
      ),
      body: ListPage(),
    );
  }

  }
 class Search extends StatefulWidget {
   @override
   _Search createState() => new _Search();
 }
 class _Search extends State<Search>{
  var queryResultSet =[];
  var tempSearchStore =[];

  initiateSearch(value){
    if(value.lenght == 0){
      setState((){
        queryResultSet = [];
        tempSearchStore = [];
      });
    }
    var capitalizedValue = value.substring(0,1).toUpperCase() + value.substring(1);
    if(queryResultSet.length == 0 && value.length == 1){
      SearchService().searchByName(value).then((QuerySnapshot docs){
        for(int i = 0; i < docs.documents.length; i++){
          queryResultSet.add(docs.documents[i].data);
        }
      });
    }
    else{
      tempSearchStore = [];
      queryResultSet.forEach((element){
        if(element['title'].startsWith(capitalizedValue)){
          setState((){
            tempSearchStore.add(element);
          });
        }
      });
    }
  }
  @override
   Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Search"),
      leading: GestureDetector(
        onTap: (){Navigator.of(context)
            .push(MaterialPageRoute(
            builder: (context) =>MyHomePage()
        ));},
        child: Icon(
          Icons.home
        ),
      ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (val){
                initiateSearch(val);
              },
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  color: Colors.black,
                  icon: Icon(Icons.arrow_back),
                  iconSize: 20.0,
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                ),
                contentPadding: EdgeInsets.only(left: 25.0),
                hintText: 'Search by name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0)
                )
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          GridView.count(
            padding: EdgeInsets.only(left: 10.0,right: 10.0),
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            primary: false,
            shrinkWrap: true,
            children: tempSearchStore.map((element){
              return buildResultCard(element);
            }).toList())
        ]));
  }
 }
 Widget buildResultCard(data){
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    elevation: 2.0,
    child: Container(
      child: Center(
        child: Text(data['title'],
        textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        )

      )
    )
  );
 }
class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future _data;
  Future getPosts() async{
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("doctors").getDocuments();
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
        child: ListTile(
          title: Text(widget.doctor.data["title"]),
          subtitle: Text(widget.doctor.data["content"]),
        ),
      ),
      ),
    );
  }
}

