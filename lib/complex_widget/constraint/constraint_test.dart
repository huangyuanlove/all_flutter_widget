import 'package:flutter/material.dart';
import 'package:flutter_widget/logger.dart';
import 'package:flutter_widget/complex_widget/constraint/constraint_interesting.dart';

class ConstraintTestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("约束"),
      ),

      // body: _buildTest(),
      body: Column(
        children: [
          LoopWidgetWithStretch(),
          SizedBox(
            height: 60,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  width: 100,
                  child: ColoredBox(
                    color: Colors.black,
                  ),
                ),
                Flexible(
                    child: ColoredBox(
                        color: Colors.amber,
                        child: Text(
                            "23123123123123122312312312231231231223123123123123123123"))),
                SizedBox(
                  width: 100,
                  child: ColoredBox(
                    color: Colors.black12,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ConstraintInteresting();
          }));
        },
        child: Icon(Icons.ac_unit),
      ),
    );
  }

  Widget _buildTest() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
            width: 100,
            child: ColoredBox(
              color: Colors.redAccent,
            )),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: ColoredBox(color: Colors.blueAccent)),
              Expanded(child: ColoredBox(color: Colors.greenAccent)),
              Expanded(child: ColoredBox(color: Colors.yellowAccent)),
            ],
          ),
        ),
        SizedBox(width: 100, child: ColoredBox(color: Colors.black12)),
      ],
    );
  }

  Widget _buildByLayout(Widget child) {
    return LayoutBuilder(builder: (context, constraint) {
      print(constraint);
      logger.d(constraint);

      return child;
    });
  }
}

class LoopWidgetWithStretch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 320,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 100,
            child: ColoredBox(
              color: Colors.red,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 100,
                child: ColoredBox(
                  color: Colors.lightGreen,
                ),
              ),
              Expanded(
                  child: SizedBox(
                      child: ColoredBox(
                color: Colors.amberAccent,
              ))),
              SizedBox(
                height: 100,
                child: ColoredBox(
                  color: Colors.cyanAccent,
                ),
              )
            ],
          )),
          SizedBox(
            width: 100,
            child: ColoredBox(
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class LoopWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          height: double.infinity,
          child: ColoredBox(
            color: Colors.red,
          ),
        ),
        Expanded(
            child: Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ColoredBox(
                color: Colors.lightGreen,
              ),
            ),
            Expanded(
                child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: ColoredBox(
                      color: Colors.amberAccent,
                    ))),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ColoredBox(
                color: Colors.cyanAccent,
              ),
            )
          ],
        )),
        SizedBox(
          width: 100,
          height: double.infinity,
          child: ColoredBox(
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

// CustomSingleChildLayout

class DIYSingleChildLayoutDelegate extends SingleChildLayoutDelegate {
  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return false;
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return BoxConstraints.tight(const Size(100, 100));
  }
}
