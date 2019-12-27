import 'package:flutter/material.dart';

class AnimationExample1 extends StatefulWidget {
  @override
  _AnimationExample1State createState() => _AnimationExample1State();
}

class _AnimationExample1State extends State<AnimationExample1> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Animation"),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black54,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLoading = !isLoading;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                        color: isLoading ? Colors.white : Color(0xFF3F7255),
                        borderRadius:
                            BorderRadius.circular(isLoading ? 25 : 10)),
                    width: isLoading
                        ? 50
                        : MediaQuery.of(context).size.width * 0.65,
                    height: isLoading
                        ? 50
                        : MediaQuery.of(context).size.height * 0.09,
                    child: AnimatedCrossFade(
                      duration: Duration(milliseconds: 250),
                      firstChild: Center(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.cyan),
                        ),
                      ),
                      secondChild: Center(
                        child: Text(
                          'Pressione',
                          style: TextStyle(fontSize: isLoading ? 50 : 45),
                        ),
                      ),
                      crossFadeState: isLoading
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
