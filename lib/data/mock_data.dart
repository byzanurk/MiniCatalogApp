import '../models/product.dart';

class MockData {
  static List<Product> getProducts() {
    return [
      Product(
        id: '1',
        name: 'Kablosuz Kulaklık',
        description:
            'Yüksek kaliteli ses deneyimi sunan, gürültü engelleme özellikli kablosuz kulaklık.',
        price: 1499.90,
        imageUrl: 'https://picsum.photos/id/1/300/300',
      ),
      Product(
        id: '2',
        name: 'Akıllı Saat',
        description:
            'Nabız takibi, adım sayar ve bildirim özellikleriyle hayatınızı kolaylaştıran akıllı saat.',
        price: 2499.00,
        imageUrl: 'https://picsum.photos/id/2/300/300',
      ),
      Product(
        id: '3',
        name: 'Dizüstü Bilgisayar Çantası',
        description:
            'Su geçirmez kumaştan üretilmiş, şık ve dayanıklı 15 inç laptop çantası.',
        price: 450.50,
        imageUrl: 'https://picsum.photos/id/3/300/300',
      ),
      Product(
        id: '4',
        name: 'Bluetooth Hoparlör',
        description:
            'Taşınabilir, suya dayanıklı ve uzun pil ömrüne sahip bluetooth hoparlör.',
        price: 899.00,
        imageUrl: 'https://picsum.photos/id/4/300/300',
      ),
      Product(
        id: '5',
        name: 'Termos Kupa',
        description:
            'Sıcak ve soğuk içeceklerinizi uzun süre muhafaza eden paslanmaz çelik termos.',
        price: 299.90,
        imageUrl: 'https://picsum.photos/id/5/300/300',
      ),
      Product(
        id: '6',
        name: 'Masa Lambası',
        description:
            'Ayarlanabilir ışık seviyesi ve USB şarj girişli modern masa lambası.',
        price: 350.00,
        imageUrl: 'https://picsum.photos/id/6/300/300',
      ),
    ];
  }
}
