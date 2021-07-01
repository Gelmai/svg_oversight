import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:service_group/utils/settings.dart';
import '../utils/person.dart';
import 'package:intl/date_symbol_data_local.dart';

class PersonDetail extends StatefulWidget {
  @override
  _PersonDetailState createState() => new _PersonDetailState();

  PersonDetail({this.index});
  final int index;
}

class _PersonDetailState extends State<PersonDetail> {
  DateTime _pickedDate;
  DateTime _loadedDate;

  Future<Null> _selectDate(BuildContext context) async {
    initializeDateFormatting();

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _loadedDate,
        firstDate: DateTime(2016),
        lastDate: DateTime(2030));

    if (picked != null && picked != DateTime.now()) {
      setState(() {
        _pickedDate = picked;
      });
    }
  }

  @override
  void initState() {
    final person = Hive.box('persons').getAt(widget.index);

    if (person.lastShepherded == null) {
      _loadedDate = DateTime.now();
      _pickedDate = DateTime.now();
    } else {
      _loadedDate = DateTime.parse(person.lastShepherded);
      _pickedDate = DateTime.parse(person.lastShepherded);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Person person = Hive.box('persons').getAt(widget.index);
    TextEditingController textController =
        TextEditingController(text: person.notes);
    print('Notes: ${person.notes}');
    print('Last shepherded: ${person.lastShepherded}');
    print('Initial loaded date: $_loadedDate');
    print('Initial picked date: $_pickedDate');

    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(person.firstName + " " + person.lastName),
        actions: <Widget>[
          IconButton(
            //DELETE Button
            icon: Icon(Icons.delete),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Delete person?'),
                      content: Text('This cannot be undone.'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Cancel'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          child: Text('Delete',
                              style: Theme.of(context).textTheme.button),
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                            /*Navigator.of(context)
                                  .popUntil(ModalRoute.withName('/'));*/
                            person.deletePerson(widget.index);
                            //setState(() {});
                          },
                        )
                      ],
                    );
                  });
            },
          )
        ],
      ),
      body: new Center(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.blueGrey,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                      padding:
                          EdgeInsets.only(left: 5.0, top: 20.0, bottom: 20.0)),
                  Text(
                    'Last shepherded: ',
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontSize: 18.0,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '${_pickedDate.month}/${_pickedDate.day}/${_pickedDate.year}',
                      style: TextStyle(fontSize: 24.0, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 20.0,
                  ),
                  TextButton(
                    child: Text('Pick Date'),
                    style: TextButton.styleFrom(
                        primary: Colors.lightGreen[500],
                        backgroundColor: Colors.blueGrey[900],
                        padding: EdgeInsets.symmetric(horizontal: 15.0)),
                    onPressed: () {
                      _selectDate(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.only(left: 5.0)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(left: 5.0, top: 5.0)),
                    Row(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(left: 5.0)),
                        Text(
                            'Next call by: ${_pickedDate.month > 6 ? _pickedDate.month - 6 : _pickedDate.month + 6}/${_pickedDate.day}/${_pickedDate.month > 6 ? _pickedDate.year + 1 : _pickedDate.year}'),
                      ],
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: TextField(
                        controller: textController,
                        autocorrect: true,
                        autofocus: false,
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: 'Enter notes here...',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        //SAVE Button
        child: Icon(Icons.save),
        onPressed: () {
          setState(() {
            person.notes = textController.text;
            person.lastShepherded = _pickedDate.toString();
            print(person.lastShepherded);
            _loadedDate = _pickedDate;
          });

          Navigator.of(context).pop();
        },
      ),
    );
  }
}
