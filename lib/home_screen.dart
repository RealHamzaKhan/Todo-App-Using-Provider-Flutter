import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:watodo/task.dart';
import 'package:watodo/task_data.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70,left: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const CircleAvatar(
                  radius: 37,
                backgroundColor: Colors.white,
                  child: Icon(Icons.list,size: 50,),),
                const SizedBox(height: 15,),
                const Text('WATODO',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Georgia',
                  fontStyle: FontStyle.normal,
                  fontSize: 32,
                ),),
                Text("${Provider.of<TaskData>(context).tasks.length.toString()} task remaining",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Georgia',
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40,),
          MyListView(),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(context: context, builder: (context)=>BottomSheetDesign(),);
            },
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.add,color: Colors.white,size: 25,),
                  Text('Add a new item',style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyListView extends StatelessWidget {
  const MyListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isChecked=false;
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40),),
          boxShadow: [BoxShadow(color: Colors.grey,spreadRadius: 0.3)],
          color: Colors.white,
        ),
        child: ListView.builder(itemBuilder: (context,index){
          return ListTile(
            onLongPress:()=> Provider.of<TaskData>(context,listen: false).removeTask(index),
            leading: Text(Provider.of<TaskData>(context).tasks[index].name,style: TextStyle(
              decoration: isChecked==true?TextDecoration.lineThrough:TextDecoration.none,
            ),),
            trailing: MyCheckBox(isChecked),
          );
        },

          itemCount: Provider.of<TaskData>(context).tasks.length,
        ),

      ),

    );
  }
}


class MyCheckBox extends StatefulWidget {
  bool isChecked;
  MyCheckBox(this.isChecked);

  @override
  State<MyCheckBox> createState() => _MyCheckBoxState();
}

class _MyCheckBoxState extends State<MyCheckBox> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
    onChanged: (value){

      setState(() {
        widget.isChecked=value!;
      });
    },
        value: widget.isChecked,
);
  }
}

class BottomSheetDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _newTask;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Add a new Task',style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontFamily: 'Georgia',
          fontStyle: FontStyle.italic,
          fontSize: 30,
        ),),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFormField(
            onChanged: (value){
              Provider.of<TaskData>(context,listen: false).taskName=value;
            },
            decoration: const InputDecoration(
              hintText: 'Type a new task here',
            ),
          ),
        ),
        const SizedBox(height: 120,),
        ElevatedButton(
          onPressed: () {
            Provider.of<TaskData>(context,listen: false).addTask();
            Navigator.pop(context);
          },
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.add,color: Colors.white,size: 25,),
                Text('Add',style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),),
              ],
            ),
          ),
        ),

      ],
    );
  }
}


