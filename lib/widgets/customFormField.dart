import 'package:flutter/material.dart';
import 'package:atividade_tasklist/config/colors.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final bool state;
  final TextEditingController controller;

  const CustomFormField({
    super.key,
    required this.hintText,
    required this.state,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: TextFormField(
        obscureText: state,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color.fromRGBO(158, 157, 157, 1),
          ), // Fica fixo como placeholder
          filled: true,
          fillColor: AppColors.vanilla, // evita flutuar
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: AppColors.moonstone, width: 3),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: AppColors.moonstone, width: 3),
          ),
        ),
      ),
    );
  }
}
