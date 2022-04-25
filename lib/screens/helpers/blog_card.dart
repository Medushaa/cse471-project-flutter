import 'package:flutter/material.dart';
import 'package:food_um_try1/screens/blog_page.dart';
import 'package:food_um_try1/screens/model/blog_model.dart';
import 'package:intl/intl.dart';

class blogCard extends StatelessWidget {
  final blogModel _blog;

  blogCard(this._blog);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text("Blog Title: ${_blog.title}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    
                    Text("${_blog.blog_body!.substring(0,50)}..."),
                    Spacer(),
                    GestureDetector(
                          //when the text is pressed
                          onTap: () {
                            //openBlog();
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
    // Future openBlog() => showDialog(
    //     context: Context,
    //     builder: (context) => AlertDialog(
    //       title:
    //           Text("Blog Title: ${_blog.title}"),
    //       actions: [
    //         TextButton(
    //           child: Text("Go Back"),
    //           onPressed: () {
    //             Navigator.push(context,
    //               MaterialPageRoute(builder: (context) => BlogPage()));
    //           },
    //         ),
    //       ],
    //     ),
    //   );
  }