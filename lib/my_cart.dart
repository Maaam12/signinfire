import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signinfire/my_controller.dart';
import 'package:signinfire/total_page.dart';

class MyCart extends StatelessWidget {
  MyCart({Key? key, required String title}) : super(key: key);
  final MyController c = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('My Cart'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //mobil
              Row(
                children: [
                  const Text(
                    "Mobil",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    width: screenSize.width * 0.1,
                    height: screenSize.width * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey),
                    child: IconButton(
                        icon: const Icon(Icons.add, color: Colors.black),
                        onPressed: () => c.increment()),
                  ),
                  SizedBox(width: screenSize.width * 0.02),
                  Obx(() => Text(
                        c.mobil.toString(),
                        style: const TextStyle(fontSize: 30),
                      )),
                  SizedBox(width: screenSize.width * 0.02),
                  Container(
                    width: screenSize.width * 0.1,
                    height: screenSize.width * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey),
                    child: IconButton(
                        icon: const Icon(Icons.remove, color: Colors.black),
                        onPressed: () => c.decrement()),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.02),
      
              //motor
              Row(
                children: [
                  const Text(
                    "Motor",
                    style: TextStyle(fontSize: 30, color: Colors.black),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Container(
                    width: screenSize.width * 0.1,
                    height: screenSize.width * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey),
                    child: IconButton(
                        icon: const Icon(Icons.add, color: Colors.black),
                        onPressed: () => c.incrementMotor()),
                  ),
                  SizedBox(width: screenSize.width * 0.02),
                  Obx(() => Text(
                        c.motor.toString(),
                        style: const TextStyle(fontSize: 30),
                      )),
                  SizedBox(width: screenSize.width * 0.02),
                  Container(
                    width: screenSize.width * 0.1,
                    height: screenSize.width * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.grey),
                    child: IconButton(
                        icon: const Icon(Icons.remove, color: Colors.black),
                        onPressed: () => c.decrementMotor()),
                  ),
                ],
              ),
              SizedBox(height: screenSize.height * 0.02),
              Row(
                children: [
                  Expanded(child: Container()),
                  Container(
                    width: 150,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.blue.shade900,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )
                      ),
                      onPressed: ()=>Get.to(()=>TotalPage()),
                      child: const Text(
                        "Total",style: TextStyle(
                          fontSize: 30,
                          color: Colors.white
                        ),
                        )
                      ),
                  )
                ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}