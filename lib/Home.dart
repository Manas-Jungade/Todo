import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_docheck/Splash.dart';
import 'package:to_docheck/Todo.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool checkuser=false;
  late SharedPreferences logindata;

  TextEditingController username=new TextEditingController();
  TextEditingController password=new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_login();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [

             Container(
               height: MediaQuery.of(context).size.height,
               width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.orange),
              child: Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Container(

                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [


                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Column(
                          children: [
                            Image(image: AssetImage("assert/Todo.png"),width: 150,),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              controller: username,
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.verified_user,color: Colors.black,),
                                focusColor: Colors.black,
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2.5),borderRadius: BorderRadius.circular(20)),
                                labelText: "Username",
                                hintText: "Enter the Username",
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.black))
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextField(

                            controller: password,
                            decoration: InputDecoration(

                                focusColor: Colors.black,
                                suffixIcon: Icon(Icons.lock,color: Colors.black,),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red,width: 2.5),borderRadius: BorderRadius.circular(20)),
                              labelText: "Password",
                              hintText: "Enter the password",
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.black))

                            ),


                          ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: SizedBox(height: 30,
                            child: ElevatedButton(style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red),elevation: MaterialStateProperty.all(20),shadowColor: MaterialStateProperty.all(Colors.red)),
                                onPressed: ()async{
                              // if successfully loggined

                                  var sharedPref=await SharedPreferences.getInstance();
                                  sharedPref.setBool(SplashState.KeyLogin, true);

                              String Name=username.text.toString();
                              String Password=password.text.toString();
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Todo()));
                                }, child: Text("Submit",style: TextStyle(color: Colors.white),))),
                      )
                    ],
                  ),
                ),
              ),
            ),

        ],
      ),
    );
  }

  void check_login() async{
    logindata=await SharedPreferences.getInstance();
    checkuser=(logindata.getBool("login")?? true);
    print(checkuser){
      if (checkuser==false){

      }
    }

  }
}

