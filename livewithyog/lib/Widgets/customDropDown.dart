import 'package:flutter/material.dart';

class customDropDown extends StatefulWidget {
  const customDropDown({
    Key? key,
    required this.hintText,
    required this.icon,
    required this.isPassword,
    required this.onTextChanged,
    required this.dropdownItems, // List of dropdown items
  }) : super(key: key);

  final String hintText;
  final String icon;
  final bool isPassword;
  final void Function(String) onTextChanged;
  final List<String> dropdownItems;

  @override
  _customDropDownState createState() => _customDropDownState();
}

class _customDropDownState extends State<customDropDown> {
  String _selectedItem = '';

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return Container(
      padding: EdgeInsets.all(10),
      child: DropdownButtonFormField<String>(
        value: _selectedItem.isNotEmpty ? _selectedItem : null,
        onChanged: (String? newValue) {
          setState(() {
            _selectedItem = newValue ?? '';
            widget.onTextChanged(newValue ?? '');
          });
        },
        items:
            widget.dropdownItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: !widget.isPassword
            ? InputDecoration(
                contentPadding: EdgeInsets.all(15),
                fillColor: Color.fromRGBO(247, 248, 248, 1),
                filled: true,
                hintText: widget.hintText,
                hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                alignLabelWithHint: true,
                prefixIcon: Container(
                  width: 15.5,
                  height: 20,
                  child: Image.asset(
                    widget.icon,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
              )
            : InputDecoration(
                contentPadding: EdgeInsets.all(15),
                fillColor: Color(0xFFF7F8F8),
                filled: true,
                hintText: widget.hintText,
                hintStyle: TextStyle(fontFamily: 'Poppins', fontSize: 12),
                alignLabelWithHint: true,
                prefixIcon: Container(
                  width: 15.5,
                  height: 20,
                  child: Image.asset(
                    widget.icon,
                  ),
                ),
                suffixIcon: Image.asset('assets/Icons/hide_logo.png'),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
      ),
    );
  }
}
