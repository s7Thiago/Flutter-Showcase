import 'package:flutter/material.dart';
import 'package:my_flutter_showcase/screens/sign_up_design/Field.dart';
import 'package:my_flutter_showcase/screens/sign_up_design/form_clipper.dart';

class SignUpDesignMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

// * This widget gathers all of the structure of screen
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
        body: FormDecorated(),
        resizeToAvoidBottomInset:
            false, // ! The line prevents others widgets resizing when the keyboard is opened
      ),
    );
  }
}

// * Here, the Main form is cut to look like the model picture
class FormDecorated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Color(0xff0A5AD6),
          width: double.infinity,
          height: double.infinity,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: selectClipper(
              context,
              smallScreenHeightClipper: FormClipperSmall(),
              largeScreenHeightClipper: FormClipperLarge(),
            ),
            child: Container(
              color: Colors.blue,

              // ! choosing the height of the light blue wave according the screen size
              height: ((MediaQuery.of(context).size.height) < 700
                  ? MediaQuery.of(context).size.height * 0.92
                  : MediaQuery.of(context).size.height * 0.889),
              width: double.infinity,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: ClipPath(
            clipper: selectClipper(
              context,
              smallScreenHeightClipper: FormClipperSmall(),
              largeScreenHeightClipper: FormClipperLarge(),
            ),
            child: Form(),
          ),
        ),
      ],
    );
  }
}

// * Here, contains the high level structure of the form (Header, Form Fields, and Footer)
class Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      // ! Choosing the form height accordging the screen size
      height: (MediaQuery.of(context).size.height < 700
          ? MediaQuery.of(context).size.height * 0.87
          : MediaQuery.of(context).size.height * 0.86),
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 100, right: 50),
              child: Align(
                alignment: Alignment.topRight,
                child: Header(),
              ),
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
      ),
    );
  }
}

// * Here are the low level structure of the form fields
// ignore: must_be_immutable
class FormFields extends StatelessWidget {
  // * Controllers for form fields
  var userNameController = TextEditingController();
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // * focus nodes of form fields
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

// * The Footer Contains the checkbox, the Terms & Conditions Text, the Sign up Button and the text bellow of the Sign in button
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
        // * The Row bellow represents the Terms text and checkbox
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

        // * Defines an distance between the Sign in button and the Row above
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.015,
        ),

        // * Sign in button
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

// * The header contains the Sign up, and Sugn in navigation texts options
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
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Text(
            "Sign up",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Color(0xff0A58D2),
              fontSize: 20,
            ),
          ),
        ),
        Text(
          "Sign in",
          style: TextStyle(
              color: Color(
                0xff68A8D3,
              ),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

// Here are the base implementation of the Sign in Button
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
          width: 160,
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

CustomClipper<Path> selectClipper(BuildContext context,
        {CustomClipper<Path> smallScreenHeightClipper,
        CustomClipper<Path> largeScreenHeightClipper}) =>
    MediaQuery.of(context).size.height < 700
        ? smallScreenHeightClipper
        : largeScreenHeightClipper;
