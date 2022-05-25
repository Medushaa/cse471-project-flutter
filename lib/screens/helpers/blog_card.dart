import 'package:flutter/material.dart';
import 'package:food_um_try1/screens/blog_page.dart';
import 'package:food_um_try1/screens/home_page.dart';
import 'package:food_um_try1/screens/model/blog_model.dart';
import 'package:intl/intl.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() => runApp(
  MaterialApp(
    home: BlogPage(),
    navigatorKey: navigatorKey, // Setting a global key for navigator
  ),
);

class blogCard extends StatelessWidget {
  final blogModel _blog;

  blogCard(this._blog);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Color.fromARGB(255, 250, 255, 210),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      "Blog Title: ${_blog.title}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text("${_blog.blog_body!.substring(0, 50)}..."),
                  Spacer(),
                  GestureDetector(
                    //when the text is pressed
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title:
                              Text("${_blog.title}"),
                          content: Text("${_blog.blog_body!}"),
                          actions: [
                            TextButton(
                              child: Text("Nice"),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      "Veiw Blog",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
