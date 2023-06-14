import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      this.width,
      this.hintName,
      required this.keyboardType,
      this.labelText,
      this.onChanged,
      this.controller,
      this.validator,
      this.height});
  final double? width;
  final String? hintName;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final String? labelText;
  final onChanged;
  final validator;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return 
    Expanded(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintName,
          enabledBorder: InputBorder.none,
          fillColor: Colors.grey.withOpacity(0.2),
          disabledBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: keyboardType,
        onChanged: onChanged,
        validator: validator,
      ),
    );
  
  }
}


  // Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: Colors.grey.withOpacity(0.2),
  //         borderRadius: BorderRadius.circular(10),
  //       ),
  //       width: width,
  //       height: height,
  //       child: TextFormField(
  //         controller: controller,
  //         decoration: InputDecoration(
  //           labelText: labelText,
  //           hintText: hintName,
  //           enabledBorder: InputBorder.none,
  //           fillColor: Colors.grey.withOpacity(0.2),
  //           disabledBorder: InputBorder.none,
  //           border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //         ),
  //         keyboardType: keyboardType,
  //         onChanged: onChanged,
  //         validator: validator,
  //       ),
  //     ),
  //   );