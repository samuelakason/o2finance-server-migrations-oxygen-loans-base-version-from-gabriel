class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: 'Get a loan in Minutes',
      image: "assets/images/splash1.png",
      discription:
          "On 02 Loans you can get access to loans in minutes. No collateral required, you get credited in your local bank account. "),
  UnbordingContent(
      title: 'Bill Payment Made Easy',
      image: "assets/images/splash2.png",
      discription:
          "With 02 Loans you can enjoy faster transaction. Pay bills, buy airtime, data and so much more. "),
  UnbordingContent(
      title: 'O2 Homes',
      image: "assets/images/splash3.png",
      discription:
          "Get access to real estate services on our platform, view our available listings and make payment"),
];
