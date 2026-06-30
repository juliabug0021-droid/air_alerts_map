class OblastImageMapper {
  static const _paths = {
    'Харківська область': 'assets/images/mapUkraine/Kharkivska.png',
    'Донецька область': 'assets/images/mapUkraine/Donetska.png',
    'Луганська область': 'assets/images/mapUkraine/Luhanska.png',
    'Запорізька область': 'assets/images/mapUkraine/Zaporizka.png',
    'Дніпропетровська область': 'assets/images/mapUkraine/Dnipropetrovska.png',
    'Херсонська область': 'assets/images/mapUkraine/Khersonska.png',
    'Миколаївська область': 'assets/images/mapUkraine/Mykolaivska.png',
    'Одеська область': 'assets/images/mapUkraine/Odeska.png',
    'Вінницька область': 'assets/images/mapUkraine/Vinnytska.png',
    'Київська область': 'assets/images/mapUkraine/Kyivska.png',
    'Чернігівська область': 'assets/images/mapUkraine/Chernihivska.png',
    'Сумська область': 'assets/images/mapUkraine/Sumska.png',
    'Житомирська область': 'assets/images/mapUkraine/Zhytomyrska.png',
    'Полтавська область': 'assets/images/mapUkraine/Poltavska.png',
    'Черкаська область': 'assets/images/mapUkraine/Cherkaska.png',
    'Кіровоградська область': 'assets/images/mapUkraine/Kirovohradska.png',
    'Тернопільська область': 'assets/images/mapUkraine/Ternopilska.png',
    'Хмельницька область': 'assets/images/mapUkraine/Khmelnytska.png',
    'Волинська область': 'assets/images/mapUkraine/Volynska.png',
    'Чернівецька область': 'assets/images/mapUkraine/Chernivetska.png',
    'Івано-Франківська область':
        'assets/images/mapUkraine/Ivano-frankivska.png',
    'Закарпатська область': 'assets/images/mapUkraine/Zakarpatska.png',
    'Львівська область': 'assets/images/mapUkraine/Lvivska.png',
    'Рівненська область': 'assets/images/mapUkraine/Rivnenska.png',
    'Автономна Республіка Крим': 'assets/images/mapUkraine/Krym.png',
    'м. Севастополь': 'assets/images/mapUkraine/Sevastopol.png',
    'м. Київ': 'assets/images/mapUkraine/Kyiv.png',
  };
  static String getOverlay(String oblast) {
    return _paths[oblast] ?? '';
  }
}
