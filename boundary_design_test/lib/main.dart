import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ProfileCard(),
      theme: ThemeData.dark(),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF181818),
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: const AssetImage('images/Boundary_logo_11-removebg-preview.png'),
              backgroundColor: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            const Text(
              'BOUNDARY', 
              style: TextStyle(fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.notifications_none, size: 30,),
          SizedBox(width: 16),
          Icon(Icons.menu, size: 30),
          SizedBox(width: 12),
        ],
        leading: SizedBox(
          width: 150,
          height: 50,
          child: Lottie.asset('lottie/lottie_animation.json'),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(Icons.flip_camera_android_outlined, size: 16),
              SizedBox(width: 4),
              Text('뒷면보기', style: TextStyle(fontSize: 15),),
              SizedBox(width: 20,),
            ],
          ),
          SizedBox(height: 10,),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF84DBEC),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '앱/iOS/프론트엔드 개발자 8년',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Color(0xFF84DBEC),
                          shape: BoxShape.circle
                        ),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/kakao.png'),
                          backgroundColor: Color(0xFF84DBEC),
                          radius: 20,
                        ),
                      ),
                      SizedBox(width: 12),
                      CircleAvatar(radius: 20, child: Icon(Icons.play_arrow)),
                      SizedBox(width: 12),
                      CircleAvatar(radius: 20, child: Icon(Icons.camera_alt_outlined)),
                    ],
                  ),
                  const SizedBox(height: 200),
                  const Text(
                    '토스뱅크',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  const Text('Server Developer', 
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('김덕자  |  010-1234-5678', 
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                  Text('T. 02-9902-8900~2', 
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                  Text('F. 02-9902-8900', 
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                  Text('kimkimkim@moham.com', 
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.edit),
              SizedBox(width: 8),
              Text('편집'),
              SizedBox(width: 30),
              Text('|', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),),
              SizedBox(width: 30),
              Icon(Icons.share),
              SizedBox(width: 8),
              Text('공유'),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 35, 37, 37)
            ),
            onPressed: () {},
            child: const Text(
              '명함 전체보기',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Divider(
            color: Colors.white,
            thickness: 0.5,
            height: 0,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '내명함'),
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: '모아요'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: '얘기해요'),
          BottomNavigationBarItem(icon: Icon(Icons.sentiment_satisfied_alt), label: '내정보'),
        ],
      ),
    );
  }
}
