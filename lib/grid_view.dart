import 'package:flutter/material.dart';

class GridViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CreateGridViewPage();
  }
}

class _CreateGridViewPage extends State<GridViewPage> {
  int counterPictures = 0;
  List<String> picturesList = <String>[
    'https://mir-s3-cdn-cf.behance.net/project_modules/1400_opt_1/54ce0586956701.5da9012fe59a2.jpg',
    'https://mir-s3-cdn-cf.behance.net/project_modules/1400_opt_1/bb5c9f81396841.5cfe9fc44dc84.jpg',
    'https://mir-s3-cdn-cf.behance.net/project_modules/1400_opt_1/a894fc50270159.58cbdba8d6162.jpg',
    'https://mir-s3-cdn-cf.behance.net/project_modules/1400_opt_1/b6606a62935843.5aa048a0e3293.jpg',
    'https://mir-s3-cdn-cf.behance.net/project_modules/1400_opt_1/fb6f3c81635843.5d05801db1c8c.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        leading: Icon(Icons.view_headline),
        title: Text('Broadcast',
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Helvetica')),
      ),
      body: _buildList(),
      backgroundColor: const Color.fromARGB(41, 70, 70, 0),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: (picturesList.length > counterPictures)
              ? () => _addNewItem()
              : _showDialog,
          tooltip: 'Add',
          child: Icon(Icons.add)),
    );
  }

  Widget _buildList() {
    return GridView.builder(
        itemCount: counterPictures,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.black,
            child: GridTile(
              child: Image.network(
                picturesList[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        });
  }

  void _addNewItem() {
    setState(() {
      counterPictures++;
    });
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Only 5 pictures'),
            actions: <Widget>[
              FlatButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
