import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView',
      theme: ThemeData(
      
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'Lista de tarefas',),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  
  List<String>tarefas=[];

 final  _listController=TextEditingController();

  void _addList() {

    final String tarefa=(_listController.value.text);

    setState(() {
      if(_listController.text.length > 0){
        tarefas.add(_listController.text);
        _listController.clear();
      }
     
    });
  } 
  void _removeList(){

    setState(() {
      tarefas=[];
    });
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(    
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [           
           TextField(
            style: const TextStyle(fontSize: 20),
            decoration: const InputDecoration(
              border:OutlineInputBorder(),
              label: Text('Informe a tarefa'),
              hintText: "Ex:Escovar os dentes",
            ),
            controller: _listController,
           ),
           Container(
            height: 300,
             child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(color: Colors.black87,),
              itemCount: tarefas.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(tarefas[index]),
                  onLongPress: (){
                    setState(() {
                      tarefas.removeAt(index);
                    });
                  },
                  // onTap: (){
                  //   setState(() {
                  //     tarefas.
                  //   });
                  // },
                );               
              },               
             ),
           ),         
          ],
         )
        ),
       floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        FloatingActionButton(
        onPressed: _addList,
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
         ),
         FloatingActionButton(
        onPressed: _removeList,
        child: const Icon(Icons.remove),
        backgroundColor: Colors.green,
         ),
        ],
       ),
      );  
     }
    }
