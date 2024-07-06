import 'package:flutter/material.dart';



const List<String> defaultlist = <String>['One', 'Two', 'Three', 'Four'];

void main() => runApp(const DropdownButtonExample(list: defaultlist));

class DropdownButtonExample extends StatefulWidget {
  final List<String> list;
  const DropdownButtonExample({super.key, required this.list});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  late String dropdownValue;
  
  @override
  void initState() {
    super.initState();
    dropdownValue = widget.list.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      padding: const EdgeInsets.only(left: 10.0),
      alignment: AlignmentDirectional.centerStart,
      value: dropdownValue,
      icon: const SizedBox.shrink(),
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      dropdownColor: const Color(0xFF8771BD),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          alignment: Alignment.centerLeft,
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
