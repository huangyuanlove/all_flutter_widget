import 'package:flutter/material.dart';
import 'package:flutter_widget/widget_test/bloc/count_bloc.dart';
class CounterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = CountBLoC();

    return Scaffold(
      appBar: AppBar(
        title: Text('Top Page'),
      ),


      body: Center(
        child: StreamBuilder<int>(
            stream: bloc.stream,
            initialData: bloc.value,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text(
                'You hit me: ${snapshot.data} times',
                style: Theme.of(context).textTheme.display1,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => bloc.increment(),
        child: Icon(Icons.add),
      ),
    );
  }
}
