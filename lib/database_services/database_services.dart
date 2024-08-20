import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addData(String name,String email,String phoneNo,bool isSelectedPlatinum,bool isSelectedGold,bool isSelectedSilver) async {
    try {
      // Define your data
      Map<String, dynamic> data = {
        'username': name,
        'email': email,
        'listOfMaps': 
          {'Platinum': isSelectedPlatinum, 'Gold': isSelectedGold, 'Silver':isSelectedSilver},
          
        
      };

      // Add the data to the 'sample' collection
      await _firestore.collection('sample').add(data);
      print('Document successfully added!');
    } catch (e) {
      print('Error adding document: $e');
    }
  }}