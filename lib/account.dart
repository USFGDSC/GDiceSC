import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text( "My Account" ),
        automaticallyImplyLeading: false,
      ),
      body: const Center( child: Text("Account"), ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (selectedIndex) {
          String snackBarMessage = selectedIndex == 0 ? "Account changes saved!" : "Account changes discarded";
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text( snackBarMessage ),
              action: SnackBarAction(
                label: "Ok",
                onPressed: () {},
              )
            )
          );
          Navigator.pop(context);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon( Icons.save ),
            label: "Save",
          ),
          BottomNavigationBarItem(
            icon: Icon( Icons.delete ),
            label: "Discard",
          ),
        ],
      ),
    );
  }
}