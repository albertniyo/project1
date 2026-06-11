import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_provider.dart';

class _StatBox extends StatelessWidget {
  final String number;
  final String label;

  const _StatBox({
    required this.number,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade300,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              number,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final Color? textColor;

  const _MenuTile({
    required this.title,
    required this.icon,
    required this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
      ),
      onTap: onTap,
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      body: SingleChildScrollView(
        child: Column(
          children: [

            // HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 70,
                bottom: 30,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF0F4D13),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),

              child: Column(
                children: [

                  CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white30,
                    child: Text(
                      auth.userName != null
                          ? auth.userName![0]
                          : 'A',
                      style: const TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    auth.userName ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'ALU Kigali • Software Engineering',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Chip(
                        backgroundColor: Colors.white24,
                        label: Text(
                          auth.userRole == 'club_leader'
                              ? 'Club Leader'
                              : 'Student',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 19, 43, 20),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      const Chip(
                        backgroundColor: Color(0xFF9E8D2E),
                        label: Text(
                          'Class of 2028',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [

                _StatBox(
                  number: '0',
                  label: 'RSVPs',
                ),

                _StatBox(
                  number: '0',
                  label: 'Communities',
                ),

                _StatBox(
                  number: '0',
                  label: 'Connections',
                ),
              ],
            ),

            const SizedBox(height: 20),

            _MenuTile(
              title: 'My RSVPs',
              icon: Icons.event,
              onTap: () {},
            ),

            _MenuTile(
              title: 'My Communities',
              icon: Icons.groups,
              onTap: () {},
            ),

            _MenuTile(
              title: 'Notifications',
              icon: Icons.notifications,
              onTap: () {},
            ),

            _MenuTile(
              title: 'Edit Profile',
              icon: Icons.person,
              onTap: () {
                _showEditDialog(context);
              },
            ),

            _MenuTile(
              title: 'Privacy & Security',
              icon: Icons.lock,
              onTap: () {},
            ),

            _MenuTile(
              title: 'Logout',
              icon: Icons.logout,
              textColor: Colors.red,
              onTap: () async {
                await auth.logout();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    final auth = context.read<AuthProvider>();

    final controller = TextEditingController(
      text: auth.userName,
    );

    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Edit Name'),
          content: TextField(
            controller: controller,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                await auth.updateName(
                  controller.text.trim(),
                );

                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}