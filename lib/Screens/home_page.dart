import 'package:create_profile_app/Screens/chips_screen.dart';
import 'package:create_profile_app/Screens/components/custom_clipper.dart';
import 'package:create_profile_app/widgets/custom_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _formKey = GlobalKey<FormState>();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _pincodeController = TextEditingController();
  final _phoneController = TextEditingController();
  final _bloodgroupController = TextEditingController();

  List<String> _bloodGroup = ['A+', 'A-','B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'];
  List<String> _genders = ['Male', 'Female','Others'];
  List<String> _comorbidities = ['Cough', 'Headache', 'Breathlessness', 'Fever', 'Sweating', 'Body Ache', 'Chest Pain', 'Heart Burn', 'Nausea', 'Dizziness', 'Other'];

  String _selectedItem, _selectedBloodGroup, _selectedGender;
  List<String> _selectedComorbidities;

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    void customAlertDialog(BuildContext context, List list, String title){
      showDialog(context: context, builder: (BuildContext context) {
        return  StatefulBuilder(
            builder: (BuildContext context, StateSetter setState){
              return Container(
                child: CustomAlertDialog(
                  content: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width / 1.8,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.blue[900],
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          height: 140,
                          margin: EdgeInsets.symmetric(vertical: 30),
                          child: ListView.builder(
                              itemCount: list.length,
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width / 2.2,
                                  child: TextButton(
                                    child: Text(
                                      list[index],
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: _selectedItem == list[index] ? Colors.white : Colors.grey[800],
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      backgroundColor: _selectedItem == list[index] ?  MaterialStateProperty.all<Color>(Colors.orangeAccent) :
                                      MaterialStateProperty.all<Color>(Colors.white),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.white)
                                          )
                                      ),
                                    ),
                                    onPressed:( ){
                                      setState(() {
                                        _selectedItem =  list[index];
                                        title == "Blood Group" ? _selectedBloodGroup = list[index] : _selectedGender = list[index];
                                      });
                                    },
                                  ),
                                );
                              }
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Text(
                                "Select",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            GestureDetector(
                              child: Text(
                                "Cancel",
                                style: TextStyle(
                                    fontSize: 20
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  _selectedItem = "";
                                });
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        );
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children:[
            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   width: MediaQuery.of(context).size.width,
            //   color: Colors.white,
            // ),
            ClipPath(
              clipper: BackgroundCustomClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.blueAccent,
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height/3.5,),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          ///Name...
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: TextFormField(
                                    controller: _firstnameController,
                                    decoration: InputDecoration(
                                      hintText: 'First Name',
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox( width: 60 ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: TextFormField(
                                    controller: _lastnameController,
                                    decoration: InputDecoration(
                                      hintText: 'First Name',
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox( height:15 ),

                          ///Birthday... Gender...
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.white),
                                      ),
                                      floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                      hintText: 'Date of Birth',
                                      hintStyle: TextStyle(
                                        color: Colors.white,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 60,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                              child: Text(_selectedGender == null || _selectedGender.isEmpty ? "Gender" : _selectedGender,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              onTap: (){
                                                setState(() {
                                                  customAlertDialog(context, _genders, "Gender");
                                                });

                                              },
                                            ),
                                      SizedBox(height: 5),
                                      Divider(
                                        thickness: 1,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                                // Container(
                                //   width: MediaQuery.of(context).size.width / 3,
                                //   child: TextFormField(
                                //     decoration: InputDecoration(
                                //       focusedBorder: UnderlineInputBorder(
                                //         borderSide: BorderSide(
                                //             color: Colors.white),
                                //       ),
                                //       floatingLabelBehavior:
                                //       FloatingLabelBehavior.always,
                                //       hintText: 'Gender',
                                //       hintStyle: TextStyle(
                                //         color: Colors.white,
                                //       ),
                                //       enabledBorder: UnderlineInputBorder(
                                //         borderSide: BorderSide(color: Colors.white),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox( height: 15 ),

                          ///Pincode...
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: TextFormField(
                              controller: _pincodeController,
                              maxLength: 6,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.white),
                                ),
                                floatingLabelBehavior:
                                FloatingLabelBehavior.always,
                                hintText: 'Pincode',
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              validator: (value) {
                                Pattern pattern = '([1-9]{1}[0-9]{5})';
                                RegExp regex = new RegExp(pattern);
                                if (value.isEmpty) {
                                  return 'Please enter your pin code';
                                }else if (!regex.hasMatch(value)){
                                  return 'Enter valid pin code';
                                }
                                return null;
                              },
                            ),
                          ),
                          SizedBox( height: 10 ),

                          ///Phone Number...
                          TextFormField(
                            controller: _phoneController,
                            maxLength: 10,
                            decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.white),
                              ),
                              floatingLabelBehavior:
                              FloatingLabelBehavior.always,
                              hintText: 'Emergency Contact Number',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            validator: (value) {
                              Pattern pattern = '([1-9]{1}[0-9]{9})';
                              RegExp regex = new RegExp(pattern);
                              if (value.isEmpty) {
                                return 'Please enter your pin code';
                              }else if (!regex.hasMatch(value)){
                                return 'Enter valid pin code';
                              }
                              return null;
                            },
                          ),
                          SizedBox( height: 10),

                          ///Blood Group...
                          Container(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                      child: Text(_selectedBloodGroup == null || _selectedBloodGroup.isEmpty ? "Blood Group" : _selectedBloodGroup,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                      ),
                                      onTap: (){
                                        setState(() {
                                          customAlertDialog(context, _bloodGroup, "Blood Group");
                                        });

                                      },
                                    ),
                                SizedBox(height: 5),
                                Divider(
                                  thickness: 1,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            ),
                          SizedBox( height: 30 ),

                          ///Allergies...
                          Row(
                            children: [
                              Text(
                                "Allergies",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 10,),
                              IconButton(
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => GetData(comorbidities: _comorbidities, title: "Add Allergies.",)),
                                  );
                                },
                                icon: Icon(Icons.add_circle_outline_sharp, color: Colors.white,),
                              )

                            ],
                          ),
                          SizedBox( height: 30 ),

                          ///Comorbidities...
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Comorbidities",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 10,),
                                  IconButton(
                                    onPressed: () async {
                                       _selectedComorbidities = await Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => GetData( comorbidities: _comorbidities, title: "Add Comorbidities.",)),
                                      );
                                    },
                                    icon: Icon(Icons.add_circle_outline_sharp, color: Colors.white,),
                                  )
                                ],
                              ),
                               _selectedComorbidities == null || _selectedComorbidities.isEmpty? Container() : Wrap(
                                spacing: 6.0,
                                runSpacing: 6.0,
                                children: List<Widget>.generate(_selectedComorbidities.length, (int index)
                                {
                                  return Chip(
                                    label: Text(
                                      _selectedComorbidities[index],
                                    ),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(color: Colors.grey, width: 1),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    deleteIcon: Icon(Icons.remove_circle_outline_sharp),
                                    onDeleted: () {
                                      setState(() {
                                        _selectedComorbidities.remove(_selectedComorbidities[index]);

                                      });
                                    },
                                  );
                                }),
                              ),
                               _selectedComorbidities == null || _selectedComorbidities.isEmpty ? Container() : Divider(
                                thickness: 1,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ClipPath(
              clipper: BackgroundCustomClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width - 80,
                color: Colors.orangeAccent,
                padding: EdgeInsets.fromLTRB(20, 60, 20, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tell us about yourself.",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Stack(
                children: [
                  ClipPath(
                    clipper: BackgroundCustomClipper(),
                    child: Container(
                      height: 20,
                      color: Colors.pink,
                    ),
                  ),
                  Container(
                    // margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height - 90, 0, 0),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.grey,
                  ),

                ],
              ),

            )
        ]
        ),
      ),
    );
  }
}

