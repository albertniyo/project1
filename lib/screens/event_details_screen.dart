import 'package:flutter/material.dart';

class EventDetailsScreen extends StatelessWidget {
  final String label;
  final Color color;
  final String title;

  const EventDetailsScreen({
    super.key,
    required this.label,
    required this.color,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 220,
              width: double.infinity,
              color: color,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white24,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(label),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const ListTile(
                      leading: Icon(Icons.calendar_month),
                      title: Text("Date & Time"),
                      subtitle: Text(
                        "June 12, 2026 • 9:00 AM - 6:00 PM",
                      ),
                    ),
                    Divider(),
                    const ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text("Location"),
                      subtitle: Text(
                        "Innovation Lab, Kigali Campus",
                      ),
                    ),
                    Divider(),
                    const ListTile(
                      leading: Icon(Icons.emoji_events),
                      title: Text("Category"),
                      subtitle: Text(
                        "Hackathon • Tech Club",
                      ),
                    ),
                    Divider(),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Build innovative solutions for real-world challenges. "
                      "Teams of 3–5. Prizes worth \$2,000. Open to all students.",
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: color,
                        ),
                        onPressed: () {},
                        child: const Text(
                          "RSVP - I'm Going!",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}