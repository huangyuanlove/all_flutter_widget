import 'package:flutter/material.dart';
import 'count_bloc.dart';
import 'bloc_base.dart';
import 'count_bloc_widget_two.dart';
class CountBLoCWidget extends StatefulWidget {
  @override
  _CountBLoCWidgetState createState() => _CountBLoCWidgetState();
}

class _CountBLoCWidgetState extends State<CountBLoCWidget> {
  CountBLoC countBLoC=CountBLoC();
  @override
  Widget build(BuildContext context) {
    countBLoC = BLoCProvider.of<CountBLoC>(context);


    return Scaffold(
      appBar: AppBar(
        title: Text("count page one"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            StreamBuilder<int>(
              stream: countBLoC.stream,
              initialData: -1,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Center(
                  child: Text(snapshot.data.toString(),style: TextStyle(color: Colors.red,fontSize: 28.0),)
                );

              },
            ),

            RaisedButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                print(countBLoC.toString());
                return  BLoCProvider<CountBLoC>(
                  bloc: countBLoC,
                  child:  CountBLoCWidgetTwo(),
                );



              }));
            },child: Icon(Icons.navigate_next),)


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        countBLoC.increment();
      },child: Icon(Icons.add),),
    );
  }


  @override
  void dispose() {
    super.dispose();
    countBLoC.dispose();

  }
}
