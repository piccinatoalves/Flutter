// import 'package:base/components/Contato.dart';
// import 'package:base/components/PlacarJogo.dart';
// import 'package:flutter/material.dart';

//   List<Contato> _contatos = [
//     new Contato("Paulo Roberto", "Rua Euclides", "emmail@gmail.com"),
//   ];

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {


//   @override
//   Widget build(BuildContext context) {
//     final title = 'Lista Contatos';

//     return MaterialApp(
//       title: title,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//           actions: [
//             IconButton(
//               icon: Icon(
//                 Icons.add,
//                 color: Colors.white,
//               ),
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => CadastroView()),
//                 );
//               },
//             )
//           ],
//         ),
//         body: ListView.builder(
//           itemCount: _contatos.length,
//           itemBuilder: (context, index) {
//             return InkWell(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             ContatoView(_contatos[index])),
//                             // setState(() {});
//                   );
//                 },
//                 child: new Card(
//                   child: PlacarJogo(new ResultadoJogo(
//                       _contatos[index].nome,
//                       _contatos[index].endereco,
//                       _contatos[index].email)),
//                 ));
//           },
//         ),
//       ),
//     );
//   }
// }

// class ContatoView extends StatelessWidget {
//   final ContatoView _contatos;

//   ContatoView(this._contatos);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Contato"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             PlacarJogo(this._contatos),
//             Expanded(
//                 child: Container(
//                     padding: EdgeInsets.all(10),
//                     child: SingleChildScrollView(
//                         child: Text(
//                             "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc. There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.")))),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // class CadastroView extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: Text("Resultado"),
// //         ),
// //         body: Center(
// //           child: Text("ola"),
// //         ));

// //         //  Navigator.of(context).pop();
// //   }
// // }