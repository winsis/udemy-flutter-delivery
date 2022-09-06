import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToRegisterPage(){
    Get.toNamed('/register');
  }

  void login(){
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    
    print('Email: ${email}');
    print('Password: ${password}');
    
    if(isValidForm(email,password)){
      Get.snackbar('Formulario válido', 'Estás listos para enviar la petición http');
    }
  }

  bool isValidForm(String email, String password){
    if(email.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresr un email válido');
      return false;
    }
    if(!GetUtils.isEmail(email)){
      Get.snackbar('Formulario no válido', 'Debes ingresr un email válido');
      return false;
    }
    if(password.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresr un password válido');
      return false;
    }
    return true;
  }
}
