import 'package:flutter/material.dart';


void main()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     home: SafeArea(
       child: Scaffold(
         appBar: AppBar(
           title: const Center(child: Text("Bài 3")),
           backgroundColor: Colors.blue,
         ),
         body: const Center(child: ListE()),
       ),
     ),
     debugShowCheckedModeBanner: false,
   );

  }

}
class ListE extends StatefulWidget{
  const ListE({super.key});

  @override
  State<StatefulWidget> createState() {
   return _ListEState();
  }
}
class _ListEState extends State<ListE>
{
  final TextEditingController _input = TextEditingController();
  final TextEditingController _target = TextEditingController();
  final TextEditingController _result = TextEditingController();
  List<int> sumTwo(List<int> number , int target)
  {
    for(int i = 0; i< number.length ; i++)
    {
      for(int i1 = i+1 ; i1<number.length ;i1++)
      {
        if(number[i] + number[i1] == target)
        {
          return [i,i1];
        }
      }
    }
    return [];
  }
  void _sumTwoNumber()
  {
    final inputText = _input.text;
    final List<String> inputS = inputText.split(",");
    final List<int> number =[];
    for(String str in inputS)
      {
        number.add(int.parse(str.trim()));
      }
    final int target = int.parse(_target.text);
    final List<int> result = sumTwo(number, target);
    if(target.isNaN)
      {
        _result.text ="NaN";
      }
    setState(() {
      _result.text = 'Vị trí của phần tử : ${result[0]}, ${result[1]}';
    });
  }
  void _delte()
  {
    _input.text="";
    _target.text="";
    _result.text="";
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
           controller: _input,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
              hintText: "Input "
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: _target,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
                hintText: "Target "
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
             controller: _result,
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Kết quả "
            ),
            readOnly: true,
          ),
        ),
        Container(
          child: ElevatedButton(
              onPressed: _sumTwoNumber,
              child: const Text("Kết quả")
          )
        ),
        Container(
            child: ElevatedButton(
                onPressed: _delte,
                child: const Text("Delete")
            )
        ),
      ],
    );
  }
}
