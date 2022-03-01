
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:outclassv3/CommonPage/multi_dashboard.dart';
import 'package:outclassv3/Services/authentication.dart';
import 'package:outclassv3/Services/colorses.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

// variables ==============================================
var fontStyle1 = TextStyle(color: color2, fontFamily: 'Roboto1');
var fontStyle2 =TextStyle(color: color3, fontSize: 15.0, fontFamily: 'Roboto1');
//controller variables
TextEditingController uid = TextEditingController();
TextEditingController password = TextEditingController();
late String email;
//variables====================================================


class _LoginState extends State<Login> {
  GlobalKey<FormState> log1key = GlobalKey<FormState>();
  GlobalKey<FormState> log2key = GlobalKey<FormState>();

  void validate() {
    if (log1key.currentState!.validate()) {
    //  print('ok');
    } else {
    //  print('error');
    }
  }

  bool visible = true;

  void toogle() {
    visible = !visible;
    setState(() {});
  }

  _handleLogin() {
    store
        .collection('Authenticator')
        .doc(uid.text)
        .get()
        .then((DocumentSnapshot dsr) => email = dsr.get('email'));
    auth.signInWithEmailAndPassword(email: email, password: password.text).then((value) {
      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) =>  Dashboard()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60.0),
            child: AppBar(
              centerTitle: true,
              backgroundColor: const Color(0xFF171717),
              bottom: PreferredSize(
                  child: Container(
                    color: color1,
                    height: 4.0,
                  ),
                  preferredSize: const Size.fromHeight(2.0)),

              //  centerTitle: true,
              title: Text(
                'WELCOME',
                style: TextStyle(
                    letterSpacing: 25,
                    color: color2,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'Girassol'),
              ),
              // elevation: 0.0,
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                  Container(
                  height: 450,
                  width: 350,
                    decoration: const BoxDecoration(
                        color:Colors.white10,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                              color:Colors.black,
                              offset: Offset(1,1),
                              blurRadius: 2
                          )
                        ]
                    ),
                  child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                        Image.asset('assets/images/login.png',
                        height: 120,
                        width: 150,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          key: log1key,
                          controller: uid,
                          cursorColor: color2,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: color2),
                          //  autofocus:true,
                          autocorrect: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: color1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0))),
                              labelText: 'User',
                              labelStyle:
                              TextStyle(color: color2, fontSize: 20.0),
                              hintText: ' USER ID',
                              hintStyle: fontStyle2,
                              filled: true,
                              //enabled: true,
                              focusColor: const Color(0xFF343434),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: color1),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25.0))),
                              prefixIcon: Icon(
                                Icons.person_outline_rounded,
                                size: 22.0,
                                color: color1,
                              )),
                          validator:
                          RequiredValidator(errorText: 'Required')),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: password,
                        key: log2key,
                        cursorColor: color2,
                        keyboardType: TextInputType.text,
                        style: TextStyle(color: color2),
                        //  autofocus:true,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle:
                            TextStyle(color: color2, fontSize: 15.0),
                            hintText: '  PASSWORD',
                            hintStyle: fontStyle2,
                            filled: true,
                            //enabled: true,
                            //fillColor: Color(0xDD242222),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: color1),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: color1),
                                borderRadius:
                                const BorderRadius.all(Radius.circular(25.0))),
                            suffixIcon: InkWell(
                                onTap: toogle,
                                child: Icon(
                                  visible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: color1,
                                )),
                            prefixIcon: Icon(
                              Icons.lock_outline_sharp,
                              size: 22.0,
                              color: color1,
                            )),
                        obscureText: visible,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'Required'),
                          MinLengthValidator(6,
                              errorText: 'More then six char')
                        ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Forget password ? ',
                            style: TextStyle(
                                color: color2,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                                fontFamily: 'Raleway'),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),


                      // ====================button =================================================================


                      ElevatedButton(
                          onPressed: _handleLogin,
                          style: ElevatedButton.styleFrom(
                            elevation: 5,
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  side: BorderSide(
                      color: color3,
                      style: BorderStyle.solid,
                      width: 0.5),
                  primary: buttonLogin,
                  // shadowColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15),
                ),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                      color: buttonText ,
                      fontSize: 25,
                      fontFamily: 'Girassol',
                      fontWeight: FontWeight.bold),
                )),
            ],
          ),
        ),
      ),
      ],
      ),
      ),
      ),

   
      ),
    );
    }
}
