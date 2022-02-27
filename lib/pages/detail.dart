import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:junglewildlifemagazine_mobile/values/textStyle.dart';
import 'package:junglewildlifemagazine_mobile/widgets/ImageSwipe_Widget.dart';
import 'package:junglewildlifemagazine_mobile/widgets/actionBar_widget.dart';

class DetailPage extends StatefulWidget {
  final String idAnimal;
  const DetailPage({Key? key, required this.idAnimal}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final CollectionReference initialization =
      FirebaseFirestore.instance.collection('junglewildlifemagazine');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<dynamic>(
              future: initialization.doc(widget.idAnimal).get(),
              builder: (context, snapshot) {
                //if snapshot has errors
                if (snapshot.hasError) {
                  return Scaffold(
                    body: Center(
                      child: Text(
                        'Error: ${snapshot.error}',
                        style: AppStyle.regularText,
                      ),
                    ),
                  );
                }

                //connect
                if (snapshot.connectionState == ConnectionState.done) {
                  //firebase  doucment data
                  Map<String, dynamic> documentData = snapshot.data.data();
                  //List of Image
                  List imageList = documentData['images'];
                  return ListView(
                    children: [
                      ImageSwipe(imageList: imageList),
                      Text(
                        'Tên khoa học',
                        style: AppStyle.regularText,
                      ),
                      AutoSizeText(
                        '${documentData['tenKhoahoc']}',
                        maxLines: 1,
                      ),
                      Text(
                        'Tên tiếng Việt',
                        style: AppStyle.regularText,
                      ),
                      AutoSizeText(
                        '${documentData['tenTiengViet']}',
                        maxLines: 1,
                      ),
                      Text(
                        'Giới',
                        style: AppStyle.regularText,
                      ),
                      AutoSizeText(
                        '${documentData['gioi']}',
                        maxLines: 1,
                      ),
                      Text(
                        'Ngành',
                        style: AppStyle.regularText,
                      ),
                      AutoSizeText(
                        '${documentData['nganh']}',
                        maxLines: 1,
                      ),
                      Text(
                        'Lớp',
                        style: AppStyle.regularText,
                      ),
                      AutoSizeText(
                        '${documentData['lop']}',
                        maxLines: 1,
                      ),
                      Text(
                        'Bộ',
                        style: AppStyle.regularText,
                      ),
                      AutoSizeText(
                        '${documentData['bo']}',
                        maxLines: 1,
                      ),
                      Text(
                        'Họ',
                        style: AppStyle.regularText,
                      ),
                      AutoSizeText(
                        '${documentData['ho']}',
                        maxLines: 1,
                      ),
                      Text(
                        'Đặc điểm hình thái',
                        style: AppStyle.regularText,
                      ),
                      AutoSizeText(
                        '${documentData['dacDiemhinhthai']}',
                        maxLines: 5,
                      ),
                      Text(
                        'Đặc điểm sinh thái',
                        style: AppStyle.regularText,
                      ),
                      AutoSizeText(
                        '${documentData['dacDiemSinhthai']}',
                        maxLines: 5,
                      ),
                      Text(
                        'Giá trị sử dụng',
                        style: AppStyle.regularText,
                      ),
                      AutoSizeText(
                        '${documentData['giaTrisudung']}',
                        maxLines: 1,
                      ),
                      Text(
                        'Địa điểm',
                        style: AppStyle.regularText,
                      ),
                      AutoSizeText(
                        '${documentData['diaDiem']}',
                        maxLines: 1,
                      ),
                    ],
                  );
                }

                return Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }),
          ActionBar_Widget(hasBack: true, titleTab: '', hasBackground: false)
        ],
      ),
    );
  }
}
