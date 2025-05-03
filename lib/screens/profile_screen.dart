import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../provider/user_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late User? user;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    user = context.read<UserProvider>().user;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Your account Information'),
        Text('Name :${user!.name}'),
        Text('Last name : ${user!.lastName}'),
        Text('Age : ${user!.age}'),
        Text('Gender${user!.gender}'),
        Image.network(user!.image),
      ],
    );
  }
}
