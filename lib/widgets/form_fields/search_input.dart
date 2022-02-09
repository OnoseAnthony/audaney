import 'package:audaney/commons/constants/theme_colors.dart';
import 'package:audaney/commons/constants/theme_text_styles.dart';
import 'package:flutter/material.dart';

class SearchInputField extends StatefulWidget {
  const SearchInputField({
    Key? key,
    this.textEditingController,
    this.textInputType,
    this.focusNode,
    this.onSubmitted,
    this.onChanged,
    this.hintText,
    this.autoFocus,
    this.forceRefresh,
  }) : super(key: key);

  final TextEditingController? textEditingController;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final ValueChanged<String>? onSubmitted;
  final String? hintText;
  final bool? autoFocus;
  final ValueChanged<String>? onChanged;
  final Function? forceRefresh;

  @override
  _SearchInputFieldState createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    // ThemeMode themeMode = AppWrapper.getThemeMode(context);
    ThemeMode themeMode = ThemeMode.dark;
    return TextFormField(
      autofocus: widget.autoFocus!,
      cursorColor: ThemeColor.kShadeColor,
      focusNode: widget.focusNode,
      controller: widget.textEditingController,
      textInputAction: TextInputAction.done,
      onChanged: (args) {
        widget.onChanged!(args);
        if (args.length > 1) {
          setState(() => _isVisible = true);
        } else if (args.isEmpty) {
          setState(() => _isVisible = false);
        } else if (widget.textEditingController!.text.isEmpty) {
          setState(() => _isVisible = false);
        }
      },
      keyboardAppearance: ThemeColor.kKeyboardAppearanceColor(themeMode),
      decoration: InputDecoration(
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: InkWell(
                onTap: () {
                  widget.textEditingController?.clear();
                  setState(() {
                    _isVisible = false;
                  });
                  widget.forceRefresh!();
                },
                child: _isVisible
                    ? const Icon(Icons.cancel, size: 15)
                    : const SizedBox()),
          ),
          isDense: true,
          suffixIconConstraints: const BoxConstraints(
            minHeight: 0,
            minWidth: 0,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 14.0, right: 11.0),
              child: Icon(Icons.search)),
          prefixIconConstraints: const BoxConstraints(
            minHeight: 0,
            minWidth: 0,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: const BorderSide(color: Colors.transparent, width: 0.0),
          ),
          fillColor: ThemeColor.kSearchBarFillColor(themeMode),
          filled: true,
          hintText: widget.hintText,
          hintStyle: ThemeTextStyles.kSmallTextStyle(themeMode)),
      style: ThemeTextStyles.kTextInputStyle(themeMode),
      onFieldSubmitted: (_) {},
      keyboardType: widget.textInputType,
    );
  }
}