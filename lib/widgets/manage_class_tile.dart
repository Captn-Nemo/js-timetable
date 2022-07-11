import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/class_data.dart';

class ManageClassTile extends StatefulWidget {
  final String teacher;
  final String std;
  final String time;
  final String totalStudents;

  ManageClassTile({this.teacher, this.std, this.totalStudents, this.time});

  @override
  _ManageClassTileState createState() => _ManageClassTileState();
}

class _ManageClassTileState extends State<ManageClassTile> {
  final _form = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _timeController = TextEditingController();

  final _numberController = TextEditingController();

  var _isInit = false;

  @override
  void didChangeDependencies() {
    if (!_isInit) {
      _nameController.text = widget.teacher;
      _timeController.text = widget.time;
      _numberController.text = widget.totalStudents;
    }
    _isInit = true;
    super.didChangeDependencies();
  }

  void _editClassData(BuildContext ctx, Function changeData) {
    showModalBottomSheet(
        context: ctx,
        builder: (context) {
          return Form(
            key: _form,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Teacher\'s Name'),
                      textInputAction: TextInputAction.next,
                      enableInteractiveSelection: false,
                      controller: _nameController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Time'),
                      textInputAction: TextInputAction.next,
                      enableInteractiveSelection: false,
                      controller: _timeController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Total Students'),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.go,
                      enableInteractiveSelection: false,
                      controller: _numberController,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        changeData(widget.std, _nameController.text,
                            _timeController.text, _numberController.text);
                        Navigator.of(context).pop();
                      },
                      child: Text('Update Details'))
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final changeData = Provider.of<ClassData>(context).changeClassData;
    return Container(
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            child: Text(widget.std),
          ),
          title: Text(widget.teacher),
          subtitle: Text('Total Students: ${widget.totalStudents}'),
          trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => _editClassData(context, changeData)),
        ),
      ),
    );
  }
}
