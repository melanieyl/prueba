import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final bool obscureType, borderEnabled;
  final double fountsize;
  final void Function(String text) onChanged;
  final String? Function(String?)? validator;
  const InputText({
    Key? key,
    this.label = "",
    this.keyboardType = TextInputType.text,
    this.obscureType = false,
    this.borderEnabled = true,
    this.fountsize = 15,
    required this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureType,
        // es para guardar los datos en los inputs
        onChanged: this.onChanged,
        // para validar los datos ( debo ponerle un ? y no se por que)
        validator: this.validator,
        style: TextStyle(fontSize: this.fountsize),
        decoration: InputDecoration(
          labelText: label,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          enabledBorder: this.borderEnabled
              ? UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12))
              : InputBorder.none,
          labelStyle: const TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w500,
          ),
        ));
  }
}
