import 'package:flutter/material.dart';
import 'package:fyp_career_road/models/career_entity.dart';
import 'package:fyp_career_road/screens/search_screen.dart';
import 'package:fyp_career_road/services/firestore.dart';
import 'package:fyp_career_road/models/constants.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final TextEditingController _queryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            height: 50,
            width: size.width / 0.5,
            decoration: kBoxDecorationStyle,
            child: TextFormField(
              controller: _queryController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 15.0),
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                hintText: "Type Career",
                hintStyle: kHintTextStyle,
              ),
              validator: (str) {
                if (str.isEmpty) {
                  return 'Text is required';
                }
                return null;
              },
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 25),
          // ignore: deprecated_member_use
          RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0)),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: searchPressed,
            // register(context);
            child: Text('Search'),
          ),
        ],
      ),
    );
  }

  void searchPressed() async {
    if (_queryController.text.isNotEmpty) {
      _queryController.text = _queryController.text.trim();
      // Validate returns true if the form is valid, otherwise false.
      if (formKey.currentState.validate()) {
        List<CareerEntity> careers =
            await Database.getCareersByName(_queryController.text);
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SearchScreen(careers)));
      }
    }
  }
}

// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class AnimatedSearchBar extends StatefulWidget {
//   final double width;
//   final TextEditingController textController;
//   final Icon suffixIcon;
//   final Icon prefixIcon;
//   final String helpText;
//   final int animationDurationInMilli;
//   final onSuffixTap;
//   final bool rtl;
//   final bool autoFocus;
//   final TextStyle style;
//   final bool closeSearchOnSuffixTap;
//   final Color color;
//   final List<TextInputFormatter> inputFormatters;

//   const AnimatedSearchBar({
//     Key key,
//     @required this.width,
//     @required this.textController,
//     this.suffixIcon,
//     this.prefixIcon,
//     this.helpText = "Search...",
//     this.color,
//     @required this.onSuffixTap,
//     this.animationDurationInMilli = 375,
//     this.rtl = false,
//     this.autoFocus = false,
//     this.style,
//     this.closeSearchOnSuffixTap = true,
//     this.inputFormatters,
//   }) : super(key: key);

//   @override
//   _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
// }

// int toggle = 0;

// class _AnimatedSearchBarState extends State<AnimatedSearchBar>
//     with SingleTickerProviderStateMixin {
//   AnimationController _con;
//   FocusNode focusNode = FocusNode();

//   @override
//   void initState() {
//     super.initState();
//     _con = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: widget.animationDurationInMilli),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100.0,
//       alignment: widget.rtl ? Alignment.centerRight : Alignment(-1.0, 0.0),
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: widget.animationDurationInMilli),
//         height: 48.0,
//         width: (toggle == 0) ? 48.0 : widget.width,
//         curve: Curves.easeOut,
//         decoration: BoxDecoration(
//           color: widget.color ?? Colors.white,
//           borderRadius: BorderRadius.circular(30.0),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black26,
//               spreadRadius: -10.0,
//               blurRadius: 10.0,
//               offset: Offset(0.0, 10.0),
//             ),
//           ],
//         ),
//         child: Stack(
//           children: [
//             AnimatedPositioned(
//               duration: Duration(milliseconds: widget.animationDurationInMilli),
//               top: 6.0,
//               right: 7.0,
//               curve: Curves.easeOut,
//               child: AnimatedOpacity(
//                 opacity: (toggle == 0) ? 0.0 : 1.0,
//                 duration: Duration(milliseconds: 200),
//                 child: Container(
//                   padding: EdgeInsets.all(8.0),
//                   decoration: BoxDecoration(
//                     color: widget.color ?? Colors.white,
//                     borderRadius: BorderRadius.circular(30.0),
//                   ),
//                   child: AnimatedBuilder(
//                     child: GestureDetector(
//                       onTap: () {
//                         try {
//                           ///trying to execute the onSuffixTap function
//                           widget.onSuffixTap();

//                           ///closeSearchOnSuffixTap will execute if it's true
//                           if (widget.closeSearchOnSuffixTap) {
//                             FocusScope.of(context).unfocus();
//                             setState(() {
//                               toggle = 0;
//                             });
//                           }
//                         } catch (e) {
//                           ///print the error if the try block fails
//                           print(e);
//                         }
//                       },

//                       ///suffixIcon is of type Icon
//                       child: widget.suffixIcon != null
//                           ? widget.suffixIcon
//                           : Icon(
//                               Icons.close,
//                               color: Colors.white,
//                               size: 20.0,
//                             ),
//                     ),
//                     builder: (context, widget) {
//                       ///Using Transform.rotate to rotate the suffix icon when it gets expanded
//                       return Transform.rotate(
//                         angle: _con.value * 2.0 * pi,
//                         child: widget,
//                       );
//                     },
//                     animation: _con,
//                   ),
//                 ),
//               ),
//             ),
//             AnimatedPositioned(
//               duration: Duration(milliseconds: widget.animationDurationInMilli),
//               left: (toggle == 0) ? 20.0 : 40.0,
//               curve: Curves.easeOut,
//               top: 11.0,

//               ///Using Animated opacity to change the opacity of th textField while expanding
//               child: AnimatedOpacity(
//                 opacity: (toggle == 0) ? 0.0 : 1.0,
//                 duration: Duration(milliseconds: 200),
//                 child: Container(
//                   padding: const EdgeInsets.only(left: 10),
//                   alignment: Alignment.topCenter,
//                   width: widget.width / 1.7,
//                   child: TextField(
//                     ///Text Controller. you can manipulate the text inside this textField by calling this controller.
//                     controller: widget.textController,
//                     inputFormatters: widget.inputFormatters,
//                     focusNode: focusNode,
//                     cursorRadius: Radius.circular(10.0),
//                     cursorWidth: 2.0,
//                     onEditingComplete: () {
//                       //WRITE QUERY FUNCTIONALITY HERE
//                       /// on editing complete the keyboard will be closed and the search bar will be closed
//                       FocusScope.of(context).unfocus();
//                       setState(() {
//                         toggle = 0;
//                       });
//                     },

//                     ///style is of type TextStyle, the default is just a color black
//                     style: widget.style != null
//                         ? widget.style
//                         : TextStyle(color: Colors.black),
//                     cursorColor: Colors.white,
//                     decoration: InputDecoration(
//                       contentPadding: const EdgeInsets.only(bottom: 5),
//                       isDense: true,
//                       floatingLabelBehavior: FloatingLabelBehavior.never,
//                       labelText: widget.helpText,
//                       labelStyle: TextStyle(
//                         color: Color(0xff5B5B5B),
//                         fontSize: 17.0,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       alignLabelWithHint: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20.0),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             ///Using material widget here to get the ripple effect on the prefix icon
//             Material(
//               /// can add custom color or the color will be white
//               color: widget.color ?? Colors.white,
//               borderRadius: BorderRadius.circular(30.0),
//               child: IconButton(
//                 splashRadius: 19.0,
//                 icon: widget.prefixIcon != null
//                     ? toggle == 1
//                         ? Icon(
//                             Icons.arrow_back_ios,
//                             color: Colors.white,
//                           )
//                         : widget.prefixIcon
//                     : Icon(
//                         toggle == 1 ? Icons.arrow_back_ios : Icons.search,
//                         size: 20.0,
//                         color: Colors.white,
//                       ),
//                 onPressed: () {
//                   setState(
//                     () {
//                       ///if the search bar is closed
//                       if (toggle == 0) {
//                         toggle = 1;
//                         setState(() {
//                           ///if the autoFocus is true, the keyboard will pop open, automatically
//                           if (widget.autoFocus)
//                             FocusScope.of(context).requestFocus(focusNode);
//                         });

//                         ///forward == expand
//                         _con.forward();
//                       } else {
//                         ///if the search bar is expanded
//                         toggle = 0;

//                         ///if the autoFocus is true, the keyboard will close, automatically
//                         setState(() {
//                           if (widget.autoFocus)
//                             FocusScope.of(context).unfocus();
//                         });

//                         ///reverse == close
//                         _con.reverse();
//                       }
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:career_road/utilities/constants.dart';
// // import 'package:material_floating_search_bar/material_floating_search_bar.dart';

// // class SearchBar extends StatelessWidget {
// //   // const SearchBar({Key key}) : super(key: key);
// //   @override
// //   Widget build(BuildContext context) {
// //     final isPortrait =
// //         MediaQuery.of(context).orientation == Orientation.portrait;

// //     return FloatingSearchBar(
// //         hint: 'Search...',
// //         scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
// //         transitionDuration: const Duration(milliseconds: 800),
// //         transitionCurve: Curves.easeInOut,
// //         physics: const BouncingScrollPhysics(),
// //         axisAlignment: isPortrait ? 0.0 : -1.0,
// //         openAxisAlignment: 0.0,
// //         width: isPortrait ? 600 : 500,
// //         debounceDelay: const Duration(milliseconds: 500),
// //         onQueryChanged: (query) {
// //           // Call your model, bloc, controller here.
// //         },
// //         // Specify a custom transition to be used for
// //         // animating between opened and closed stated.
// //         transition: CircularFloatingSearchBarTransition(),
// //         actions: [
// //           FloatingSearchBarAction(
// //             showIfOpened: false,
// //             child: CircularButton(
// //               icon: const Icon(Icons.place),
// //               onPressed: () {},
// //             ),
// //           ),
// //           FloatingSearchBarAction.searchToClear(
// //             showIfClosed: false,
// //           ),
// //         ],
// //         builder: (context, transition) {
// //           return ClipRRect(
// //             borderRadius: BorderRadius.circular(8),
// //             child: Material(
// //               color: Colors.white,
// //               elevation: 4.0,
// //               child: Column(
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: Colors.accents.map((color) {
// //                   return Container(height: 112, color: color);
// //                 }).toList(),
// //               ),
// //             ),
// //           );
// //         });
// //   }
// // }
