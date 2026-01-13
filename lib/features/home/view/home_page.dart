import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:note_app_with_firebase/features/auth/categories/add.dart';
import 'package:note_app_with_firebase/features/auth/view/login_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<QueryDocumentSnapshot<Object?>> data = [];
  bool isLoading = true;

  Future<void> getCategories() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance
            .collection('categories')
            .where('id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .get();  //to show categories i was added not some one else added

    data = querySnapshot.docs;

    // data = querySnapshot.docs
    // .map((doc) => doc.data() as Map<String, dynamic>)
    // .toList();

    // data.addAll(querySnapshot.docs);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          title: Text('Home Page'),
          actions: [
            IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              icon: Icon(Icons.logout_outlined),
            ),
          ],
        ),
        body:
            isLoading
                ? Center(child: CircularProgressIndicator())
                : GridView.builder(
                  itemCount: data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),

                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onLongPress: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          title: 'Are you sure?',
                          desc: 'You want to delete this category?',
                          btnCancel: MaterialButton(
                            child: Text('Cancel'),
                            onPressed: () => Navigator.pop(context),
                            color: Colors.red,
                          ),
                          btnOk: MaterialButton(
                            child: Text('Delete'),
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('categories')
                                  .doc(data[index].id)
                                  .delete();
                              Navigator.pop(context);
                              setState(() {
                                data.removeAt(index);
                              });
                            },
                            color: Colors.green,
                          ),
                        ).show();
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.all(8),
                              child: Image.network(
                                'https://tse3.mm.bing.net/th/id/OIP.iet7biwH0N35PLbiV3QZgAHaFw?rs=1&pid=ImgDetMain&o=7&rm=3',
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text("${data[index]['category']}"),
                          ],
                        ),
                      ),
                    );
                  },
                ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCategory()),
            );
          },
        ),

        /*     FirebaseAuth.instance.currentUser!.emailVerified?
        Text('welcome'):
        ElevatedButton(onPressed: () {
          FirebaseAuth.instance.currentUser!.sendEmailVerification();

        },
            child: Text('verify email'))*/
      ),
    );
  }
}
