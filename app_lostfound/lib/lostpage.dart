import 'dart:convert';
import 'package:app_lostfound/bottom_navbar.dart';
import 'package:app_lostfound/editlost.dart';
import 'package:app_lostfound/foundpage.dart';
import 'package:app_lostfound/homepage.dart';
import 'package:app_lostfound/lostdetail.dart';
import 'package:flutter/material.dart';
import 'package:app_lostfound/ip.dart';
import 'package:http/http.dart' as http;

class LostPage extends StatefulWidget {
  const LostPage({super.key});

  @override
  State<LostPage> createState() => _LostPageState();
}

class _LostPageState extends State<LostPage> {
  int _currentIndex = 0;
  List _listdata = [];
  bool _loading = true;

  Future _getdata() async {
    try {
      final respon =
          await http.get(Uri.parse('http://$ipv4/api_lostfound/lost/read.php'));
      if (respon.statusCode == 200) {
        final data = jsonDecode(respon.body);
        setState(() {
          _listdata = data;
          _loading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future _hapus(String id) async {
    try {
      final respon = await http
          .post(Uri.parse('http://$ipv4/api_lostfound/lost/delete.php'), body: {
        "lost_id": id,
      });
      if (respon.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getdata();
    super.initState();
  }

  void _onItemTapped(int index) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LostPage()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FoundPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(58, 87, 232, 1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Lost Item",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.person,
                                size: 30, color: Colors.white),
                            onPressed: () => {},
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(top: 5, bottom: 20),
                        width: MediaQuery.of(context).size.width,
                        height: 55,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Cari",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                            ),
                            prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 10),
                                child: Icon(
                                  Icons.search,
                                  size: 20,
                                )),
                            suffixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Icon(
                                  Icons.filter_list,
                                  size: 20,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Catalogue
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.55,
                    crossAxisSpacing: 5, // Horizontal spacing
                    mainAxisSpacing: 5, //Vertical spacing
                  ),
                  itemCount: _listdata.length,
                  itemBuilder: (context, index) {
                    var data = _listdata[index];
                    return Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Card(
                        surfaceTintColor: Colors.grey,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LostDetail(
                                  ListData: {
                                    'lost_id': data['lost_id'],
                                    'itempic': data['itempic'],
                                    'name': data['name'],
                                    'datelost': data['datelost'],
                                    'itemdesc': data['itemdesc'],
                                    'itemcat': data['itemcat'],
                                    'contact': data['contact'],
                                    'itemloc': data['itemloc'],
                                  },
                                ),
                              ),
                            );
                          },

                          // Catalogue
                          child: GridTile(
                            child: Container(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.network(
                                    data['itempic'],
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 4),
                                  Text(data['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 4),
                                  Text(data['datelost']),
                                  Text(data['itemdesc'],
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis),
                                ],
                              ),
                            ),

                            // Edit Items
                            footer: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => EditLost(
                                            ListData: {
                                              'lost_id': data['lost_id'],
                                              'itempic': data['itempic'],
                                              'name': data['name'],
                                              'datelost': data['datelost'],
                                              'itemdesc': data['itemdesc'],
                                              'itemcat': data['itemcat'],
                                              'contact': data['contact'],
                                              'itemloc': data['itemloc'],
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.edit)),

                                // Delete Items
                                IconButton(
                                    onPressed: () {
                                      showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: ((context) {
                                            return AlertDialog(
                                                content: Text(
                                                    'Are you sure you want to delete this data?'),
                                                actions: [
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        _hapus(data['lost_id'])
                                                            .then((value) {
                                                          Navigator.pushAndRemoveUntil(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      ((context) =>
                                                                          LostPage())),
                                                              (route) => false);
                                                        });
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Color
                                                                      .fromRGBO(
                                                                          58,
                                                                          87,
                                                                          232,
                                                                          1)),
                                                      child: Text('Yes',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white))),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Color
                                                                      .fromRGBO(
                                                                          58,
                                                                          87,
                                                                          232,
                                                                          1)),
                                                      child: Text('No',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .white))),
                                                ]);
                                          }));
                                    },
                                    icon: Icon(Icons.delete)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
