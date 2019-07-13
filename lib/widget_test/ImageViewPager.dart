import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

class ImageViewPager extends StatefulWidget {
  @override
  ImageViewPagerState createState() => new ImageViewPagerState();
}

class ImageViewPagerState extends State<ImageViewPager>
    with AutomaticKeepAliveClientMixin {
  PageController pageController = PageController();

  var listImages = [
    'http://pic37.nipic.com/20140113/8800276_184927469000_2.png',
    'http://pic32.nipic.com/20130902/13395269_103525238102_2.jpg',
    'http://pic18.nipic.com/20120204/8339340_144203764154_2.jpg',
    'image/test.png'
  ];

  var descriptions = [
    '这是描述1',
    '这是描述2',
    '这是描述3',
    '这是描述4',
  ];
  Map<int, String> temp = new Map();
  FocusNode focusNode = FocusNode();
  bool isKeyboardVisible = false;

  KeyboardVisibilityNotification _keyboardVisibility =
      new KeyboardVisibilityNotification();
  int _keyboardVisibilitySubscriberId;

  @override
  void initState() {
    super.initState();
    print("init");
    pageController.addListener(() {
      isKeyboardVisible = false;
      focusNode.unfocus();
    });
    _keyboardVisibilitySubscriberId = _keyboardVisibility.addNewListener(
      onChange: (bool visible) {
        print("onChange-->${visible}");
        setState(() {
          isKeyboardVisible = visible;
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _keyboardVisibility.removeListener(_keyboardVisibilitySubscriberId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("病历本"),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
                return Text("delete");
              });

              var toastView = ToastView();
              toastView.overlayState = Overlay.of(context);
              toastView.overlayEntry = overlayEntry;
              toastView._show();
            },
            child: Icon(Icons.delete),
          ),
          GestureDetector(
            onTap: () {
              OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
                return Text("save");
              });

              var toastView = ToastView();
              toastView.overlayState = Overlay.of(context);
              toastView.overlayEntry = overlayEntry;
              toastView._show();
            },
            child: Icon(Icons.save),
          ),
        ],
      ),
      body: Center(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTapDown: (detail) => {focusNode.unfocus()},
          child: PageView.builder(
              controller: pageController,
              itemCount: listImages.length,
              itemBuilder: (BuildContext context, int index) {
                print("itemBuilder descriptions->${descriptions}");
                print("itemBuilder temp->${temp}");
                print("itemBuilder index->${index}");
                String inputText = (temp[index] == null || temp[index].isEmpty)
                    ? descriptions[index]
                    : temp[index];
                return Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    Center(
                      child: PhotoView(
                        imageProvider: index == 3
                            ? AssetImage(listImages[index])
                            : NetworkImage(listImages[index]),
                      ),
                    ),
                    Offstage(
                      offstage: isKeyboardVisible,
                      child: GestureDetector(
                        child: Container(
                          color: Colors.amber,
                          child: Padding(
                            padding: new EdgeInsets.all(15),
                            child: Row(
                              children: <Widget>[
                                Image.asset("image/pencil.png"),
                                Text(
                                  descriptions[index],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () => setState(() {
                              isKeyboardVisible = true;
                              FocusScope.of(context).requestFocus(focusNode);
                            }),
                      ),
                    ),
                    Offstage(
                      offstage: !isKeyboardVisible,
                      child: TextField(
                        textInputAction: TextInputAction.done,
                        focusNode: focusNode,
                        maxLines: 7,
                        minLines: 1,
                        autofocus: isKeyboardVisible && true,
                        onChanged: (text) {
                          temp[index] = text;
                          print("onTextFieldChanged->${temp}");
                        },
                        onSubmitted: (text) {
                          descriptions[index] = text;
                          print("点击了回车->${text}");
                          print("点击了回车 ->${descriptions}");
                          focusNode.unfocus();
                        },
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          contentPadding: EdgeInsets.all(4.0),
                          border: OutlineInputBorder(),
                        ),
                        controller:
                            TextEditingController.fromValue(TextEditingValue(
                                text: inputText,
                                selection: TextSelection.fromPosition(
                                  TextPosition(
                                      offset: inputText.length,
                                      affinity: TextAffinity.downstream),
                                ))),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class ToastView {
  OverlayEntry overlayEntry;
  OverlayState overlayState;
  bool dismissed = false;

  _show() async {
    overlayState.insert(overlayEntry);
    await Future.delayed(Duration(milliseconds: 3500));
    this.dismiss();
  }

  dismiss() async {
    if (dismissed) {
      return;
    }
    this.dismissed = true;
    overlayEntry?.remove();
  }
}
