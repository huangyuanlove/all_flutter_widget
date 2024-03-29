import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget/third_part/riverpod/async_notifier_provider_widget.dart';
import 'package:flutter_widget/third_part/riverpod/change_notifier_provider_widget.dart';
import 'package:flutter_widget/third_part/riverpod/future_provider_widget.dart';
import 'package:flutter_widget/third_part/riverpod/generator/riverpod_generator_widget.dart';
import 'package:flutter_widget/third_part/riverpod/notifier_provider_widget.dart';
import 'package:flutter_widget/third_part/riverpod/paged/riverpod_with_paged_list.dart';
import 'package:flutter_widget/third_part/riverpod/provider_widget.dart';
import 'package:flutter_widget/third_part/riverpod/provider_with_consumer.dart';
import 'package:flutter_widget/third_part/riverpod/provider_with_consumerStatefulWidget.dart';
import 'package:flutter_widget/third_part/riverpod/provider_with_consumer_widget.dart';
import 'package:flutter_widget/third_part/riverpod/riverpod_audodispose_widget.dart';
import 'package:flutter_widget/third_part/riverpod/riverpod_cache_widget.dart';
import 'package:flutter_widget/third_part/riverpod/riverpod_family_widget.dart';
import 'package:flutter_widget/third_part/riverpod/riverpod_log_widget.dart';
import 'package:flutter_widget/third_part/riverpod/riverpod_select_widget.dart';
import 'package:flutter_widget/third_part/riverpod/state_notifier_provider_widget.dart';
import 'package:flutter_widget/third_part/riverpod/state_provider_widget.dart';
import 'package:flutter_widget/third_part/riverpod/stream_provider_widget.dart';
import 'package:fluttertoast/fluttertoast.dart';

final helloWorldProvider = Provider((ref) => "Hello World");

class ReverpodWidget extends StatefulWidget {
  const ReverpodWidget({Key? key}) : super(key: key);

  @override
  State<ReverpodWidget> createState() => _ReverpodState();
}

class _ReverpodState extends State<ReverpodWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("riverpod demo"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return ProviderWithConsumerWidget();
                        }))
                      },
                  child: Text("Provider with ConsumerWidget")),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ProviderWithConsumer();
                        }))
                      },
                  child: Text("Provider with Consumer")),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return ProviderWithConsumerStatefulWidget();
                        }))
                      },
                  child: Text("Provider with ConsumerStatefulWidget")),
              Divider(),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return RiverpodSelectWidget();
                        }))
                      },
                  child: Text("Provider select")),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return RiverpodAutoDisposeWidget();
                        }))
                      },
                  child: Text("autoDispose修饰符")),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return RiverpodCacheWidget();
                        }))
                      },
                  child: Text("keepAlive and cache")),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return RiverpodFamilyWidget();
                        }))
                      },
                  child: Text("riverpod family")),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return RiverpodObserverLogWidget();
                        }))
                      },
                  child: Text("Observer Log")),
              Divider(),
              Text(
                "下面是八中不同的Provider，中划线是已经过时即将被弃用的",
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
              Divider(),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return ProviderWidget();
                        }))
                      },
                  child: Text(
                    "Provider",
                  )),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return StateProviderDemoWidget();
                        }))
                      },
                  child: Text(
                    "State Provider",
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  )),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return StateNotifierProviderWidget();
                        }))
                      },
                  child: Text(
                    "StateNotifier Provider",
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  )),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return FutureProviderWidget();
                        }))
                      },
                  child: Text("FutureProvider")),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return StreamProviderWidget();
                        }))
                      },
                  child: Text("StreamProvider")),
              ElevatedButton(
                  onPressed: () {
                        Fluttertoast.showToast(
                            msg: "不推荐使用，可用(Async)NotifierProvider代替");
                            Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return ChangeNotifierProviderWidget();
                            }));
                      },
                  child: Text(
                    "ChangeNotifierProvider",
                    style: TextStyle(decoration: TextDecoration.lineThrough),
                  )),
              ElevatedButton(
                  onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return CounterNotifierWidget();
                    }))
                  }, child: Text("NotifierProvider,代替 StateProvider 和 StateNotifierProvider")),
              ElevatedButton(
                  onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return AsyncNotifierProviderWidget();
                    }))
                  }, child: Text("AsyncNotifierProvider")),
              Divider(),
               ElevatedButton(
                  onPressed: () => {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return  RiverpodGeneratorWidget();
                    }))
                  }, child: Text(" RiverpodGeneratorWidget")),
             
              Divider(),
              ElevatedButton(
                  onPressed: () => {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return RiverPodWithPagedList();
                        }))
                      },
                  child: Text(
                    "分页示例",
                  )),
            ],
          ),
        ));
  }
}
