import 'package:flutter/material.dart';
import 'event_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.notifications,
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            GreetingSection(),
            SizedBox(height: 16),

            SearchSection(),
            SizedBox(height: 16),

            LiveNowSection(),
            SizedBox(height: 16),

            TabsSection(),
            SizedBox(height: 16),

            EventCard(
              label: 'Leadership',
              color: Colors.green,
              title: 'ALU Hackathon',
              date: 'Jun 12',
              location: 'Main Hall',
              going: '61 going',
            ),

            SizedBox(height: 16),

            EventCard(
              label: 'Workshop',
              color: Colors.orange,
              title: 'AI for Social Impact',
              date: 'Jun 10',
              location: 'Hub 3',
              going: '22 going',
            ),

            SizedBox(height: 24),
          ],
        ),
      ),

      bottomNavigationBar: const BottomNavSection(),
    );
  }
}

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Good morning,",
          style: TextStyle(fontSize: 18),
        ),
        Text(
          "Anysie 👋",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class SearchSection extends StatelessWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(14),
      ),
      child: const Row(
        children: [
          Icon(Icons.search),
          SizedBox(width: 10),
          Text(
            "Search events, people, clubs...",
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

class LiveNowSection extends StatelessWidget {
  const LiveNowSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                "🔴 Live now",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const Spacer(),
            const Text("3 events happening"),
          ],
        ),

        const SizedBox(height: 12),

        Row(
          children: [
            Expanded(
              child: _SmallEventChip(
                color: Colors.green,
                text: "ALU Pitch Night",
              ),
            ),
            const SizedBox(width: 8),

            Expanded(
              child: _SmallEventChip(
                color: Colors.orange,
                text: "Design Sprint",
              ),
            ),

            const SizedBox(width: 8),

            Expanded(
              child: _SmallEventChip(
                color: Colors.red,
                text: "Debate Society",
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _SmallEventChip extends StatelessWidget {
  final Color color;
  final String text;

  const _SmallEventChip({
    required this.color,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}

class TabsSection extends StatelessWidget {
  const TabsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Chip(label: Text("For you")),
        Text("Trending"),
        Text("My RSVPs"),
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  final String label;
  final Color color;
  final String title;
  final String date;
  final String location;
  final String going;

  const EventCard({
    super.key,
    required this.label,
    required this.color,
    required this.title,
    required this.date,
    required this.location,
    required this.going,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EventDetailsScreen(
                    label: label,
                    color: color,
                    title: title,
                  ),
                ),
              );
            },
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.all(12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(label),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text("RSVP"),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(date),
                    const SizedBox(width: 12),
                    Text(location),
                    const SizedBox(width: 12),
                    Text(going),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavSection extends StatelessWidget {
  const BottomNavSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.groups),
          label: 'Groups',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}