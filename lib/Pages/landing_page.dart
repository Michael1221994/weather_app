import 'package:flutter/material.dart';
import 'package:weather_app/Pages/home.dart';
import 'dart:math';
import 'package:weather_app/util/button.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => __LandingPageState();
}

class __LandingPageState extends State<LandingPage> {
  Color? backgroundColor= Colors.transparent;
  Color? TextColor= Colors.white; 
  List<String> Riddles = [
  "I'm the mighty thunder's roar, wielded by Zeus in skies I soar. With lightning bolts, I strike and score, commanding storms forevermore. What am I?",
  "I'm the gentle breeze that whispers by, stirred by Zephyrus' tender sigh. With a touch as soft as a lover's tie, I dance through fields beneath the sky. What am I?",
  "I'm the tempest's fury unbound, spawned by Poseidon's realm profound. With crashing waves, I astound, ruling oceans with a trident crowned. What am I?",
  "I'm the icy grip that winter wields, crafted by Boreas' breath that chills. With frost and snow, my realm fulfills, freezing lands with wintry frills. What am I?",
  "I'm the radiant light of the night, guided by Artemis' celestial might. With a glow that banishes dark from sight, I bathe the world in silvery delight. What am I?",
  "I'm the dawn's first light, heralded by Eos' flight. Painting skies in hues so bright, I chase away the longest night. What am I?",
  "I'm the fierce gale's howling cry, driven by Aeolus from the sky. With a force that makes the stoutest sigh, I bend the trees as I fly by. What am I?",
  "I'm the soft and steady rain, blessed by Hera to soothe the plain. Nourishing earth, without disdain, I wash away the dust and pain. What am I?",
  "I'm the scorching midday heat, Helios' chariot can't be beat. Blazing down with no retreat, I make the world beneath my seat. What am I?",
  "I'm the autumn leaves that fall, Demeter's touch affects them all. With colors bright, I heed her call, heralding winter's frosty thrall. What am I?",
  "I'm the rainbow in the sky, Iris' bridge that arcs so high. With colors vivid, I amplify, the beauty of the rain gone by. What am I?",
  "I'm the misty morning veil, conjured by Hecate's hidden trail. Cloaking valleys, soft and pale, I make the world seem quite surreal. What am I?",
  "I'm the summer's warming breath, Apollo's gift that guards from death. With rays that heal and energy bequeath, I thrive in light, and all beneath. What am I?",
  "I'm the crisp and chilling breeze, autumn's whisper through the trees. Brought by Notus with graceful ease, I signal change with every tease. What am I?",
  "I'm the ocean's ebb and flow, tied to Selene's lunar show. With rhythmic grace, I come and go, in tides that ancient sailors know. What am I?",
  "I'm the fertile morning dew, brought by Hebe, fresh and new. Bestowing life in drops of blue, I nurture plants with every view. What am I?",
  "I'm the storm's electric flare, ignited by Zeus' mighty glare. With a flash that lights the air, I leave a mark, both bold and rare. What am I?",
  "I'm the winter's silent night, Hestia's calm without a fight. With stars that twinkle, cold and bright, I wrap the world in peaceful light. What am I?",
  "I'm the desert's arid sweep, driven by Khamsin's hasty leap. With scorching winds that make one weep, I guard the sands in endless sleep. What am I?",
  "I'm the flood's relentless force, shaped by Oceanus' course. With waters rising without remorse, I alter lands from their source. What am I?",
  "I'm the spring's first gentle bloom, Persephone's return from gloom. With flowers that chase away the doom, I bring forth life, banishing the tomb. What am I?",
  "I'm the frost on windowpane, crafted by Boreas' icy reign. With patterns intricate and arcane, I whisper winter's sweet refrain. What am I?",
  "I'm the twilight's dusky hue, ushered by Hesperus in view. With a sky of deepening blue, I mark the day's adieu. What am I?",
  "I'm the mountain's snowy crest, crowned by Khione's chilling zest. With peaks that stand the ultimate test, I offer a cold and silent rest. What am I?",
  "I'm the forest's morning haze, Athena's wisdom in the maze. With a mystic touch that leaves one dazed, I weave through trees in countless ways. What am I?",
  "I'm the tranquil autumn morn, where Dionysus' grapes adorn. With harvests ripe and fields reborn, I celebrate the season's corn. What am I?",
  "I'm the sun's eclipsing shade, drawn by Selene's careful parade. With shadows cast in a celestial trade, I leave the world in awe displayed. What am I?",
  "I'm the gentle evening's glow, cast by Nyx, who rules below. With stars that in the night do show, I bring a peace that few do know. What am I?",
  "I'm the wind's fierce howling gale, sent by Aeolus without fail. With a power that can turn the pale, I command ships to set their sail. What am I?",
  "I'm the harvest's golden light, Demeter's blessing, pure and bright. With fields of plenty in my sight, I mark the end of summer's plight. What am I?"
];



void Go_To_Homepage(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
  setState(() {
    TextColor= Colors.black;
    backgroundColor= Colors.white;
  });
  

}

  int generateRandomNumber(int min, int max) {
  final random = Random();
  return min + random.nextInt(max - min + 1);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
        gradient: LinearGradient(
           begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 61, 15, 1),
            Color.fromARGB(244, 182, 100, 6),
            Color.fromARGB(255, 6, 105, 105),
            Color.fromARGB(255, 4, 6, 119)
          ],
         
        ),
      ),
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Center(
           child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                     Riddles[generateRandomNumber(0, 29)],
                     textStyle: const TextStyle(color: Colors.white),
                     speed: const Duration(milliseconds: 60)
                    )
                  ],
                  totalRepeatCount: 1,
                  repeatForever: false,
                  ),
              const SizedBox(height: 25,),
              MyButton (on_pressed:() => Go_To_Homepage(context), color:backgroundColor, text: "Continue",textcolor:TextColor , ),
            ]
            ),
           ),
        ),
      ),
        
    );
  }
}

 