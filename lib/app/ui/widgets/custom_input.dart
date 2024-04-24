import 'package:disruptive_studio/app/utils/app_colors.dart';
import 'package:disruptive_studio/app/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInputFile extends StatefulWidget {
  final void Function(String)? onChanged;
  final String label;
  final TextInputType? inputType;
  final bool isPassword;
  final String? Function(String?)? validator;
  const CustomInputFile({
    super.key,
    this.onChanged,
    required this.label,
    this.inputType,
    this.isPassword = false,
    this.validator,
  });

  @override
  State<CustomInputFile> createState() => _CustomInputFileState();
}

class _CustomInputFileState extends State<CustomInputFile> {
  late bool _obscuredText;
  @override
  void initState() {
    super.initState();
    _obscuredText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: widget.validator,
        initialValue: AppConstants.empty,
        builder: (state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                obscureText: _obscuredText,
                keyboardType: widget.inputType,
                onChanged: (text) {
                  if (widget.validator != null) {
                    // ignore: invalid_use_of_protected_member
                    state.setValue(text);
                    state.validate();
                  }
                  if (widget.onChanged != null) {
                    widget.onChanged!(text);
                  }
                },
                decoration: InputDecoration(
                  labelText: widget.label,
                  suffixIcon: widget.isPassword
                      ? CupertinoButton(
                          child: Icon(_obscuredText
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            _obscuredText = !_obscuredText;
                            setState(() {});
                          })
                      : Container(
                          width: 0.0,
                        ),
                ),
              ),
              if (state.hasError)
                Text(
                  state.errorText!,
                  style: const TextStyle(
                    color: AppColors.red,
                  ),
                )
            ],
          );
        });
  }
}
