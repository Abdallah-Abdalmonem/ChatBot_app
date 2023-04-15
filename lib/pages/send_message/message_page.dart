// import 'package:chatbot_app/shared/network/local/componant/button.dart';
// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'bloc_message/message_cubit.dart';
// import 'bloc_message/message_state.dart';
// import 'dart:io';

// class MessageScreen extends StatelessWidget {
//   var commentController = TextEditingController();
//   var data;
//   late File image;
//   var picker;
//   var imagePicker = ImagePicker();
//   uploadImage() async {
//     picker = await imagePicker.pickImage(source: ImageSource.camera);
//     var m=picker.path;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) {
//         return MessageCubit();
//       },
//       child: BlocConsumer<MessageCubit, MessageState>(
//         listener: (context, state) {},
//         builder: (context, state) {
//           var bloc = MessageCubit.get(context);

//           return Scaffold(
//               body: Center(
//             child: Column(
//               children: [
//                 defaultButton(
//                   onPressed: uploadImage,
//                   text: 'Get image',
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 defaultButton(
//                   onPressed: () async {
//                     bloc.creatPostWithImage(
//                         imagePath:
//                           await  picker.path
//                           );
//                   },
//                   text: 'create post',
//                 ),
//               ],
//             ),
//           ));
//         },
//       ),
//     );
//   }
// }
