import 'package:flutter/material.dart';
import 'post.dart';

class GroupsScreen extends StatefulWidget {
  final String role;
  const GroupsScreen({super.key, required this.role});

  @override
  State<GroupsScreen> createState() => _GroupsScreenState();
}

class _GroupsScreenState extends State<GroupsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Groups'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Communities'),
            Tab(text: 'Skill Swap'),
          ],
          indicatorColor: const Color(0xFF2E7D32),
          labelColor: const Color(0xFF2E7D32),
          unselectedLabelColor: Colors.grey,
        ),
        actions: widget.role == 'club_leader'
            ? [
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const PostOpportunityScreen(),
                      ),
                    );
                  },
                  tooltip: 'Post Opportunity (Club Leader)',
                ),
              ]
            : null,
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [CommunitiesTab(), SkillSwapBoard()],
      ),
    );
  }
}

class CommunitiesTab extends StatefulWidget {
  const CommunitiesTab({super.key});

  @override
  State<CommunitiesTab> createState() => _CommunitiesTabState();
}

class _CommunitiesTabState extends State<CommunitiesTab> {
  List<Club> clubs = [
    Club(
      name: 'Robotics Club',
      members: 247,
      description: 'Weekly meetups',
      joined: true,
    ),
    Club(
      name: 'Founders Society',
      members: 189,
      description: 'Entrepreneurship',
      joined: true,
    ),
    Club(
      name: 'Creative Arts',
      members: 94,
      description: 'Design & Arts',
      joined: false,
    ),
    Club(
      name: 'Debate Club',
      members: 112,
      description: 'Public speaking',
      joined: false,
    ),
    Club(
      name: 'Utajiri Club',
      members: 156,
      description: 'Community work',
      joined: false,
    ),
    Club(
      name: 'Sentinel Sports',
      members: 203,
      description: 'All sports',
      joined: false,
    ),
  ];

  void toggleJoin(int index) {
    setState(() {
      clubs[index].joined = !clubs[index].joined;
    });
  }

  @override
  Widget build(BuildContext context) {
    final myClubs = clubs.where((c) => c.joined).toList();
    final allClubs = clubs.where((c) => !c.joined).toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (myClubs.isNotEmpty) ...[
            const Text(
              'My Clubs',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...myClubs.map(
              (club) => _buildClubCard(club, isJoined: true, onJoin: () {}),
            ),
            const SizedBox(height: 24),
          ],
          const Text(
            'All Clubs',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ...allClubs.asMap().entries.map((entry) {
            final index = clubs.indexWhere((c) => c.name == entry.value.name);
            return _buildClubCard(
              entry.value,
              isJoined: false,
              onJoin: () => toggleJoin(index),
            );
          }),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF2E7D32).withValues(alpha: 0.1),
                  Colors.white,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF2E7D32).withValues(alpha: 0.2),
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.flag, color: Color(0xFF2E7D32)),
                const SizedBox(width: 12),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Club Leader?',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Tap the + at the top to post opportunities',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_upward, color: Colors.grey.shade600),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClubCard(
    Club club, {
    required bool isJoined,
    required VoidCallback onJoin,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFF2E7D32).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getClubIcon(club.name),
                color: const Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    club.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${club.members} members • ${club.description}',
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            if (isJoined)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF2E7D32).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Joined',
                  style: TextStyle(
                    color: Color(0xFF2E7D32),
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              )
            else
              ElevatedButton(
                onPressed: onJoin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(70, 32),
                ),
                child: const Text('Join'),
              ),
          ],
        ),
      ),
    );
  }

  IconData _getClubIcon(String name) {
    switch (name) {
      case 'Robotics Club':
        return Icons.code;
      case 'Founders Society':
        return Icons.business_center;
      case 'Creative Arts':
        return Icons.brush;
      case 'Debate Club':
        return Icons.record_voice_over;
      case 'Utajiri Club':
        return Icons.volunteer_activism;
      case 'Sentinel Sports':
        return Icons.sports_soccer;
      default:
        return Icons.group;
    }
  }
}

class Club {
  final String name;
  final int members;
  final String description;
  bool joined;

  Club({
    required this.name,
    required this.members,
    required this.description,
    required this.joined,
  });
}

class SkillSwapBoard extends StatelessWidget {
  const SkillSwapBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [const Color(0xFF2E7D32), const Color(0xFF4CAF50)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Column(
                children: [
                  Text(
                    'Skill Swap Board',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'ALU Exclusive',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Share what you know, learn what you need. Connect with ALU students for skill exchange.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                _buildChip('Can Teach', true),
                const SizedBox(width: 8),
                _buildChip('Want to Learn', false),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'CAN TEACH',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 12),
            _buildSkillCard(
              'Flutter & Dart Development',
              'I can help with Flutter basics to intermediate widgets, state management, animations. Happy to pair-program!',
              'Albert N.',
              'BSE - Year 2',
              'Connect',
            ),
            _buildSkillCard(
              'Web Development',
              'I can help with frontend basics to backend development with NodeJs. Happy to support!',
              'Benitha Y.',
              'BSE - Year 3',
              'Connect',
            ),
            const SizedBox(height: 20),
            const Text(
              'WANT TO LEARN',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 12),
            _buildSkillCard(
              'Financial Modelling in Excel',
              'Looking for someone to teach me Excel-based financial modelling. Can exchange: Python scripting',
              'Rehma K.',
              'BSE - Year 1',
              'Connect',
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Post a skill'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D32),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChip(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF2E7D32) : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildSkillCard(
    String title,
    String description,
    String name,
    String year,
    String action,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: const Color(
                    0xFF2E7D32,
                  ).withValues(alpha: 0.1),
                  child: Text(
                    name[0],
                    style: const TextStyle(color: Color(0xFF2E7D32)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        year,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    action,
                    style: const TextStyle(
                      color: Color(0xFF2E7D32),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
