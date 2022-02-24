// body: StreamBuilder<QuerySnapshot>(
//           stream: testing,
//           builder: (
//             BuildContext context,
//             AsyncSnapshot<QuerySnapshot> snapshot,
//           ) {
//             if (snapshot.hasError) {
//               return Text('Some error');
//             }
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Text('loading');
//             }
//             final data = snapshot.requireData;
//             return ListView.builder(
//                 itemCount: data.size,
//                 itemBuilder: (context, index) {
//                   final bo = data.docs[index]['bo'];
//                   final chi = data.docs[index]['ho'];
//                   return Text('Bo la $bo, Chi la $chi');
//                 });
//           },
//         )