import 'package:flutter/material.dart';

class EditItem extends StatelessWidget {
  final Widget widget;
  final String title;
  const EditItem({
    super.key,
    required this.widget,
    required this.title ,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
         
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 5, 5, 5),
            ),
          ),
          
        ),
        
        const SizedBox(width: 40),
        Expanded(
          flex: 5,
          child: widget,
        )
      ],
      
    );
    
  }
}
