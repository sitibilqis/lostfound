import 'package:flutter/material.dart';

class DetailItems extends StatefulWidget {
  final Map ListData;
  DetailItems({Key? key, required this.ListData}) : super(key: key);

  @override
  State<DetailItems> createState() => _DetailItemsState();
}

class _DetailItemsState extends State<DetailItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Items'),
        backgroundColor: Color.fromRGBO(58, 87, 232, 1),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Card(
            elevation: 12,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        widget.ListData['itempic'],
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text('Name'),
                    subtitle: Text(widget.ListData['name']),
                  ),
                  ListTile(
                    title: Text('Date Found'),
                    subtitle: Text(widget.ListData['datefound']),
                  ),
                  ListTile(
                    title: Text('Item Description'),
                    subtitle: Text(widget.ListData['itemdesc']),
                  ),
                  ListTile(
                    title: Text('Item Category'),
                    subtitle: Text(widget.ListData['itemcat']),
                  ),
                  ListTile(
                    title: Text('Contact'),
                    subtitle: Text(widget.ListData['contact']),
                  ),
                  ListTile(
                    title: Text('Item Location'),
                    subtitle: Text(widget.ListData['itemloc']),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
