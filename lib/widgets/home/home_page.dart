import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:tbdetect/constants.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();
  File? _image;

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _captureImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final navigator = Navigator.of(context);
      final url = Uri.parse(AppConstants.getImageAnalysisEndpoint());
      final request = http.MultipartRequest('POST', url);
      request.fields['patientname'] = _textController.text;
      request.files
          .add(await http.MultipartFile.fromPath('myfile', _image!.path));
      final response = await request.send();
      print(response);
      if (response.statusCode == 200) {
        final contentType = response.headers['content-type'];
        if (contentType != null && contentType.contains('application/json')) {
          print('Data uploaded successfully');
          final jsonResponse =
              json.decode(await response.stream.bytesToString());
          navigator.pushNamed(
            '/home/response',
            arguments: jsonResponse,
          );
        } else {
          final responseText = await response.stream.bytesToString();
          print('Error uploading data');
          navigator.pushNamed(
            '/home/response',
            arguments: responseText,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Enter some text',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: _captureImage,
                    icon: Icon(Icons.camera_alt),
                    label: Text('Take Picture'),
                  ),
                  ElevatedButton.icon(
                    onPressed: _selectImage,
                    icon: Icon(Icons.image),
                    label: Text('Load from Gallery'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              if (_image != null)
                Center(
                  child: Image.file(
                    _image!,
                    height: 200,
                  ),
                ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
