import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:needy_app_ui/needy_app_ui.dart';

class NATextField extends StatelessWidget {
  const NATextField({
    super.key,
    this.initialValue,
    this.autoFillHints,
    this.controller,
    this.inputFormatters,
    this.autocorrect = true,
    this.readOnly = false,
    this.hintText,
    this.errorText,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.obscureText,
    this.options,
    this.dropDownCallBack,
  });

  /// A text field component based on material [TextFormField] widget which
  /// extends TextField with email icon and validates input type.
  const NATextField.emailTextField({
    super.key,
    this.initialValue,
    this.controller,
    this.inputFormatters,
    this.readOnly = false,
    this.hintText,
    this.errorText,
    this.suffix,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.obscureText,
  })  : keyboardType = TextInputType.emailAddress,
        autoFillHints = const [AutofillHints.email],
        prefix = const Padding(
          padding: EdgeInsets.only(
            left: NASpacing.sm,
            right: NASpacing.sm,
          ),
          child: Icon(
            Icons.email,
            color: NAColors.grey,
          ),
        ),
        autocorrect = false,
        dropDownCallBack = null,
        options = null;

  /// A password text field component based on material [TextFormField] widget which
  /// extends TextField which obscures the text
  const NATextField.passwordTextField({
    super.key,
    this.initialValue,
    this.controller,
    this.inputFormatters,
    this.readOnly = false,
    this.errorText,
    this.suffix,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.keyboardType,
    this.autoFillHints,
    this.prefix,
    this.obscureText = true,
  })  : hintText = 'Contraseña',
        autocorrect = false,
        dropDownCallBack = null,
        options = null;

  NATextField.gender({
    required String selectedOption,
    super.key,
    this.onChanged,
    this.errorText,
    this.dropDownCallBack,
    this.options = const [
      'Male',
      'Female',
    ],
  })  : obscureText = false,
        initialValue = null,
        autoFillHints = null,
        controller = null,
        inputFormatters = null,
        hintText = null,
        prefix = null,
        onTap = null,
        onSubmitted = null,
        readOnly = false,
        autocorrect = false,
        suffix = DropdownButton<String>(
          onChanged: dropDownCallBack,
          dropdownColor: NAColors.grey,
          value: selectedOption,
          icon: const SizedBox(),
          underline: const SizedBox(),
          style: NATextStyle.bodyText1,
          borderRadius: BorderRadius.circular(NASpacing.sm),
          items: [
            ...options!.map(
              (e) => DropdownMenuItem<String>(
                value: e,
                child: Text(e),
              ),
            ),
          ],
        ),
        keyboardType = null;

  final String? initialValue;

  final Iterable<String>? autoFillHints;
  final TextEditingController? controller;

  final List<TextInputFormatter>? inputFormatters;

  final bool autocorrect;
  final bool readOnly;

  final String? hintText;

  final String? errorText;

  final Widget? prefix;

  final Widget? suffix;

  final TextInputType? keyboardType;

  final ValueChanged<String>? onChanged;

  final ValueChanged<String>? onSubmitted;

  final VoidCallback? onTap;
  final bool? obscureText;

  final List<String>? options;
  final void Function(String?)? dropDownCallBack;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 80),
      child: TextFormField(
        key: key,
        initialValue: initialValue,
        showCursor: true,
        controller: controller,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        obscureText: obscureText ?? false,
        autocorrect: autocorrect,
        readOnly: readOnly,
        autofillHints: autoFillHints,
        cursorColor: Theme.of(context).colorScheme.onBackground,
        style: NATextStyle.bodyText1.copyWith(
          fontWeight: FontWeight.w500,
        ),
        onFieldSubmitted: onSubmitted,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: NATextStyle.bodyText1,
          errorText: errorText,
          prefixIcon: prefix,
          suffixIcon: suffix,
          suffixIconConstraints: const BoxConstraints.tightFor(
            width: 32,
            height: 32,
          ),
          prefixIconConstraints: const BoxConstraints.tightFor(
            width: 48,
          ),
        ),
        onChanged: onChanged,
        onTap: onTap,
      ),
    );
  }
}
