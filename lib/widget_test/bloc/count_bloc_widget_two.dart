import 'package:flutter/material.dart';
import 'count_bloc.dart';
import 'bloc_base.dart';

class CountBLoCWidgetTwo extends StatefulWidget {
  @override
  _CountBLoCWidgetState createState() => _CountBLoCWidgetState();
}

class _CountBLoCWidgetState extends State<CountBLoCWidgetTwo> {
//  CountBLoC countBLoC = CountBLoC();
  CountBLoC countBLoC ;
  @override
  Widget build(BuildContext context) {
    countBLoC = BLoCProvider.of<CountBLoC>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("count page two"),
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

            RaisedButton(onPressed: (){},child: Icon(Icons.navigate_next),)


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
//    countBLoC.dispose();

  }
}
