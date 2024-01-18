import 'package:blood/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DietChart extends StatelessWidget {
  const DietChart({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainBottomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const BackButton(color: Colors.white),
          title: const Text('Diet Chart'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20),
                const Text('Before Blood Donation', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                const SizedBox(height: 15),
                const Text("First of all, try to relax. Being scared makes your body tense up and makes the whole thing take longer. In terms of food, before you give blood it's essential that your iron levels are high and that you're as hydrated as possible. Here's 5 foods to eat before you donate:", style: TextStyle(letterSpacing: 0.4, fontSize: 13, color: Colors.black)),
                const SizedBox(height: 15),
                const Text('1. Water', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
                const SizedBox(height: 10),
                Image.asset('assets/water.jpg', width: MediaQuery.of(context).size.width-32, height: 210, fit: BoxFit.cover),
                const SizedBox(height: 10),
                const Text("This one really has nothing to do with iron levels, but it is by far the most important thing to eat (drink) before you donate blood. Being sufficiently hydrated makes the whole process easier and helps you to feel less lightheaded when it's over.", style: TextStyle(letterSpacing: 0.4, fontSize: 13, color: Colors.black)),
                const SizedBox(height: 15),
                const Text('2. Lentils', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
                const SizedBox(height: 10),
                Image.asset('assets/red lentils.png', width: MediaQuery.of(context).size.width-32, height: 210, fit: BoxFit.cover),
                const SizedBox(height: 10),
                const Text("Red meat not your thing? No problem. Lentils are absolutely packed with iron, along with tons of other important nutrients, making them one of the healthiest foods out there.", style: TextStyle(letterSpacing: 0.4, fontSize: 13, color: Colors.black)),
                const SizedBox(height: 15),
                const Text('3. Spinach', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
                const SizedBox(height: 10),
                Image.asset('assets/spinach.png', width: MediaQuery.of(context).size.width-32, height: 210, fit: BoxFit.cover),
                const SizedBox(height: 10),
                const Text("Channel your inner Popeye and load up on spinach before you donate blood. It's super versatile — sauté it, add it to a green smoothie, or use it as a vitamin-packed base for your favorite salad — and also surprisingly hydrating. Win win.", style: TextStyle(letterSpacing: 0.4, fontSize: 13, color: Colors.black)),
                const SizedBox(height: 15),
                const Text('4. Lean Red Meat', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
                const SizedBox(height: 10),
                Image.asset('assets/lean red meat.jpg', width: MediaQuery.of(context).size.width-32, height: 210, fit: BoxFit.cover),
                const SizedBox(height: 10),
                const Text("While it's true that red meat should be eaten in moderation, it's not a bad idea to eat a steak before you give blood. With 2.4 milligrams of iron per 100 grams of meat, you'll pass the hemoglobin test with flying colors. Just make sure it's not too fatty.", style: TextStyle(letterSpacing: 0.4, fontSize: 13, color: Colors.black)),
                const SizedBox(height: 15),
                const Text('5. Watermelon', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
                const SizedBox(height: 10),
                Image.asset('assets/watermelon.jfif', width: MediaQuery.of(context).size.width-32, height: 210, fit: BoxFit.cover),
                const SizedBox(height: 10),
                const Text("Do you have trouble just drinking plain water? Try eating a hydrating watermelon instead. If you're not into watermelon, strawberries are another ultra-hydrating fruit that are perfect for eating before you donate blood.", style: TextStyle(letterSpacing: 0.4, fontSize: 13, color: Colors.black)),
                const SizedBox(height: 20),
                const Text('After Blood Donation', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                const SizedBox(height: 15),
                const Text("Congrats! You just made a difference in as many as three people's lives. Re-hydrate and treat yo'self for being a good person with these 5 foods: ", style: TextStyle(letterSpacing: 0.4, fontSize: 13, color:Colors.black)),
                const SizedBox(height: 15),
                const Text('1. Juice', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
                const SizedBox(height: 10),
                Image.asset('assets/juice.png', width: MediaQuery.of(context).size.width-32, height: 210, fit: BoxFit.cover),
                const SizedBox(height: 10),
                const Text("Ditch the boring water for a sweeter, hydrating option. If you're not about added sugars, try coconut water or a cold-pressed juice.", style: TextStyle(letterSpacing: 0.4, fontSize: 13, color: Colors.black)),
                const SizedBox(height: 15),
                const Text('2. Avocado', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
                const SizedBox(height: 10),
                Image.asset('assets/avocado.png', width: MediaQuery.of(context).size.width-32, height: 210, fit: BoxFit.cover),
                const SizedBox(height: 10),
                const Text("Since you're supposed to avoid fatty foods before you donate, be sure to go ham on some avocados afterwards. On top of being delicious, they're packed full of omega-3's. Score! Whether you smash it on top of a piece of toast or turn it into guac, there's really no way to go wrong here.", style: TextStyle(letterSpacing: 0.4, fontSize: 13, color: Colors.black)),
                const SizedBox(height: 15),
                const Text('3. Cookies', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
                const SizedBox(height: 10),
                Image.asset('assets/cookies.png', width: MediaQuery.of(context).size.width-32, height: 210, fit: BoxFit.cover),
                const SizedBox(height: 10),
                const Text("No nutritional value here, but hey — you deserve a treat. While the blood drive will likely provide these, you can also bake your own.", style: TextStyle(letterSpacing: 0.4, fontSize: 13, color: Colors.black)),
                const SizedBox(height: 15),
                const Text('4. Cereal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
                const SizedBox(height: 10),
                Image.asset('assets/cereal.png', width: MediaQuery.of(context).size.width-32, height: 210, fit: BoxFit.cover),
                const SizedBox(height: 10),
                const Text("Not only is cereal the trendiest food of 2017, but also it's often fortified with iron. Opt for a low-sugar variety like cheerios or chex if you're tryna be extra healthy (but let's be real, lucky charms = life).", style: TextStyle(letterSpacing: 0.4, fontSize: 13, color: Colors.black)),
                const SizedBox(height: 15),
                const Text('5. Mocktails', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
                const SizedBox(height: 10),
                Image.asset('assets/mocktails.png', width: MediaQuery.of(context).size.width-32, height: 210, fit: BoxFit.cover),
                const SizedBox(height: 10),
                const Text("The Red Cross recommends avoiding alcohol for at least 24 hours after you donate blood. Don't get too down, though, because there are tons of fun mocktails you can drink. I guarantee you won't even miss the alcohol.", style: TextStyle(letterSpacing: 0.4, fontSize: 13, color: Colors.black)),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}