
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  /*

  English Formula
Body Mass Index can be calculated using pounds and inches with this equation

BMI = (Weight in Pounds
(Height in inches) x (Height in inches)	) x 703

   */
  late TextEditingController weightEditingController;
  late TextEditingController heightEditingController;
  double result=0.0;
String textResult= 'Check your BMI ';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    weightEditingController = TextEditingController();
    heightEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Container(
                  width: 300,
                  height: 390,
                  decoration:   BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('images/oeilogo.gif'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: 200,
                            height: 50,
                            child: Image.asset('images/logo.png')),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: heightEditingController,
                          decoration: const InputDecoration(
                            label: Text('Height in Feet dot inches'),
                            hintText: 'Height in Feet dot inches',
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.only(bottomLeft: Radius.zero),
                              borderSide: BorderSide(
                                color: Colors.pink,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: weightEditingController,
                          decoration: const InputDecoration(
                            label: Text('Weight in pounds'),
                            hintText: 'Weight in pounds',
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.only(bottomLeft: Radius.zero),
                              borderSide: BorderSide(
                                color: Colors.pink,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.pink),
                            onPressed: () {

                              setState(() {
                                double weight= double.parse(weightEditingController.text)  ;
                                double height= double.parse(heightEditingController.text) ;
                                result=(weight/(height*height)*703);
                                if(result< 8.5)
                                  {
                                    textResult=' you are Underweight';

                                  }else if(result > 8.5 && result < 24.9){
                                  textResult=' Your weight is Normal';
                                }else if(result > 24.9 && result < 29.9){
                                  textResult=' You are Overweight';
                                }else
                                  {
                                    textResult=' You are Obesity';

                                  }
                              });

                               


                            },
                            child: const Text('Compute BMI')),

                        Text("$textResult  ${result.toStringAsFixed(1)}",style: const TextStyle(fontSize: 10),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
