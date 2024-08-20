import 'dart:html';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/database_services/database_services.dart';
import 'package:flutter_application_1/final.dart';
import 'package:google_fonts/google_fonts.dart';

class next extends StatelessWidget {
  next({super.key});

  final ValueNotifier platinumCheckboxNotifier = ValueNotifier(false);
  final ValueNotifier goldCheckboxNotifier = ValueNotifier(false);
  final ValueNotifier silverCheckboxNotifier = ValueNotifier(false);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 235, 233, 232),
     
      body: ListView(children: [
        Stack(
          children: [
            Image.network(
                "data:image/jpeg;base64,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"),
            Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 226, 219, 216),
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  
                        child: Image.asset("assets/images/photo1.jpeg")),
                      // Text(
                      //     textAlign: TextAlign.center,
                      //     style: GoogleFonts.abhayaLibre(
                      //         fontSize: 50,
                      //         color: Color.fromARGB(255, 147, 117, 106)),
                      //     "JOFILMS"),
                          
                      // Column(
                      // /  children: [
                        //   // Text(
                        //       textAlign: TextAlign.center,
                        //       style: GoogleFonts.abhayaLibre(
                        //           fontSize: 30,
                        //           color: Color.fromARGB(255, 140, 124, 118)),
                        //       "Hi jishna"),
                        //   // Text(
                        //       textAlign: TextAlign.center,
                        //       style: GoogleFonts.abhayaLibre(
                        //           fontSize: 20,
                        //           color: Color.fromARGB(255, 140, 124, 118)),
                        //       "This quote was accepted onAugust 2,2024"),
                        // ],
                      // )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 3.1,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(255, 235, 233, 232),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Color.fromARGB(255, 226, 219, 216),
                        height: MediaQuery.of(context).size.height / 17,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                            style: GoogleFonts.aboreto(
                                fontSize: 20,
                                color: Color.fromARGB(255, 28, 27, 27)),
                            "Client:"),
                      ),
                      Row(
                        children: [
                          Icon(Icons.person_2_outlined),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 60,
                            width: 200,
                            child: TextField(
                              controller: nameController,
                              decoration: InputDecoration(
                                hintText: 'NAME',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  
                                ),
                              ),
                            ),
                          ),
                          // Text("Jishna",style: GoogleFonts.aboreto(fontSize:15,color:Color.fromARGB(255, 28, 27, 27)),),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.mail_outline_rounded),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 60,
                            width: 300,
                            child: TextField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: 'MAIL ID',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  
                                ),
                              ),
                            ),
                          ),
                          // Text("jishnaa21@gmail.com",style: GoogleFonts.aboreto(fontSize:15,color:Color.fromARGB(255, 28, 27, 27)),),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone),
                          SizedBox(
                            width: 20,
                          ),
                          SizedBox(
                            height: 60,
                            width: 200,
                            child: TextField(
                              controller: phoneNoController,
                              decoration: InputDecoration(
                                hintText: 'PHONE NUMBER',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  
                                ),
                              ),
                            ),
                          ),
                          // Text("9048102868",style: GoogleFonts.aboreto(fontSize:15,color:Color.fromARGB(255, 28, 27, 27)),),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height / 3.2,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(255, 235, 233, 232),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Color.fromARGB(255, 226, 219, 216),
                        height: MediaQuery.of(context).size.height / 17,
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                            style: GoogleFonts.aboreto(
                                fontSize: 20,
                                color: Color.fromARGB(255, 28, 27, 27)),
                            "From:"),
                      ),
                      Row(
                        children: [
                          Icon(Icons.person_2_outlined),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "JOFILMS",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 28, 27, 27)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.mail_outline_rounded),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "jofilms.1208@gmail.com",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 28, 27, 27)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "7994960899",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 28, 27, 27)),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "Tirur,Kerala, India",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 28, 27, 27)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                    style: GoogleFonts.aboreto(
                        fontSize: 22, color: Color.fromARGB(255, 28, 27, 27)),
                    "Choose Packages:"),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(255, 248, 246, 245),
                  child: Column(
                    children: [
                      Container(
                        color: Color.fromARGB(255, 226, 219, 216),
                        height: MediaQuery.of(context).size.height / 17,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            ValueListenableBuilder(
                                valueListenable: platinumCheckboxNotifier,
                                builder: (context, isChecked, _) {
                                  return Checkbox(
                                    value: isChecked,
                                    onChanged: (newValue) {
                                      platinumCheckboxNotifier.value = newValue;
                                    },
                                  );
                                }),
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: Icon(Icons.check_box_outline_blank),
                            // ),
                            Text(
                              style: GoogleFonts.aboreto(
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 28, 27, 27)),
                              "PLATINUM:",
                            ),
                            SizedBox(width: 10),
                            Text(
                                textAlign: TextAlign.end,
                                style: GoogleFonts.aboreto(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 28, 27, 27),
                                ),
                                "-INR120,000.00"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                textAlign: TextAlign.left,
                                "Wedding Photography & Films",
                                style:TextStyle(
                                  fontSize: 14,
                             ) ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.left,
                                "*The Wedding Package is designed to capture and document your special day with a balance of creative style combined with contemporary shots.This is especially crafted to larger weddings& events"),
                            SizedBox(
                              height: 20,
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                    
                                    "Event - Day 1",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                Text(
                                  
                                    "Coverage: 8 hours Session",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                Text(
                                    
                                    "Crew details",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                Text(
                                    
                                    "2 Lead Candid Photography",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                Text(
                                    
                                    "2 Lead Candid Cinematographers",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    
                                    "Photo Output:"),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "*200-600 edited images for web upload"),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "*Signature Online Albums for both Bride & Groom sides included"),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "* 80 pages album(40 leaf)both an album will be having 40 sheets accommodating 240 photos"),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "Film Output:"),
                                Text(
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                    textAlign: TextAlign.left,
                                    "*Wedding Film : 3-8 mins film curated by the Lead Editor."),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "*Full Length Movie : Traditional Movie (The duration of the full-length movie depends on the event timeline)."),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "*Traditional coverage photography & films is also handled by the same team."),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color:Color.fromARGB(255, 250, 248, 248),
                  child: Column(
                    children: [
                      Container(
                        color: Color.fromARGB(255, 226, 219, 216),
                        height: MediaQuery.of(context).size.height / 17,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [

                             ValueListenableBuilder(
                                valueListenable: goldCheckboxNotifier,
                                builder: (context, isChecked, _) {
                                  return Checkbox(
                                    value: isChecked,
                                    onChanged: (newValue) {
                                      goldCheckboxNotifier.value = newValue;
                                    },
                                  );
                                }),

                           
                            Text(
                                style: GoogleFonts.aboreto(
                                    fontSize: 25,
                                    color: Color.fromARGB(255, 28, 27, 27)),
                                "GOLD:"),
                            SizedBox(
                              width: 1,
                            ),
                            Container(
                                child: Text(
                                    style: GoogleFonts.aboreto(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 28, 27, 27)),
                                    "-INR95,000.00")),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Wedding Photography & Films",
                                style: TextStyle(
                                  fontSize: 14,
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.left,
                                "*The Wedding Package is designed to capture and document your special day with a balance of creative style combined with contemporary shots.This is especially crafted to larger weddings& events"),
                            SizedBox(
                              height: 20,
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(textAlign: TextAlign.left,"Event - Day 1",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                Text("Coverage: 8 hours Session",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                Text("Crew details",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                Text("2 Lead Candid Photographer",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                Text("2 Lead Candid Cinematographers",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    style:TextStyle (
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                    "Photo Output:"),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    
                                    "*300-900 edited images for web upload"),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "*Signature Online Album for one side"),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "* 80 pages album(40 leaf)both an album will be having 40 sheets accommodating 240 photos"),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "Film Output:"),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "*Wedding Film : 3-8 mins film curated by the Lead Editor."),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "*Full Length Movie : Traditional Movie (The duration of the full-length movie depends on the event timeline)."),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "*Traditional coverage for both photography & films is also handled by the same team."),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(255, 249, 247, 247),
                  child: Column(
                    children: [
                      Container(
                        color: Color.fromARGB(255, 226, 219, 216),
                        height: MediaQuery.of(context).size.height / 17,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                             ValueListenableBuilder(
                                valueListenable: silverCheckboxNotifier,
                                builder: (context, isChecked, _) {
                                  return Checkbox(
                                    value: isChecked,
                                    onChanged: (newValue) {
                                    silverCheckboxNotifier.value = newValue;
                                    },
                                  );
                                }),
                            Text(
                                style: GoogleFonts.aboreto(
                                    fontSize: 25,
                                    color: Color.fromARGB(255, 28, 27, 27)),
                                "SILVER:"),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                style: GoogleFonts.aboreto(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 28, 27, 27)),
                                "-INR65,000.00"),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Wedding Photography & Films",
                                style: TextStyle(
                                  fontSize: 14,
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.left,
                                "*The Wedding Package is designed to capture and document your special day with a balance of creative style combined with contemporary shots.This is especially crafted to larger weddings& events"),
                            SizedBox(
                              height: 20,
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Event - Day 1",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                Text("Coverage: 8 hours Session",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                Text("Crew details",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                Text("1 Photographer",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                Text("1 Cinematographer",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "Photo Output:"),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "*200-400 edited images for web upload"),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "*Signature Online Albums for one side"),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "*80 pages album(40 leaf)both an album will be having 40 sheets accommodating 240 photos"),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "Film Output:"),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "*Wedding Film : 3-8 mins film curated by the Lead Editor."),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "*Full Length Movie : Traditional Movie (The duration of the full-length movie depends on the event timeline)."),
                                Text(
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.left,
                                    "*Traditional coverage photography & films is also handled by the same team."),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

                // Row(
                //   children: [

                //     Text("amount:INR 120,000.00",style: GoogleFonts.aBeeZee(fontSize:20,color:Color.fromARGB(255, 28, 27, 27)),),
                //   ],
                // ), Row(
                //   children: [
                //     Icon(Icons.mail_outline_rounded),
                //     SizedBox(width: 20,),
                //     Text("Wedding Photography & Films.The Wedding Package is designed to capture and document your special day with a balance of creative style combined with contemporary shots. This is especially crafted to larger weddings & events.Event - Day 1﻿Coverage : 8 hours Session Details : -2 Lead Candid Photographers 2 Lead Candid CinematographersPhoto Output : *200- 600  edited images for web upload.  * Signature Online Albums for both Bride & Groom sides included.* 80 pages album ( 40 leaf) Both An album will be having 40 sheets accommodating 240 photosFilm Output : * Wedding Film : 3-8 mins film curated by the Lead Editor.* Full Length Movie : Traditional Movie (The duration of the full-length movie depends on the event timeline)*Traditional coverage  photography & films is also handled by the same team",style: GoogleFonts.aBeeZee(fontSize:20,color:Color.fromARGB(255, 28, 27, 27)),),
                //   ],
                // ),

                //                      Container(margin: EdgeInsets.all(10),height: MediaQuery.of(context).size.height,

                //           width: MediaQuery.of(context).size.width,color: Color.fromARGB(255, 248, 246, 245),
                //           child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Container(color: Color.fromARGB(255, 189, 164, 155),height:MediaQuery.of(context).size.height/17,
                //               width: MediaQuery.of(context).size.width,
                //                 child: Row(
                //                   children: [IconButton(onPressed: (){ }, icon: Icon(Icons.check_box_outline_blank)),
                //                     Text(style: GoogleFonts.aboreto(fontSize:25,color:Color.fromARGB(255, 28, 27, 27)),"GOLD"
                //                       ),
                //                   ],
                //                 ),
                //               ),
                //               Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Text("Wedding Photography & Films",style: GoogleFonts.aboreto(fontSize:15,)),
                //                   SizedBox(height: 20,),
                //                   Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"*The Wedding Package is designed to capture and document your special day with a balance of creative style combined with contemporary shots.This is especially crafted to larger weddings& events")
                //                                ,SizedBox(height: 20,)
                //                                ,Column(mainAxisAlignment: MainAxisAlignment.start,
                //                    children: [
                //                      Text("Event - Day 1",style: GoogleFonts.aboreto(fontSize:17,)),
                //                      Text("Coverage: 8 hours Session",style: GoogleFonts.aboreto(fontSize:17,)),
                //                      Text("Crew details",style: GoogleFonts.aboreto(fontSize:17,)),
                //                      Text("2 Lead Candid Photographers",style: GoogleFonts.aboreto(fontSize:17,)),
                //                      Text("2 Lead Candid Cinematographers",style: GoogleFonts.aboreto(fontSize:17,)),
                //                      SizedBox(height: 20,),
                //                         Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"Photo Output:"),
                //                            Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"*300-900 edited images for web upload"),
                //                               Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"*Signature Online Albums for one side."),
                //                                  Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"* 80 pages album(40 leaf) an album will be having 40 sheets accommodating 240 photos"),
                // SizedBox(height: 20,),

                //                                     Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"Film Output:"),
                //                                        Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"*Wedding Film : 3-8 mins film curated by the Lead Editor."),
                //                                           Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"*Full Length Movie : Traditional Movie (The duration of the full-length movie depends on the event timeline)."),
                //                                              Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"*Traditional coverage for both photography & films is also handled by the same team."),
                //                    ],
                //                                ),
                //                 ],
                //               )

                //               ],),),

                // Container(margin: EdgeInsets.all(10),height: MediaQuery.of(context).size.height,

                //           width: MediaQuery.of(context).size.width,color: Color.fromARGB(255, 248, 246, 245),
                //           child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Container(color: Color.fromARGB(255, 189, 164, 155),height:MediaQuery.of(context).size.height/17,
                //               width: MediaQuery.of(context).size.width,
                //                 child: Row(
                //                   children: [IconButton(onPressed: (){ }, icon: Icon(Icons.check_box_outline_blank)),
                //                     Text(style: GoogleFonts.aboreto(fontSize:25,color:Color.fromARGB(255, 28, 27, 27)),"SILVER"
                //                       ),
                //                   ],
                //                 ),
                //               ),
                //               Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Text("Wedding Photography & Films",style: GoogleFonts.aboreto(fontSize:15,)),
                //                   SizedBox(height: 20,),
                //                   Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"*The Wedding Package is designed to capture and document your special day with a balance of creative style combined with contemporary shots.This is especially crafted to larger weddings& events")
                //                                ,SizedBox(height: 20,)
                //                                ,Column(mainAxisAlignment: MainAxisAlignment.start,
                //                    children: [
                //                      Text("Event - Day 1",style: GoogleFonts.aboreto(fontSize:17,)),
                //                      Text("Coverage: 8 hours Session",style: GoogleFonts.aboreto(fontSize:17,)),
                //                      Text("Crew details",style: GoogleFonts.aboreto(fontSize:17,)),
                //                      Text("1 Photographers",style: GoogleFonts.aboreto(fontSize:17,)),
                //                      Text("1 Cinematographers",style: GoogleFonts.aboreto(fontSize:17,)),
                //                      SizedBox(height: 20,),
                //                         Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"Photo Output:"),
                //                            Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"*200-400 edited images for web upload"),
                //                               Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"*Signature Online Albums for one side."),
                //                                  Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"* 80 pages album(40 leaf) an album will be having 40 sheets accommodating 240 photos"),
                // SizedBox(height: 20,),

                //                                     Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"Film Output:"),
                //                                        Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"*Wedding Film : 3-8 mins film curated by the Lead Editor."),
                //                                           Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"*Full Length Movie : Traditional Movie (The duration of the full-length movie depends on the event timeline)."),
                //                                              Text(style: GoogleFonts.aboreto(fontSize:15,),textAlign: TextAlign.center,"*Traditional coverage photography & films is also handled by the same team."),
                //                    ],
                //                                ),
                //                 ],
                //               )

                //               ],),),

                SizedBox(
                  height: 50,
                ),

                Text(
                    style: GoogleFonts.aboreto(
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                    "NOTE:"),
                Text(
                    style: GoogleFonts.aboreto(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                    "Thank you for your interest in our wedding photography services.We appreciate you reaching out to us."),
                SizedBox(
                  height: 20,
                ),

                Text(
                    style: GoogleFonts.aboreto(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                    "We understand that making a decision takes time,and we are more than happy to provide any additional information or answer any questions you may have during this process.Please feel free to control us wherever you are ready,and we will be here to assist you."),

                SizedBox(
                  height: 20,
                ),
                Text(
                    style: GoogleFonts.aboreto(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                    "Thank you once again for considering"),

                SizedBox(
                  height: 60,
                ),

                Container(
                    color: Color.fromARGB(255, 226, 219, 216),
                    child: TextButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) {
                          //   return finalpage();
                          // },));

                          DatabaseServices().addData(nameController.text, emailController.text, phoneNoController.text, platinumCheckboxNotifier.value, goldCheckboxNotifier.value, silverCheckboxNotifier.value);
                          Navigator.push(context, MaterialPageRoute(builder:(context) {
                            return finalpage();
                          },));
                        },
                        child: Text("ACCEPT")))
              ],
            ),
          ],
        ),
      ]),

      // Image.asset("assets/images/photo1.jpeg"),
    );
  }
}
