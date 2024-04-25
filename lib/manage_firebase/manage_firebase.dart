import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ManagerFirebaseAuth{
  FirebaseAuth auth = FirebaseAuth.instance;

  static final ManagerFirebaseAuth _managerFirebaseAuth = ManagerFirebaseAuth.internal();
  ManagerFirebaseAuth.internal();
  factory ManagerFirebaseAuth(){
    return _managerFirebaseAuth;
  }
  createUserEmailAndPassword(String email,String password) async {
    UserCredential? userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password
    );
    if(userCredential.user != null){
      return userCredential;
    }

  }
  Future<UserCredential>? loginUser(String email,String password)async {
    UserCredential usuario = await auth.signInWithEmailAndPassword(
        email: email,
        password: password
    );
    if(usuario.user?.uid != null){
      return usuario;
    }else{
      return usuario;
    }
  }
  checkUser()async{
    User? user  = auth.currentUser;
    return user;
  }


  exit()async{
    await auth.signOut();
  }


}

class ManagerFirebaseFirestore {

}

class ManagerFirebaseStorage{

}
