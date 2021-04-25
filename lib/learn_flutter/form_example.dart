import 'package:flutter/material.dart';
enum MyRadio{
  radio1, radio2, radio3
}
class FormExam extends StatefulWidget {
  @override
  _FormExamState createState() => _FormExamState();
}

class _FormExamState extends State<FormExam> {
  bool checkbox1 = false;
  bool checkbox2 = false;
  MyRadio _myRadio;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _editingController1 =TextEditingController();
  TextEditingController _editingController2 =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('FormExam'),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'ID',
                        ),
                        controller: _editingController1,
                        validator: (value) {
                          if(value.isEmpty){
                            return "값이 비어있습니다";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (newValue) {
                          print(newValue);
                        },
                      ),
                      TextFormField(
                        onSaved: (newValue) {
                          print(newValue);
                        },
                        controller: _editingController2,
                        decoration: InputDecoration(
                          labelText: 'PWD'
                        ),
                        validator: (value) {
                          if(value.isEmpty){
                            return "값이 비어있습니다";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  )
              ),
              ElevatedButton(
                  onPressed: (){
                    _formKey.currentState.validate();
                    _formKey.currentState.save();
                    FocusScope.of(context).unfocus();
                    // print(_editingController1.text);
                  },
                  child: Text('폼 제출')
              ),

              Checkbox(
                value: checkbox1,
                onChanged: (value) {
                  setState(() {
                    checkbox1 = value;
                  });
                },),
              CheckboxListTile(
                title: Text('ListTileCheckbox'),
                value: checkbox2,
                onChanged: (value) {
                  setState(() {
                    checkbox2 = value;
                  });
                },),
              CustomCheckbox(title: 'myCustomCheckbox',),
              Divider(thickness: 4,),
              Radio(
                value: MyRadio.radio1,
                groupValue: _myRadio,
                onChanged: (value) {
                  setState(() {
                    _myRadio = value;
                  });
                },
              ),
              RadioListTile(
                title: Text('radioListTile'),
                value: MyRadio.radio2,
                groupValue: _myRadio,
                onChanged: (value) {
                  setState(() {
                    _myRadio = value;
                  });
                },
              ),
              Radio(
                value: MyRadio.radio3,
                groupValue: _myRadio,
                onChanged: (value) {
                  setState(() {
                    _myRadio = value;
                  });
                },
              ),
              Divider(thickness: 4,),
              Text('\n\n\n'),
              Text('\n\n\n'),
              Text('\n\n\n'),
              Text('\n\n\n'),
              Text('\n\n\n'),
            ],
          ),
        ),
      ),
    );
  }
}


class CustomCheckbox extends StatefulWidget {
  final String title;
  CustomCheckbox({this.title});
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool customCheckBox = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          customCheckBox = !customCheckBox;
        });
      },
      child: Row(
        children: [
          Checkbox(value: customCheckBox, onChanged: (value) {
            setState(() {
              customCheckBox = value;
            });
          },),
          Text('${widget.title}')
        ],
      ),
    );
  }
}
