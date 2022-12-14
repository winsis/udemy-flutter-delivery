import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void register(){
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String phone = phoneController.text;
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print('Email: ${email}');
    print('Password: ${password}');

    if(isValidForm(email,name, lastName, phone, password, confirmPassword)){
      Get.snackbar('Formulario válido', 'Estás listos para enviar la petición http');
    }
  }

  bool isValidForm(String email,
      String name,
      String lastName,
      String phone,
      String password,
      String confirmPassword
      ){
    if(email.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresr un email válido');
      return false;
    }
    if(!GetUtils.isEmail(email)){
      Get.snackbar('Formulario no válido', 'Debes ingresr un email válido');
      return false;
    }
    if(name.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresr un nombre válido');
      return false;
    }
    if(lastName.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresr un apellido válido');
      return false;
    }
    if(phone.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresr un telefono válido');
      return false;
    }
    if(password.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresr un password válido');
      return false;
    }
    if(confirmPassword.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresr la confirmación del password');
      return false;
    }
    if(password != confirmPassword){
      Get.snackbar('Formulario no válido', 'Los password no coinciden');
      return false;
    }
    return true;
  }
}