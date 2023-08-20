class ValidationHelpers{
  static String? nameValidator(name) {
    RegExp namePattern = RegExp(r'^[a-zA-Z\s\-]+$');
    if(name != null && namePattern.hasMatch(name)){
      return null;
    } else {
      return "Invalid Name";
    }
  }
  static String? emailValidator(email){
    RegExp emailPattern = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$');
    if(email != null && emailPattern.hasMatch(email)){
      return null;
    } else {
      return "Enter Valid Email";
    }
  }
  static String? phoneNumberValidator(phone){
    RegExp phonePattern = RegExp(r'^[\d\-+\s()]+$');
    if(phone != null && phonePattern.hasMatch(phone)){
      return null;
    } else {
      return "Enter Valid Phone Number";
    }
  }
  static String? passwordValidator(password){
    bool hasDigit = password.contains(RegExp(r'\d'));
    bool hasCharacter = password.contains(RegExp(r'[a-zA-Z]'));
    bool hasMinimumLength = password.length >= 6;
    if(!hasMinimumLength){
      return "Password Length greater or equal to 6";
    } else if(!hasDigit){
      return "Password Must Contain At least one number";
    } else if(!hasCharacter){
      return "Password Must Contain At least one Charactor";
    } else {
      return null;
    }
  }
  static String? fieldRequired(string){
    if( string != null && string.isNotEmpty){
      return null;
    } else {
      return "Required";
    }
  }
}