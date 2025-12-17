import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as ModalPageRoute;

class PageDetailsProfil extends StatefulWidget {
  const PageDetailsProfil({super.key});

  @override
  State<PageDetailsProfil> createState() => _PageDetailsProfilState();
}

class _PageDetailsProfilState extends State<PageDetailsProfil> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> params =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text("${params["name"]}"),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Hero(
              tag: params["id"],
              child: CircleAvatar(
                backgroundImage: NetworkImage("${params["urlImage"]}"),
                radius: 100,
              ),
            ),
            Text("${params["name"]}"),
            Text("${params["email"]}"),
          ],
        ),
      ),
    );
  }
}
