class FlashCard {
  const FlashCard({this.title, this.imageUrl});
  final String title;
  final String imageUrl;
}

final List<FlashCard> cards = <FlashCard>[
  FlashCard(
      title: 'Card Title',
      imageUrl:
          'https://hickstechniques.s3.amazonaws.com/HFWL-1-34/HFWL-1-34-002.jpg'),
  FlashCard(
      title: 'Card Title',
      imageUrl:
          'https://hickstechniques.s3.amazonaws.com/HFWL-1-34/HFWL-1-34-003.jpg'),
  FlashCard(
      title: 'Card Title',
      imageUrl:
          'https://hickstechniques.s3.amazonaws.com/HFWL-1-34/HFWL-1-34-004.jpg'),
  FlashCard(
      title: 'Card Title',
      imageUrl:
          'https://hickstechniques.s3.amazonaws.com/HFWL-1-34/HFWL-1-34-005.jpg'),
  FlashCard(
      title: 'Card Title',
      imageUrl:
          'https://hickstechniques.s3.amazonaws.com/HFWL-1-34/HFWL-1-34-006.jpg')
];
