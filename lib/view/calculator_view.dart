import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculatorview  extends StatefulWidget {
  const Calculatorview ({super.key});

  @override
  State<Calculatorview> createState() => _CalculatorviewState();
}

class _CalculatorviewState extends State<Calculatorview> {
  int x=0;
  int y=0;
  num z=0;

  final displayonecontroller=TextEditingController();
  final displaytwocontroller=TextEditingController();
  late final AppLifecycleListener _listener;

@override
  void initState() {
    displayonecontroller.text=x.toString();
    displaytwocontroller.text=y.toString();
    super.initState();
    _listener=AppLifecycleListener(
    onShow:_onshow,
    onHide:_onhide,
    onResume: _onresume,
    onDetach: _ondetach,
    onInactive: _oninactive,
    onPause: _onpause,
    onRestart: _onrestart,
    onStateChange: _onstatechange,
  );
  }
  
  void _onshow()=>print("On show called");
  void _onhide()=>print("On hide called");
  void _onresume()=>print("On resume called");
  void _ondetach()=>print("On detach called");
  void _oninactive()=>print("On inactive called");
  void _onpause()=>print("On pause called");
  void _onrestart()=>print("On restart called");
  void _onstatechange(AppLifecycleState state){
    print("On State changed called with state: $state");
  }



 


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(32.0),
      child:  Column(
        children: [
           DisplayOne(key:const Key("displayone"),hint:"Enter First Number",controller:displayonecontroller),
          const SizedBox(height: 30,),
           DisplayOne( key:const Key("displaytwo"),hint:"Enter Second Number",controller:displaytwocontroller),
          const Spacer(),
          const SizedBox(height: 30,),
           Text(key:const Key("Result"),z.toString(),
          style:const TextStyle(
            fontSize: 60,
            fontWeight: FontWeight.bold
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: (){
                  setState(() {
                    z=num.tryParse(displayonecontroller.text)!+
                    num.tryParse(displaytwocontroller.text)!;
                  });
                  
                },
                child: const Icon(Icons.add),),
                 FloatingActionButton(
                onPressed: (){
                  setState(() {
                    z=num.tryParse(displayonecontroller.text)!-
                    num.tryParse(displaytwocontroller.text)!;
                  });
                  
                },
                child: const Icon(CupertinoIcons.minus),),
                 FloatingActionButton(
                onPressed: (){
                  setState(() {
                    z=num.tryParse(displayonecontroller.text)!*
                    num.tryParse(displaytwocontroller.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.multiply),),
                 FloatingActionButton(
                onPressed: (){
                 setState(() {
                    z=num.tryParse(displayonecontroller.text)!/
                    num.tryParse(displaytwocontroller.text)!;
                  });
                },
                child: const Icon(CupertinoIcons.divide),)
            ],),
            const SizedBox(height: 10,),
            FloatingActionButton.extended(
                onPressed: (){
                 setState(() {
                   x=0;
                  y=0;
                  z=0;
                  displayonecontroller.clear();
                  displaytwocontroller.clear();
                 });
                },
                label:const Text("Clear") )
    
        ],
      ),
    ) ;
  }
}

class DisplayOne extends StatelessWidget {
  const  DisplayOne({
    super.key,
  this.hint="Enter a number",
  required this.controller
  });
  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
     keyboardType: TextInputType.number,
     autofocus: true,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide:const  BorderSide(
            color: Colors.black,
            width: 3.0
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderSide: const  BorderSide(
            color: Colors.black,
            width: 3.0
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hint,
        hintStyle:const TextStyle(
          color: Colors.white
        )
      ),
    );
  }
}