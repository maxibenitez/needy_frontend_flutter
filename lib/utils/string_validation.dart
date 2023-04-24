class StringValidation {
  StringValidation._();
  static final emailValidation = RegExp(
    r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]{2,})$',
  );
}
