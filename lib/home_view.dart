import 'package:flutter/material.dart';
import 'package:test_flutter_zens/methods.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? result;

  bool validateStrMinMaxSum() {
    RegExp regex = RegExp(r'^\d+\s+\d+\s+\d+\s+\d+\s+\d+$');
    return regex.hasMatch(_textEditingController.text);
  }

  void onPressedSubmit() {
    Methods methods = Methods(_textEditingController.text);
    setState(() {
      result = methods.minMaxSumResult;
    });
  }

  late TextEditingController _textEditingController;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            textFieldMinMax(),
            const SizedBox(height: 16),
            MaterialButton(
              onPressed: onPressedSubmit,
              child: const Text('Result'),
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              result ?? 'miniMaxSum',
              style: const TextStyle(fontSize: 16, color: Colors.red),
            )
          ],
        ),
      ),
    );
  }

  Widget textFieldMinMax() {
    return TextField(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16.0,
      ),
      controller: _textEditingController,
      decoration: InputDecoration(
        labelText: 'Enter your value',
        errorText: validateStrMinMaxSum() ? null : 'Invalid input value',
        labelStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        hintText: 'Value',
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: 16.0,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
          borderRadius:
              BorderRadius.all(Radius.circular(10.0)), // Border radius
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 16.0,
        ),
      ),
    );
  }
}
