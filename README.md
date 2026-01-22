# Real Life Inventory

Add everything you own in real life. This app helps you to organize and declutter your stuff. This is especially helpful if you want to move to a new home or do a Frühjahrsputz.

## Project Overview
**Real Life Inventory** is a Flutter-based mobile application designed to help users digitize their physical belongings to organize their homes and facilitate decluttering. Unlike standard inventory apps which function primarily as static databases, this project focuses heavily on the *process* of curation—deciding what to keep, what to throw away, and what to move.

### Core Idea & Uniqueness
The core value proposition is **Gamified Decluttering**.

The unique differentiator is the **Declutter Mode**, implemented effectively as "Tinder for your stuff." Instead of staring at a list, the user enters a "Session" where they are presented with items one by one and must make a binary decision via swiping gestures:
*   **Swipe Left:** Mark to **Toss**.
*   **Swipe Right:** Mark to **Keep**.
*   **Swipe Up:** Mark to **Move**.

This transforms the tedious task of cleaning (referenced as "Frühjahrsputz") into actionable micro-tasks.

### Detailed Features

#### 1. AI-Assisted Item Capture
The app streamlines adding items through an intelligent camera flow.
*   **Camera:** Users can take photos of items.
*   **AI Tagging:** The app suggest item names and tags based on the image content, reducing manual data entry.

#### 2. The Declutter Hub
Located in declutter, this feature drives the organizational workflow.
*   **Sessions:** Users can start different types of sessions:
    *   **Quick Check:** A fast session limited to a specific number of items (e.g., 10).
    *   **By Location:** Review everything in a specific room.
    *   **By Tag:** Review a specific category of items.
*   **Swipe Interface:** The `SwipeScreen` uses a card-stack UI where users physically swipe items to categorization buckets.

#### 3. Task Management
Decisions made during decluttering sessions are converted into actionable tasks in the **Tasks Screen**.
*   **Toss List:** Items marked for disposal appear here.
*   **Move List:** Items that belong in a different location appear here.
*   Users can check these off as they physically complete the actions.

#### 4. Inventory Overview & Organization
The app provides a visual catalog of possessions.
*   **Dashboard:** The `OverviewScreen` displays items organized by rooms (e.g., Living Room, Bedroom).
*   **Item Details:** Users can track specific details defined in `Item`, including:
    *   Condition (Pristine, Good, Fair, Worn, Damaged).
    *   Location and Tags.
    *   Purchase notes.
*   **Archive:** Items can be archived without deleting them permanently.

### Technical Architecture
*   **Framework:** Flutter.
*   **Database:** ObjectBox (NoSQL local database) for high-performance offline storage.
*   **State Management:** `flutter_bloc`.
*   **Dependency Injection:** `get_it` and `injectable`.
*   **Architecture:** Clean Architecture (separated into `domain`, `data`, and `presentation` layers per feature).