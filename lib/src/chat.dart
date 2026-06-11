import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(title: const Text('Messages')),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Text(
              'Community Chats',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          _buildChatTile(
            context,
            name: 'Tech club',
            message: 'Ishime: Anyone joining the hackathon...',
            time: '2m',
            isGroup: true,
          ),
          _buildChatTile(
            context,
            name: 'Business Hub',
            message: 'New startup pitch session announced...',
            time: '1h',
            isGroup: true,
          ),
          _buildChatTile(
            context,
            name: 'ALU Hackathon 2026',
            message: 'You: Yes! I\'m in 😊',
            time: '3h',
            isGroup: true,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Text(
              'Direct Messages',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          _buildChatTile(
            context,
            name: 'Nilan Mugisha',
            message: 'Can we meet before the workshop?',
            time: '30m',
            isGroup: false,
          ),
          _buildChatTile(
            context,
            name: 'Zara Butera',
            message: 'Thanks for the notes! 👏',
            time: 'Yesterday',
            isGroup: false,
          ),
        ],
      ),
    );
  }

  Widget _buildChatTile(
    BuildContext context, {
    required String name,
    required String message,
    required String time,
    required bool isGroup,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color(0xFF2E7D32).withValues(alpha: 0.1),
        child: Icon(
          isGroup ? Icons.group : Icons.person,
          color: const Color(0xFF2E7D32),
        ),
      ),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis),
      trailing: Text(
        time,
        style: TextStyle(fontSize: 11, color: Colors.grey.shade500),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatDetailScreen(chatName: name, isGroup: isGroup),
          ),
        );
      },
    );
  }
}

class ChatDetailScreen extends StatefulWidget {
  final String chatName;
  final bool isGroup;

  const ChatDetailScreen({
    super.key,
    required this.chatName,
    required this.isGroup,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();
  late List<Map<String, dynamic>> _messages;

  @override
  void initState() {
    super.initState();
    _messages = _getInitialMessages(widget.chatName);
  }

  List<Map<String, dynamic>> _getInitialMessages(String chatName) {
    if (chatName == 'Tech club') {
      return [
        {
          'name': 'Ishime',
          'text': 'Hey everyone! Hackathon is this Friday 😊',
          'isMe': false,
        },
        {
          'name': 'Nilan Mugisha',
          'text': 'Amazing! Anyone want to form a team?',
          'isMe': false,
        },
        {
          'name': 'You',
          'text': 'Yes! I\'m in 😊 — design + frontend',
          'isMe': true,
        },
        {
          'name': 'Zara Butera',
          'text': 'Count me in too! Backend dev here 😊',
          'isMe': false,
        },
        {
          'name': 'You',
          'text': 'Let\'s create a team group chat!',
          'isMe': true,
        },
      ];
    } else {
      return [
        {
          'name': 'Nilan Mugisha',
          'text': 'Can we meet before the workshop?',
          'isMe': false,
        },
        {'name': 'You', 'text': 'Sure! What time works for you?', 'isMe': true},
        {'name': 'Nilan', 'text': 'How about 2pm at Hub 3?', 'isMe': false},
      ];
    }
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add({'name': 'You', 'text': text, 'isMe': true});
      _messageController.clear();
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.chatName),
            if (widget.isGroup)
              Text(
                '24 members • Active',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
          ],
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[_messages.length - 1 - index];
                return _buildMessageBubble(
                  msg['name']!,
                  msg['text']!,
                  msg['isMe']!,
                );
              },
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String name, String text, bool isMe) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints: BoxConstraints(maxWidth: 250),
        decoration: BoxDecoration(
          color: isMe ? const Color(0xFF2E7D32) : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMe && name != 'You')
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: isMe ? Colors.white70 : const Color(0xFF2E7D32),
                ),
              ),
            const SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(color: isMe ? Colors.white : Colors.black87),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey.shade200, blurRadius: 4)],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
              onSubmitted: (_) => _sendMessage(),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: _sendMessage,
            child: CircleAvatar(
              backgroundColor: const Color(0xFF2E7D32),
              child: const Icon(Icons.send, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
