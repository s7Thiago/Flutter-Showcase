import 'package:flutter/material.dart';
import 'package:my_flutter_showcase/screens/sign_up_design/Field.dart';

class SignUpDesignMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff60AFE8),
        scaffoldBackgroundColor: Color(0xffF3F8FB),
      ),
      home: Scaffold(
        body: Form(),
      ),
    );
  }
}

class Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Align(
            alignment: Alignment.topRight,
            child: Header(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Footer(),
          ),
        ),
        FormFields(),
      ],
    );
  }
}

class FormFields extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Field(
            hint: "   Username",
            spaceTop: true,
          ),
          Field(
            hint: "   Full name",
            spaceTop: true,
          ),
          Field(
            hint: "   E-mail",
            spaceTop: true,
          ),
          Field(
            hint: "   Password",
            spaceTop: true,
          ),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              value: true,
              onChanged: (value) {},
            ),
            Text(
              "Agree with",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("Terms & Conditions")
          ],
        ),
        SizedBox(
          height: 100,
        ),
        CustomButton(),
        SizedBox(
          height: 20,
        ),
        Text("I'm already a member")
      ],
    );
  }
}

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text("Sign up"),
        Text("Sign in"),
      ],
    );
  }
}

class CustomButton extends StatefulWidget {
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool hovered = false;

  bool hover() {
    setState(() {
      hovered = !hovered;
    });
    return hovered;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      color: Color(0xff0A5AD6),
      type: MaterialType.button,
      elevation: hover() ? 2 : 5,
      shadowColor: Colors.black,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        splashColor: Colors.blueGrey,
        onTap: () {},
        onHover: (hovered) {},
        enableFeedback: true,
        child: Container(
          width: 120,
          height: 42,
        ),
      ),
    );
  }
}
