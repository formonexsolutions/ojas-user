import 'package:get/get.dart';

import '../../models/bookings/pandit_model.dart';


class PanditDetailController extends GetxController {
  var pandit = Pandit(
    name: "Pandit Rajesh Sharma",
    image: "https://blog.byoh.in/wp-content/uploads/2016/04/PanditJi.jpg",
    rating: 4.8,
    distance: 4.2,
    poojaTypes: [
      "Griha Pravesh",
      "Satyanarayan",
      "Navagraha",
      "Rudrabhishek",
      "Ganapati",
      "Vastu"
    ],
    sevaOffered: [
      "Monthly Home Seva",
      "Online Pooja",
      "Temple Rituals",
      "Personal Consultation"
    ],
    experience: "10+ years of Vedic experience",
    languages: "Hindi, Sanskrit, English",
    about:
    "Highly experienced Pandit specializing in Vedic rituals and pujas. Follows traditional methods and provides personalized spiritual guidance.",
  ).obs;
}
