import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String temp  = "";
  double res = 0;
  String operator = "";
  // int? f_num;
  // int? s_num;
  List<String> token = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: const Text("Calculator"),
        backgroundColor: Colors.orangeAccent),
        body:Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
              padding: EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  width: 3,
                  style: BorderStyle.solid,
                  color: Colors.deepOrange
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(temp,style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color:Colors.white)),
                ],
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        if(temp!="")
                        {
                          temp = temp.substring(0,temp.length-1);
                        }
                      });
                    },
                    child: Icon(Icons.backspace_sharp,color: Colors.deepOrange,size: 40),
                  ),
                )
              ],
            ),

            Row(
              children: [
                button("7", context),
                button("8", context),
                button("9", context),
                button("x", context),
              ],
            ),

            Row(
              children: [
                button("4", context),
                button("5", context),
                button("6", context),
                button("-", context),
              ],
            ),

            Row(
              children: [
                button("1", context),
                button("2", context),
                button("3", context),
                button("+", context),
              ],
            ),

            Row(
              children: [
                button("AC", context),
                button("0", context),
                button("=", context),
                button("/", context),
              ],
            ),

          ],
        )
      )
    );
  }
  Widget button(String num,context)
  {
    return InkWell(
      onTap: (){
        setState(() {
          if(num == 'AC')
          {
            temp = "";
            token.clear();
            operator="";
          }
          else if(num == '+' || num == '-' || num == 'x' || num == '/')
          {
            if(temp!="")
            {
              token.add(temp);
              token.add(num);
              temp = "";
            }
          }
          else if(num == '=')
          {
            if(temp!= "")
            {
              token.add(temp);
              res = double.parse(token[0]);
            }
            for(int i=1;i<token.length-1;i=i+2)
            {
              operator = token[i];
              if(operator == '+')
              {
                res += int.parse(token[i+1]);
              }
              else if(operator == '-')
              {
                res -= int.parse(token[i+1]);
              }
              else if(operator == 'x')
              {
                res *= int.parse(token[i+1]);
              }
              else if(operator == '/')
              {
                res /= int.parse(token[i+1]);
              }

            }
            temp = res.toString();
            token.clear();
            res = 0;
          }
          else{
            temp += num;
            }
        });
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.width/5,
        width: MediaQuery.of(context).size.width/5,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color:Colors.orangeAccent,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 2,
            color: Colors.white,
            style: BorderStyle.solid
          ) 
        ),
        child: Text(num ,style: TextStyle(fontSize: 25),),
      ),
    );
  }
}
