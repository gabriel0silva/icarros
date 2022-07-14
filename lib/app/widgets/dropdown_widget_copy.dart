import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DropWidget extends StatefulWidget {
  final hint;
  final items;
  final onTap;
  final String selectedValue;
  const DropWidget(
      {Key? key,
      this.hint,
      this.items,
      required this.selectedValue,
      this.onTap})
      : super(key: key);

  @override
  State<DropWidget> createState() => _DropWidgetState();
}

class _DropWidgetState extends State<DropWidget> {
  var hint;
  var items;

  var onTap;
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    hint = widget.hint;
    items = widget.items;
    onTap = widget.onTap;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedValue, // brandId, modelId ou yearId
      onChanged: (String? newValue) {
        print(selectedValue);
        setState(() {          
          selectedValue = newValue!;
          
          
        });
        onTap;
      },

      dropdownColor: Colors.white,
      icon: const Icon(Icons.arrow_drop_down, color: Colors.black),
      iconSize: 36,
      isExpanded: true,
      underline: const SizedBox(),
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      hint: const Text(
        'Marcas...',
        style: TextStyle(color: Colors.black),
      ),
      items: items.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
            value: value.code, // passa a função de mudança de página e faz a chamada da API
            child: Text(value.name.toString()));
      }).toList(),
    );
  }
}
