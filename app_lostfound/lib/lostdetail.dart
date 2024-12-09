import 'package:flutter/material.dart';

class LostDetail extends StatefulWidget {
  final Map ListData;
  LostDetail({Key? key, required this.ListData}) : super(key: key);
  // const DetailItems({super.key});

  @override
  State<LostDetail> createState() => _LostDetailState();
}

class _LostDetailState extends State<LostDetail> {
  final formKey = GlobalKey<FormState>();
  TextEditingController lost_id = TextEditingController();
  TextEditingController itempic = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController datelost = TextEditingController();
  TextEditingController itemdesc = TextEditingController();
  TextEditingController itemcat = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController itemloc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    lost_id.text = widget.ListData['lost_id'];
    itempic.text = widget.ListData['itempic'];
    name.text = widget.ListData['name'];
    datelost.text = widget.ListData['datelost'];
    itemdesc.text = widget.ListData['itemdesc'];
    itemcat.text = widget.ListData['itemcat'];
    contact.text = widget.ListData['contact'];
    itemloc.text = widget.ListData['itemloc'];
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ), 
          backgroundColor: Color.fromRGBO(58, 87, 232, 1),
        title: Text('Detail Items', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        ),
        body: Padding(
            padding: const EdgeInsets.all(30),
            child: Card(
                elevation: 12,
                child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            subtitle: Image.network(widget.ListData['itempic']),
                          ),
                          ListTile(
                            title: Text('Lost ID'),
                            subtitle: Text(widget.ListData['lost_id']),
                          ),
                          ListTile(
                            title: Text('Name'),
                            subtitle: Text(widget.ListData['name']),
                          ),
                          ListTile(
                            title: Text('Date Lost'),
                            subtitle: Text(widget.ListData['datelost']),
                          ),
                          ListTile(
                            title: Text('Description'),
                            subtitle: Text(widget.ListData['itemdesc']),
                          ),
                          ListTile(
                            title: Text('Category'),
                            subtitle: Text(widget.ListData['itemcat']),
                          ),
                          ListTile(
                            title: Text('Contact Person'),
                            subtitle: Text(widget.ListData['contact']),
                          ),
                          ListTile(
                            title: Text('Location'),
                            subtitle: Text(widget.ListData['itemloc']),
                          ),
                        ]))))
                        );
  }
}
