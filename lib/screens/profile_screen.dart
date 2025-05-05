import 'package:flutter/material.dart';
import 'package:lab52/widgets/profile_data_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your account Information'),
        automaticallyImplyLeading: false,
      ),
      body: Center(child: ProfileDataView()),
    );
  }
}
