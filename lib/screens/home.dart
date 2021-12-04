import 'package:game_test/widgets/left_bar.dart';
import 'package:game_test/widgets/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:game_test/constans/constants_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double __imcResult = 0.00;
  String _textResult = "";

   TextEditingController _heightController = TextEditingController();
   TextEditingController _weightController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "IMC CALCULATOR",
          style: TextStyle(color: Colors.yellow,fontWeight: FontWeight.w700),
        ),
        backgroundColor: Colors.black,
        elevation: 10,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _heightController,
                    style: const TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w300,
                    color: Colors.white
                  ),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white
                      )
                    ),
                ),),
                SizedBox(
                  width: 150,
                  child: TextField(
                    controller: _weightController,
                    style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white
                    ),
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                            color: Colors.white
                        )
                    ),
                  ),)
              ],),
            const SizedBox(height: 50,),
            GestureDetector(
              onTap: (){
                imcCalculator(double.parse(_heightController.text),double.parse(_weightController.text));
              } ,
              child: Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),borderRadius:BorderRadius.circular(12)),
                  child:  const Text("Calculate",style: TextStyle(color: Colors.yellow,fontSize: 25,fontWeight: FontWeight.w500))
              ) ,
            ),
            const SizedBox(height: 50,), 
            Container(
                child: Text(__imcResult.toStringAsFixed(2),style: const TextStyle(fontSize: 32,fontWeight: FontWeight.w400,color: Colors.white))
            ),
            const SizedBox(height: 50,),
            Visibility(
          visible: _textResult.isNotEmpty,
          child:Text(_textResult,style: const TextStyle(fontSize: 32,fontWeight: FontWeight.w400,color: Colors.yellow))),
            SizedBox(height: 50,),
            LeftBar(barWidth: 50,),
            SizedBox(height: 20,),
            LeftBar(barWidth: 70,),
            SizedBox(height: 20,),
            LeftBar(barWidth: 40,),
            SizedBox(height: 20,),
            RightBar(barWidth: 40,),
            SizedBox(height: 20,),
            RightBar(barWidth: 70,),
            SizedBox(height: 20,),
            RightBar(barWidth: 40,)
          ],
        ),
      ),
    );
  }

  void imcCalculator(double height,double weight){
    __imcResult = weight / (height * height);

    setState(() {
      if(__imcResult >= 30){
        _textResult = "You\'re over weight";
      }else if(__imcResult<=29.9 && __imcResult >= 25){
        _textResult = "You\'re little over weight";
      }else if(__imcResult<=24.9 && __imcResult >= 18.5){
        _textResult = "You\'re normal weight";
      }else if(__imcResult<=18.5){
        _textResult = "You\'re under weight";
      }
    });
  }
}
