import 'package:flutter/material.dart';
import 'package:gaming_review/view/profile_screen.dart';

class profileSocmed extends StatelessWidget {
  const profileSocmed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(31, 32, 38, 1),
        title: Text(
          "Social Media",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile_screen()));
            },
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
            )),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
              height: 108,
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, right: 20,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(65, 65, 70, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      "assets/images/instagram.png",
                      scale: 15,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 17, top: 20, bottom: 20),
                    height: 88,
                    width: 257,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(65, 65, 70, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Sulthon",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "@msultonkhairudin",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  )
                ],
              )),
              
              Container(
              height: 108,
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(65, 65, 70, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      "assets/images/facebook.png",
                      scale: 15,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 17, top: 20, bottom: 20),
                    height: 88,
                    width: 257,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(65, 65, 70, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "M.Sulthon.k",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "@Muhammad Sulthon.k",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  )
                ],
              )),
              
              Container(
              height: 108,
              width: double.infinity,
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(65, 65, 70, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.asset(
                      "assets/images/mail.png",
                      scale: 15,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 17, top: 20, bottom: 20),
                    height: 88,
                    width: 257,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(65, 65, 70, 1),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Muhammad Sulthon",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const Text(
                          "msultonkhairudin@gmail.com",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w200),
                        )
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}