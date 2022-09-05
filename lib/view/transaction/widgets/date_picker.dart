// import 'package:flutter/material.dart';
// import 'package:money_manager/controller/provider/addtransaction/add_transaction_provider.dart';
// import 'package:money_manager/controller/provider/themeprovidr.dart';
// import 'package:money_manager/controller/provider/updatetransaction/update_transaction.dart';
// import 'package:money_manager/utilities/colors.dart';
// import 'package:provider/provider.dart';

// class DatePickerWidget extends StatelessWidget {
//   const DatePickerWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);
//     final editProvider =
//         Provider.of<UpdateTransactionProvider>(context, listen: false);
//     final addProvider =
//         Provider.of<AddTransactionProvider>(context, listen: false);
//     return Container(
//         width: 320,
//         height: 60,
//         decoration: BoxDecoration(
//           color: themeProvider.themeMode == ThemeMode.dark
//               ? Colors.grey[600]
//               : Colors.grey[400],
//           borderRadius: BorderRadius.circular(30),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(children: [
//             CircleAvatar(
//               backgroundColor: themeProvider.themeMode == ThemeMode.dark
//                   ? Colors.indigo
//                   : Colors.green,
//               child: const Icon(
//                 // MyFlutterApp.calender,
//                 Icons.calendar_month,
//                 color: Colors.white,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 8),
//               child: SizedBox(
//                   width: 210,
//                   height: 60,
//                   child: Consumer<AddTransactionProvider>(
//                       builder: (context, value, child) {
//                     return TextButton(
//                         onPressed: () {
//                           Provider.of<AddTransactionProvider>(context,
//                                   listen: false)
//                               .selectdate(context)
//                               .toString();
//                         },
//                         child: Row(
//                           children: [
//                             Text(
//                               '${editProvider.updateTime.day} ${addProvider.month[addProvider.selectedDate.month - 1]}',
//                               style: const TextStyle(
//                                 color: blackColor,
//                                 fontSize: 17,
//                               ),
//                             ),
//                           ],
//                         ));
//                   })),
//             )
//           ]),
//         ));
//   }
// }
