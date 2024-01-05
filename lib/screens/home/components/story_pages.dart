import 'package:flutter/material.dart';
import 'package:hapind/models/user_story.dart';
import 'package:story/story_page_view.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryPageView(
        itemBuilder: (context, pageIndex, storyIndex) {
          final user = users[pageIndex];
          final story = user.stories[storyIndex];
          return Stack(
            children: [
              
              Positioned.fill(
                child: Container(color: Color.fromARGB(255, 232, 229, 229)),
              ),
              Positioned.fill(
                top: 60,
                bottom: 60,
                child: Image.network(
                  
                  story.imageUrl,
                  fit: BoxFit.cover,
                   width: double.infinity,
                   
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 8),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(user.imageUrl),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      user.userName,
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      
        initialStoryIndex: (pageIndex) {
          if (pageIndex == 0) {
            return 0;
          }
          return 0;
        },
        pageLength: users.length,
        storyLength: (int pageIndex) {
          return users[pageIndex].stories.length;
        },
        onPageLimitReached: () {
          // Navigator.pop(context);
        },
      ),
    );
  }
}