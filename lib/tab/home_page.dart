import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:junglewildlifemagazine_mobile/pages/detail.dart';
import 'package:junglewildlifemagazine_mobile/values/textStyle.dart';
import 'package:junglewildlifemagazine_mobile/widgets/actionBar_widget.dart';

class HomeTab extends StatelessWidget {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('junglewildlifemagazine');

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<QuerySnapshot>(
          future: ref.get(),
          builder: (context, snapshot) {
            //error
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text(
                    'Error ${snapshot.error}',
                    style: AppStyle.regularText,
                  ),
                ),
              );
            }

            //connect
            if (snapshot.connectionState == ConnectionState.done) {
              return GridView.count(
                padding: EdgeInsets.only(top: 130.0, bottom: 70),
                crossAxisCount: 2,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                children: snapshot.data!.docs.map((e) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                    idAnimal: e.id,
                                  )));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      height: 350.0,
                      padding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              '${e['images'][0]}',
                              fit: BoxFit.cover,
                            ),
                          ),
                          AutoSizeText(
                            '${e['tenTiengViet']}',
                            style: AppStyle.regularText.copyWith(fontSize: 10),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            }

            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          },
        ),
        ActionBar_Widget(
          titleTab: 'Home',
          hasBack: false,
          hasBackground: true,
        ),
      ],
    );
  }
}
