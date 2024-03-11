import 'package:flutter/material.dart';
import 'package:flutter_widget/simple_widget/list_view/elasticity_fix_header.dart';
import 'package:flutter_widget/simple_widget/list_view/fix_header_with_sliver_persistent_header.dart';

class FixHeaderListView extends StatelessWidget {
  const FixHeaderListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FixHeaderListView"),
      ),
      body: Wrap(
        children: [
          TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return FixHeaderWithSliverPersistentHeader();
                }));
              },
              child: Text("SliverPersistentHeader")),
          TextButton(
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blueAccent),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return ElasticityFixHeader();
                }));
              },
              child: Text("ElasticityFixHeader")),
        ],
      ),
    );
  }
}
