enum MethodType {
  get,
}

extension MethodTypeExtension on MethodType{
  String get methodToString{
    switch(this){
      case MethodType.get:
        return 'GET';
    }
  }
}
