import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:outclassv3/Services/authentication.dart';
import 'package:outclassv3/Services/colorses.dart';

var fontStyle = TextStyle(color: color2, fontFamily: 'Roboto1');
var fontStyle2 =
    TextStyle(color: color3, fontSize: 15.0, fontFamily: 'Roboto1');
dynamic branch, role;

class RegisterForm extends StatelessWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: AppBar(
            centerTitle: true,
            backgroundColor: appBarBackground,
            bottom: PreferredSize(
                child: Container(
                  color: color1,
                  height: 4.0,
                ),
                preferredSize: const Size.fromHeight(2.0)),

            //  centerTitle: true,
            title: Text(
              'REGISTRATION',
              style: TextStyle(
                  letterSpacing: 5,
                  color: color2,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Girassol',
                  fontSize: 25),
            ),
          ),
        ),
        body: const Register(),
      ),
    );
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> regKey = GlobalKey<FormState>();

  //variables to retrieve data
  TextEditingController fullName = TextEditingController();
  TextEditingController rollNo = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController coPassword = TextEditingController();
  List listItem = ['CS', 'ME', 'CE', 'EC'];
  List typeList = ['STUD', 'TECH', 'ADMIN'];

//variables----------------

  _handleRegister() {
    if (password.text != coPassword.text) {
      // print('password Error');
    } else {
      String uid = role + branch + rollNo.text;
      Map<String, dynamic> data1 = {"email": email.text, "role": role};
      Map<String, dynamic> data2 = {
        "Branch": branch,
        "Id Number": rollNo.text,
        "E-Mail": email.text,
        "Name": fullName.text,
        "role": role
      };

      auth
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text)
          .then((value) {
        store.collection("Users").doc(auth.currentUser!.uid).set(data2);
        store.collection("Authenticator").doc(uid).set(data1);
        auth.currentUser!.updateDisplayName(fullName.text);
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 35),
        child: Center(
          child: Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                    controller: fullName,
                    cursorColor: color2,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: color2),
                    //  autofocus:true,
                    autocorrect: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: color1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0))),
                        labelText: 'Name',
                        //labelStyle: TextStyle(color: color2,fontSize: 15.0),
                        labelStyle: fontStyle,
                        hintText: '  Name',
                        hintStyle: fontStyle2,
                        filled: true,
                        //enabled: true,
                        //fillColor: Colors.grey,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: color1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25.0))),
                        prefixIcon: Icon(
                          Icons.person_outline_rounded,
                          size: 22.0,
                          color: color1,
                        )),
                    validator: RequiredValidator(errorText: 'Required')),
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                    controller: email,
                    cursorColor: color2,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: color2),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: color1),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15.0))),
                        hintText: "  Email ",
                        labelText: "Email",
                        hintStyle: fontStyle2,
                        //  labelStyle: TextStyle(color: color2,fontFamily: 'Roboto1'),
                        labelStyle: fontStyle,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: color1,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(25.0))),
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          size: 22.0,
                          color: color1,
                        )),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Required'),
                      EmailValidator(errorText: 'Not valid'),
                    ])),
                const SizedBox(
                  height: 30.0,
                ),
                Container(
                  padding: const EdgeInsets.all(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: DropdownButton(
                          dropdownColor: backgroundColor,
                          isExpanded: true,
                          hint: Text(' Branch', style: fontStyle),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: color1,
                          ),
                          iconSize: 30,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                          elevation: 10,
                          value: branch,
                          onChanged: (newValue) {
                            setState(() {
                              branch = newValue.toString();
                            });
                          },
                          items: listItem.map((valueItem) {
                            return DropdownMenuItem(
                                value: valueItem, child: Text(valueItem));
                          }).toList(),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: DropdownButton(
                          dropdownColor: backgroundColor,
                          isExpanded: true,
                          hint: Text('Category', style: fontStyle),
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: color1,
                          ),
                          iconSize: 35,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'OpenSans',
                          ),
                          elevation: 10,
                          value: role,
                          onChanged: (newValue) {
                            setState(() {
                              role = newValue.toString();
                            });
                          },
                          items: typeList.map((valueItem) {
                            return DropdownMenuItem(
                                value: valueItem, child: Text(valueItem));
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: rollNo,
                  cursorColor: color2,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: color2),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: color1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0))),
                      hintText: "   Enrollment No.",
                      labelText: "Enroll no.",
                      labelStyle: fontStyle,
                      hintStyle: fontStyle2,
                      // labelStyle: TextStyle(color: color2),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: color1,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25.0))),
                      prefixIcon: Icon(
                        Icons.call_sharp,
                        size: 22.0,
                        color: color1,
                      )),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Required';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: password,
                  obscureText: true,
                  cursorColor: color2,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: color2),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: color1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0))),
                      hintText: "  Password",
                      labelText: "Password",
                      hintStyle: fontStyle2,
                      //  labelStyle: TextStyle(color: color2),
                      labelStyle: fontStyle,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: color1,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25.0))),
                      prefixIcon: Icon(
                        Icons.lock_open_sharp,
                        size: 22.0,
                        color: color1,
                      )),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Required'),
                    MinLengthValidator(6, errorText: 'More then six char')
                  ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: coPassword,
                  obscureText: false,
                  cursorColor: color2,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: color2),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: color1),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0))),
                      hintText: "  Confirm Password",
                      labelText: " Confirm Password",
                      hintStyle: fontStyle2,
                      //labelStyle: TextStyle(color: color2),
                      labelStyle: fontStyle,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: color1,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25.0))),
                      prefixIcon: Icon(
                        Icons.phone_locked_sharp,
                        size: 22.0,
                        color: color1,
                      )),
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Required'),
                    MinLengthValidator(6, errorText: 'More then six char')
                  ]),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                ElevatedButton(
                    onPressed: _handleRegister,
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      side: BorderSide(
                          color: color3, style: BorderStyle.solid, width: 0.5),
                      primary: buttonLogin,
                      // shadowColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                    ),
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                          color: buttonText,
                          fontSize: 25,
                          fontFamily: 'Girassol',
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
