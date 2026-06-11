# ALU Connect

A Flutter mobile application for African Leadership University (ALU) students to discover campus events, join clubs, swap skills, and connect with peers via messaging.

---

## Overview

ALU Connect is a campus community app built in Flutter. It supports two user roles — **Student** and **Club Leader** — each with different access levels. The app is structured around four main sections: Home, Groups, Chat, and Profile.

---

## Features

### Authentication & Onboarding
- Welcome screen with role selection (Student or Club Leader)
- Sign-in via Google or Apple (UI implemented; auth logic is simulated)
- Guest access option

### Home
- Personalized greeting
- Search bar for events, people, and clubs
- Live Now section showing currently active events
- Event feed with RSVP functionality
- Tap-through to a full Event Details screen (date, time, location, category, description)

### Groups
Two tabs:

**Communities**
- Browse and join ALU clubs (Robotics Club, Founders Society, Creative Arts, Debate Club, Utajiri Club, Sentinel Sports)
- Joined clubs are separated from available clubs
- Club Leaders see an additional "+" button to post opportunities

**Skill Swap Board**
- ALU-exclusive board where students post skills they can teach or want to learn
- Example listings: Flutter & Dart, Web Development, Financial Modelling in Excel
- Connect button to reach out to other students
- "Post a skill" button for new listings

### Chat
- Community group chats (Tech Club, Business Hub, ALU Hackathon 2026)
- Direct messages
- Full chat detail screen with message bubbles and a live message input

### Profile
- Displays student name, degree, and year (e.g. Anysie Ishimwe, Computer Science Year 2)
- Stats: events attended, clubs joined, skills listed
- Menu items: My RSVPs, My Achievements, Settings, Help & Support

### Club Leader — Post Opportunity
- Accessible via the Groups screen when signed in as Club Leader
- Form fields: Title, Category (Workshop / Hackathon / Startup / Leadership / Internship / Community), Description, Date picker, Location, Target community
- Publishes opportunity on submit

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Material 3) |
| Language | Dart (SDK ^3.11.5) |
| State Management | `provider` ^6.1.1 |
| Local Storage | `shared_preferences` ^2.2.2 |
| Fonts | `google_fonts` ^6.1.0 (Poppins) |
| Icons | Material Icons + Cupertino Icons |

### Platform Support
The project includes platform folders for Android, iOS, Web, Linux, macOS, and Windows.

---

## Project Structure

```
lib/
├── main.dart                        # App entry point, MaterialApp setup
├── screens/
│   ├── first_screen.dart            # HomeScreen and its sub-widgets
│   └── event_details_screen.dart    # Full event detail view
└── src/
    ├── welcome.dart                 # Onboarding and role selection
    ├── home.dart                    # Main navigation scaffold (bottom nav)
    ├── groups.dart                  # Groups screen (Communities + Skill Swap)
    ├── chat.dart                    # Chat list and chat detail screen
    ├── profile.dart                 # User profile screen
    └── post.dart                    # Post Opportunity form (Club Leaders only)
```

---

## Getting Started

### Prerequisites
- Flutter SDK (compatible with Dart ^3.11.5)
- Android Studio or Xcode for device/emulator setup

### Run the app

```bash
git clone https://github.com/albertniyo/project1.git
cd project1
flutter pub get
flutter run
```

---

## Branches

| Branch | Description |
|---|---|
| `main` | Stable base |
| `Lead-branch` | Lead developer integration branch |
| `Color-consistent` | UI color consistency work |
| `bottomnav` | Bottom navigation development |
| `dev1_auth-profile` | Authentication and profile screen development |
| `louis_events` | Events feature development |

---

## Notes

- Authentication is UI-only in the current version; Google and Apple sign-in buttons navigate directly without actual OAuth.
- All data (events, clubs, messages, profiles) is hardcoded as mock data — there is no backend or API connection.
- The app color scheme is built around `#2E7D32` (dark green), consistent with ALU branding.
