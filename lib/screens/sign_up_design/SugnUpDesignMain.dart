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
        resizeToAvoidBottomInset: false,
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
        FormFields(),
        Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Footer(),
          ),
        ),
      ],
    );
  }
}

class FormFields extends StatelessWidget {
  //* Controllers for form fields
  var userNameController = TextEditingController();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  //*focus nodes of form fields
  final FocusNode usernameNode = FocusNode();
  final FocusNode fullNameNode = FocusNode();
  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Field(
            focusNode: usernameNode,
            textInputAction: TextInputAction.next,
            controller: userNameController,
            keyboardType: TextInputType.text,
            onFieldSubmitted: (term) {
              fieldFocusChange(context, usernameNode, fullNameNode);
            },
            hint: "   Username",
            spaceTop: true,
          ),
          Field(
            focusNode: fullNameNode,
            textInputAction: TextInputAction.next,
            controller: fullNameController,
            keyboardType: TextInputType.text,
            onFieldSubmitted: (term) {
              fieldFocusChange(context, fullNameNode, emailNode);
            },
            hint: "   Full name",
            spaceTop: true,
          ),
          Field(
            focusNode: emailNode,
            textInputAction: TextInputAction.next,
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            onFieldSubmitted: (term) {
              fieldFocusChange(context, emailNode, passwordNode);
            },
            hint: "   E-mail",
            spaceTop: true,
          ),
          Field(
            focusNode: passwordNode,
            hint: "   Password",
            textInputAction: TextInputAction.done,
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            onFieldSubmitted: (term) {
              passwordNode.unfocus();
            },
            spaceTop: true,
          ),
        ],
      ),
    );
  }

  static fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool accepted = false;

  _switchAccepted() {
    setState(() {
      accepted = !accepted;
    });
  }

  @override
  build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              tristate: true,
              value: accepted,
              onChanged: (value) {
                _switchAccepted();
              },
            ),
            Text(
              "Agree with",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Color(0xff0A58D2),
              ),
            ),
            Text(
              "Terms & Conditions",
              style: TextStyle(
                  color: Color(
                    0xff68A8D3,
                  ),
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        SizedBox(
          height: 100,
        ),
        CustomButton(
          content: "Sign up",
        ),
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
        Text(
          "Sign up",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Color(0xff0A58D2),
          ),
        ),
        Text(
          "Sign in",
          style: TextStyle(
              color: Color(
                0xff68A8D3,
              ),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class CustomButton extends StatefulWidget {
  final String content;

  const CustomButton({Key key, this.content = "Button"}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState(content: content);
}

class _CustomButtonState extends State<CustomButton> {
  final String content;
  bool hovered = false;

  _CustomButtonState({this.content});

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
      elevation: hovered ? 8 : 2,
      shadowColor: Colors.black,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        splashColor: Colors.blueGrey,
        onTap: () {
          hover();
        },
        enableFeedback: true,
        child: Container(
          width: 120,
          height: 42,
          child: Center(
              child: Text(
            content,
            style: TextStyle(color: Colors.white),
          )),
          decoration: BoxDecoration(),
        ),
      ),
    );
  }
}
