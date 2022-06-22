import 'package:flutter/material.dart';

class PlusButton extends StatefulWidget {
  const PlusButton({Key? key}) : super(key: key);

  @override
  State<PlusButton> createState() => _PlusButtonState();
}

class _PlusButtonState extends State<PlusButton> {
  bool click = true;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        setState(()
        {
          click = !click;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Icon((click == false) ? Icons.check : Icons.add, size: 30,),
      ),
    );
  }
}


