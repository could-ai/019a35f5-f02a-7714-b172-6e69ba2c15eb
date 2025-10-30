import 'package:couldai_user_app/screens/home_screen.dart';
import 'package:couldai_user_app/widgets/profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileSelectionScreen extends StatelessWidget {
  const ProfileSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: SvgPicture.asset(
          'assets/logo.svg',
          height: 28,
          colorFilter: const ColorFilter.mode(Colors.red, BlendMode.srcIn),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Edit',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Who's Watching?",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                ProfileCard(
                  name: 'User 1',
                  imageUrl: 'https://placehold.co/150x150/FBC02D/000?text=U1',
                  borderColor: Colors.yellow.shade700,
                  onTap: () {
                     Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                  },
                ),
                ProfileCard(
                  name: 'User 2',
                  imageUrl: 'https://placehold.co/150x150/03A9F4/FFF?text=U2',
                   borderColor: Colors.blue.shade400,
                   onTap: () {
                     Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                  },
                ),
                ProfileCard(
                  name: 'Kids',
                  imageUrl: 'https://placehold.co/150x150/EC407A/FFF?text=Kids',
                   borderColor: Colors.pink.shade300,
                   onTap: () {
                     Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                  },
                ),
                const AddProfileCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
