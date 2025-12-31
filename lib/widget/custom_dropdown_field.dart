import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
class CustomDropdownField<T> extends StatelessWidget {
  final String hintText;
  final List<T> items;
  final T? value;
  final String Function(T)? labelBuilder;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final bool isRequired;
  final Color? fillColor;
  final String? errorText;
  final bool enabled;
  final double? height;

  const CustomDropdownField({
    super.key,
    required this.hintText,
    required this.items,
    this.value,
    this.labelBuilder,
    this.onChanged,
    this.validator,
    this.isRequired = false,
    this.fillColor,
    this.errorText,
    this.enabled = true,
    this.height = 16,
  });

  @override
  Widget build(BuildContext context) {
    final message = "Field Is Required";

    String? Function(T?)? validation = (isRequired
        ? (val) => (val == null) ? message : null
        : null);
    final validationFunction = validator ?? validation;

    final bool hasError = errorText != null && errorText!.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffEDEEF2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: DropdownButtonFormField2<T>(
        isExpanded: true,
        value: items.contains(value) ? value : null,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: -16,
            bottom: 5,
            top: 5,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide(
              color: hasError ? Colors.red : Colors.transparent,
              width: 1.2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: BorderSide.none,
          ),
          filled: true,
          // fillColor: fillColor ?? AppColors.white,
          fillColor: fillColor ?? Color(0xffEDEEF2),
          errorText: errorText,
          errorStyle: const TextStyle(color: Colors.red),
        ),
        hint: Text(
          hintText,
          style: const TextStyle(
            color: Color(0xff8E8E8E),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        items: items
            .map(
              (item) => DropdownMenuItem<T>(
            value: item,
            child: Text(
              labelBuilder?.call(item) ?? item.toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        )
            .toList(),
        onChanged: enabled ? onChanged : null,
        validator: validationFunction,
        style: const TextStyle(
          color: Color(0xff8E8E8E),
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        buttonStyleData: ButtonStyleData(
          height: height, //  sets vertical height
          padding: const EdgeInsets.only(
            left: 16,
            right: 2, // reduce the right padding here instead
          ), // horizontal padding
          // padding: EdgeInsets.only(right: 8),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(Icons.keyboard_arrow_down, color: Color(0xff8E8E8E)),
          iconSize: 24,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        ),
      ),
    );
  }
}
