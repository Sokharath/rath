class SearchScreenItems {
  final String largeImage;
  final String smallImage;
  final String nameText;
  final String timeText;
  final String viewTime;

  SearchScreenItems(
      {required this.largeImage,
      required this.smallImage,
      required this.nameText,
      required this.timeText,
      required this.viewTime});
}

List<SearchScreenItems> searchItems = [
  SearchScreenItems(
    largeImage:
        'https://www.billboard.com/wp-content/uploads/2021/10/YoungBoy-Never-Broke-Again-02-cr-Jimmy-Fontaine-press-2021-billboard-1548-1633455553.jpg',
    smallImage:
        'https://thefader-res.cloudinary.com/private_images/w_640,c_limit,f_auto,q_auto:eco/Youngboy-Never-Broke-Again-Approved-Press-Photo-Jimmy-Fontaine-2_p2z1sb/youngboy-never-broke-again-shares-new-album-top.jpg',
    nameText: 'NBA Youngboy',
    timeText: '40 seconds ago',
    viewTime: '720',
  ),
  SearchScreenItems(
      largeImage:
          'https://ew.com/thmb/IVjmtfkRu2ZP4GDYmiFkPUe7yTc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/Weeknd-d4fb08e62a924691a18af068d9bfa972.jpg',
      smallImage:
          'https://media1.popsugar-assets.com/files/thumbor/CJWxJTxjCaeOC8NBEDWR-iM7TpM=/fit-in/792x1202/filters:format_auto():upscale()/2015/12/21/053/n/1922398/4bc5be9b_GettyImages-459496430.jpg',
      nameText: 'The Weeknd',
      timeText: '2 minutes ago',
      viewTime: '13k'),
  SearchScreenItems(
      largeImage:
          'https://media.pitchfork.com/photos/63231b77afa92f85cc3e4b37/16:9/w_1280,c_limit/Yeat.jpg',
      smallImage:
          'https://p16-tm-sg.tiktokmusic.me/img/tos-alisg-i-0000/d7e2cad36530478f89dbbb15e48035af~c5_750x750.image',
      nameText: 'Yeat',
      timeText: '10 minutes ago',
      viewTime: '3k')
];
