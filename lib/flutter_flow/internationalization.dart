import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
    String? enText = '',
  }) =>
      [ruText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // PregamePsychology
  {
    '0oobrus7': {
      'ru': 'Перед игрой',
      'en': 'Pre-game',
    },
    'i4v049ie': {
      'ru': 'После игры',
      'en': 'After game',
    },
    'zm7u3eoq': {
      'ru': 'День отдыха',
      'en': 'Free day',
    },
    'plpcjg10': {
      'ru': 'До тренировки',
      'en': 'Pre-training',
    },
    '9slsww6m': {
      'ru': 'После тренировки',
      'en': 'After training',
    },
    'qw0cuvvy': {
      'ru': 'В отпуске',
      'en': 'On vacation',
    },
    '9z6ivpc1': {
      'ru':
          'Психологическая подготовка перед игрой имеет огромное значение для достижения успешных результатов и избежания негативных эмоций, таких как апатия и агония. Вот несколько советов, как хоккеисту можно психологически подготовиться к игре и сохранить положительное состояние:\n\n1.  Разработай ритуалы:  Создание ритуалов перед игрой может помочь тебе установить психологический режим и концентрацию. Это может быть специфический порядок подготовки, включая разминку, визуализацию успеха или позитивные аффирмации.\n\n2.  Занимайся релаксацией:  Практика методов релаксации, таких как глубокое дыхание, медитация или прогулка на свежем воздухе, помогает снизить напряжение и стресс перед игрой.\n\n3.  Фокус на процесс:  Сосредотачивайся на текущей задаче и процессе подготовки к игре, а не на конечном результате. Это поможет снять давление и избежать агонии.\n\n4.  Позитивное мышление:  Заменяй негативные мысли позитивными. Помни о своих успехах, качествах и умениях. Произноси позитивные утверждения о себе.\n\n5.  Визуализация успеха:  Перед игрой визуализируй себя успешно выполняющим хоккейные действия. Это укрепит твою уверенность и подготовит ум к успешному выступлению.\n\n6.  Установите ясные цели:  Определи конкретные цели на игру. Они могут быть связаны с техническими аспектами, тактикой или результатом. Это поможет сосредоточиться на задачах.\n\n7.  Поддержка команды:  Общение с партнерами по команде или тренерами перед игрой может поднять твое настроение и укрепить чувство единства.\n\n8.  Управление стрессом:  Применение методов управления стрессом, таких как дыхательные упражнения или техники расслабления, может помочь справиться с нервным напряжением перед игрой.\n\n9.  Зона комфорта:  Найди свой личный метод вхождения в зону комфорта перед игрой. Это может быть прослушивание музыки, определенные техники визуализации или другие методы, которые тебя успокаивают.\n\n10.  Доверие процессу:  Помни, что ты готовился к этому моменту долгое время. Доверься своим навыкам и опыту. Думай о том, что ты уже проходил через подобные ситуации и справился с ними.\n\nПсихологическая подготовка перед игрой поможет тебе установить правильное ментальное состояние, избежать предстартовой апатии и агонии, а также достичь наивысшей эффективности на хоккейной площадке.',
      'en':
          'Mental preparation before a game is of great importance for achieving successful results and avoiding negative emotions such as apathy and agony. Here are some tips on how a hockey player can mentally prepare for the game and maintain a positive state:\n\n1. Develop Rituals: Creating rituals before a game can help you establish a mental routine and focus. This could be a specific preparation routine, including warming up, visualizing success, or positive affirmations.\n\n2. Practice relaxation: Practicing relaxation techniques such as deep breathing, meditation or walking outside can help reduce tension and stress before playing.\n\n3. Process Focus: Focus on the task at hand and the process of preparing for the game, not on the end result. This will help relieve pressure and avoid agony.\n\n4. Positive thinking: Replace negative thoughts with positive ones. Remember your successes, qualities and skills. Say positive statements about yourself.\n\n5. Visualization of Success: Before the game, visualize yourself successfully performing hockey actions. This will boost your confidence and prepare your mind for a successful performance.\n\n6. Set Clear Goals: Set specific goals for the game. They can be related to technical aspects, tactics or results. This will help you focus on tasks.\n\n7. Team Support: Chatting with teammates or coaches before a game can lift your spirits and foster a sense of unity.\n\n8. Stress Management: Using stress management techniques, such as breathing exercises or relaxation techniques, can help manage pre-game nerves.\n\n9. Comfort Zone: Find your personal method of entering your comfort zone before playing. This could be listening to music, certain visualization techniques, or other methods that calm you down.\n\n10. Trust the process: Remember that you have been preparing for this moment for a long time. Trust your skills and experience. Think that you have already been through similar situations and dealt with them.\n\nPsychological preparation before a game will help you establish the right mental state, avoid pre-start apathy and agony, and achieve peak performance on the hockey rink.',
    },
    'a5qpknf6': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'ggte512q': {
      'ru': 'Психология',
      'en': 'Psychology',
    },
    '5zmt0tnh': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // goals
  {
    '8a02dnil': {
      'ru': 'Цели',
      'en': 'Goals',
    },
    'hqalbfrt': {
      'ru': 'Прогресс\nупражнений',
      'en': 'Progress\nexercises',
    },
    'hb0kvjjf': {
      'ru': 'Голы',
      'en': 'Goals',
    },
    '7ez05ja2': {
      'ru': 'Цель : ',
      'en': 'Target :',
    },
    '697vj39k': {
      'ru': 'Сейчас : ',
      'en': 'Now :',
    },
    'jv4wxdl0': {
      'ru': 'Передачи',
      'en': 'Assists',
    },
    'e6ygev0h': {
      'ru': 'Цель : ',
      'en': 'Target :',
    },
    '8bs36266': {
      'ru': 'Сейчас : ',
      'en': 'Now :',
    },
    'qj6csl87': {
      'ru': 'Силовые приемы',
      'en': 'Power moves',
    },
    'p20g6t3g': {
      'ru': 'Цель : ',
      'en': 'Target :',
    },
    '2msz839s': {
      'ru': 'Сейчас : ',
      'en': 'Now :',
    },
    '0xi3ep6q': {
      'ru': 'Ловля шайбы',
      'en': 'Catching puck',
    },
    'anj1ctyu': {
      'ru': 'Цель : ',
      'en': 'Target :',
    },
    '86xg8dyu': {
      'ru': 'Сейчас : ',
      'en': 'Now :',
    },
    'unmd18kc': {
      'ru': 'Командные очки',
      'en': 'Team points',
    },
    'bs7jqbd2': {
      'ru': 'Цель : ',
      'en': 'Target :',
    },
    '5ftfq1tb': {
      'ru': 'Сейчас : ',
      'en': 'Now :',
    },
    '5zoevka1': {
      'ru': 'Прогресс\nупражнений',
      'en': 'Progress\nexercises',
    },
    'y1bra65h': {
      'ru': 'Точность Броска',
      'en': 'Shoot Accuracy',
    },
    'qap82jmq': {
      'ru': 'Текущая : ',
      'en': 'Now :',
    },
    'xcebljne': {
      'ru': 'Предыдущая :',
      'en': 'Previous :',
    },
    '7cs7f1ng': {
      'ru': 'Сила Броска',
      'en': 'Shoot Power',
    },
    'n6btmbbf': {
      'ru': 'Текущая : ',
      'en': 'Now :',
    },
    'y0xvj8r4': {
      'ru': 'Предыдущая :',
      'en': 'Previous :',
    },
    '74qrleqv': {
      'ru': 'Точность Паса',
      'en': 'Assist Accuracy',
    },
    'jtdzxvs8': {
      'ru': 'Текущая : ',
      'en': 'Now :',
    },
    '8uxa5m1z': {
      'ru': 'Предыдущая :',
      'en': 'Previous :',
    },
    'yahiibzt': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'nzcjuvrw': {
      'ru': 'Текущая : ',
      'en': 'Now :',
    },
    'ie0aujzn': {
      'ru': 'Предыдущая :',
      'en': 'Previous :',
    },
    'wh62as6x': {
      'ru': 'Выносливость',
      'en': 'Endurance',
    },
    'vd929w83': {
      'ru': 'Текущая : ',
      'en': 'Now :',
    },
    'r2tbw9pt': {
      'ru': 'Предыдущая :',
      'en': 'Previous :',
    },
    '87ud5kwu': {
      'ru': 'Цели',
      'en': 'Goals',
    },
  },
  // MainMenu1
  {
    '9txk2rsh': {
      'ru': 'Здоровье',
      'en': 'Health',
    },
    'g4pnzhpx': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'l4eg6nyx': {
      'ru': 'Становись лучше каждый день !',
      'en': 'Make yourself better every day !',
    },
    'he1di9mx': {
      'ru': 'Цели',
      'en': 'Goals',
    },
    'mnnfxcnv': {
      'ru': 'Поставил цель - достигай !',
      'en': 'Make a goal - achieve it !',
    },
    '982hnibd': {
      'ru': 'Тренироваться',
      'en': 'Training',
    },
    'zs3y80z2': {
      'ru': 'Be Pro',
      'en': 'Be Pro',
    },
    'ff2uad3p': {
      'ru': 'Дом',
      'en': 'Home',
    },
  },
  // ProfilePage
  {
    'lsfqbvda': {
      'ru': 'Игрок',
      'en': 'Player',
    },
    'n8q1ees8': {
      'ru': 'All-Star Account',
      'en': 'All-Star Account',
    },
    'p8955m1x': {
      'ru': 'Редактировать',
      'en': 'Edit Profile',
    },
    '9jyr86yx': {
      'ru': 'bais.lisbreu@gmail.com',
      'en': 'bais.lisbreu@gmail.com',
    },
    'e4txsze8': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // StickTech_SkateStick
  {
    '89hfahh3': {
      'ru': 'Клюшка - конек',
      'en': 'Stick - skate',
    },
    'twzdhwkz': {
      'ru': '90',
      'en': '90',
    },
    'p1d2v68q': {
      'ru': 'Важность',
      'en': 'Importance',
    },
    '2f1b0fvw': {
      'ru': '75',
      'en': '75',
    },
    'lvecc3gv': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    '14zf87r6': {
      'ru': '65',
      'en': '65',
    },
    'kovv2myo': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    '1b2xh38q': {
      'ru':
          'Расставь линию препятствий и подъезжая к каждому из них совершай ложный показ броска, после чего подворачивай шайбу удобной стороной крюка таким образом, чтобы она отправилась по диагонали под твою дальнюю ногу. Подыграй себе коньком в сторону удобного хвата клюшки спереди и сохрани контроль над шайбой. Следи за тем, чтобы вес тела переносился вслед за шайбой, показывая тем самым более амплитудные движения.',
      'en':
          'Place a line of obstacles and, approaching each of them, perform a false throw, then turn the puck with the convenient side of the hook so that it goes diagonally under your far foot. Play with your skate toward a comfortable front grip of the stick and maintain control over the puck. Make sure that your body weight is transferred after the puck, thereby showing more amplitude movements.',
    },
    'ssbz3vdg': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'tqmdes61': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'etml9xjq': {
      'ru': 'Дриблинг',
      'en': 'Dribbling',
    },
    'b4j3aofw': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // Virazhy_Ulitka
  {
    'zdcojqmy': {
      'ru': 'Улитка',
      'en': 'Snail',
    },
    '6athobtg': {
      'ru': '85',
      'en': '85',
    },
    'dhdw0dvt': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'ky6101er': {
      'ru': '85',
      'en': '85',
    },
    '5e3gjn50': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'tv3j1rtk': {
      'ru': '70',
      'en': '70',
    },
    'yb7j7hil': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'xbuiul8v': {
      'ru':
          'Расставь две стойки в 3-4 метрах друг от друга и начинай движение сбоку по направлению к стойке. Поравнявшись с началом конуса опусти вес тела на внешнюю грань ближней ноги используя ближнюю ногу как основние циркуля, а внутренней гранью дальней ноги контролируй радиус поворота (чем меньше тем лучше), поверни корпус в сторону поворота, присев чуть ниже для придания дополнительного импульса вращательному движению. Соверши поворот на 720 градусов, оказавшись по итогу лицом ко второй стойке, и далее повтори \"улитку\" в другую сторону. Постарайся чтобы первым делом, в сторону разворота поворачивалась голова ( таким образом, в игре у тебя будет навык, который позволит эффективнее выполнять улитку и ориентироваться на площадке) .',
      'en':
          'Place two racks 3-4 meters apart and start moving laterally towards the rack. Having caught up with the beginning of the cone, lower your body weight onto the outer edge of the near leg using the near leg as the main compass, and control the radius of rotation with the inner edge of the far leg (the smaller the better), turn the body in the direction of the turn, crouching a little lower to give additional impulse to the rotational movement. Make a 720-degree turn, ending up facing the second post, and then repeat the “snail” in the other direction. Try to turn your head in the direction of the turn first (this way, in the game you will have a skill that will allow you to more effectively perform a snail and navigate the court).',
    },
    'i3en92of': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'y1c8ld99': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'f4fpg96w': {
      'ru': 'Виражи',
      'en': 'Turns',
    },
    'lz10mjvs': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Health1
  {
    'q8p13z1g': {
      'ru': 'Здоровье',
      'en': 'Health',
    },
    '5r2a77k3': {
      'ru': 'Питание',
      'en': 'Food',
    },
    'v2c759zr': {
      'ru': 'Перейти',
      'en': 'Go!',
    },
    'a6u7yxx3': {
      'ru': 'Психология',
      'en': 'Psychology',
    },
    'e8ywzp2s': {
      'ru': 'Перейти',
      'en': 'Go!',
    },
    'p2mv6hzc': {
      'ru': 'Сон',
      'en': 'Sleep',
    },
    'l11gpfiw': {
      'ru': 'Перейти',
      'en': 'Go!',
    },
    'pdnf6vkj': {
      'ru': 'Ресурсы:',
      'en': 'Resources',
    },
    'ua2hc2jd': {
      'ru':
          '1. https://cyberleninka.ru/article/n/psihologicheskie-aspekty-podgotovki-yunyh-hokkeistov/viewer',
      'en':
          '1. https://cyberleninka.ru/article/n/psihologicheskie-aspekty-podgotovki-yunyh-hokkeistov/viewer',
    },
    'j6c67jc3': {
      'ru':
          '2. https://nashhokkeist.uz/pravila-pitaniya-vo-vremya-hokkeynogo-sezona/#:~:text=%D0%A3%D0%B3%D0%BB%D0%B5%D0%B2%D0%BE%D0%B4%D1%8B%20%D0%B4%D0%BE%D0%BB%D0%B6%D0%BD%D1%8B%20%D0%B1%D1%8B%D1%82%D1%8C%20%D1%81%D0%BE%20%D1%81%D1%80%D0%B5%D0%B4%D0%BD%D0%B8%D0%BC,%2C%20%D1%8F%D0%B9%D1%86%D0%B0%2C%20%D1%84%D0%B0%D1%81%D0%BE%D0%BB%D1%8C%20%D0%B8%20%D1%82.',
      'en':
          '2. https://nashhokkeist.uz/pravila-pitaniya-vo-vremya-hokkeynogo-sezona/#:~:text=%D0%A3%D0%B3%D0%BB%D0%B5%D0%B2%D0%BE%D0%B4%D1%8B%20%D0%B4%D0%BE%D0%BB%D0%B6%D0%BD%D1%8B%20%D0%B1%D1%8B%D1%82%D1%8C%20%D1%81%D0%BE%20%D1%81%D1%80%D0%B5%D0%B4%D0%BD%D0%B8%D0%BC,%2C%20%D1%8F%D0%B9%D1%86%D0%B0%2C%20%D1%84%D0%B0%D1%81%D0%BE%D0%BB%D1%8C%20%D0%B8%20%D1%82.',
    },
    '7mkmqx5x': {
      'ru': '3. https://worldclassmag.com/health/son-i-trenirovochnyi-rezhim/',
      'en': '3. https://worldclassmag.com/health/son-i-trenirovochnyi-rezhim/',
    },
    '1w8q923i': {
      'ru': 'Здоровье',
      'en': 'Health',
    },
  },
  // TechOfSkate
  {
    'msaiejbu': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    '96r9ms93': {
      'ru': 'Грани',
      'en': 'Edges',
    },
    'x8h1io8e': {
      'ru': 'Переступания',
      'en': 'Steps',
    },
    'jlpt6f7l': {
      'ru': 'Виражи',
      'en': 'Turns',
    },
    'hx3r7kg0': {
      'ru': 'Кораблики',
      'en': 'Ships',
    },
    'j8ay9fm6': {
      'ru': 'Прогресс катания',
      'en': 'Skating progress',
    },
    'gqfynnak': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Training
  {
    'gycs5hxn': {
      'ru': 'Тренировки',
      'en': 'Train',
    },
    '22xa3y0m': {
      'ru': 'Лед',
      'en': 'Ice',
    },
    'lpbd39yd': {
      'ru': 'Земля',
      'en': 'Earth',
    },
    'iwy0yc55': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'o3n4o69x': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'emn0kut7': {
      'ru': 'Дриблинг',
      'en': 'Dribbling',
    },
    '4xku9x71': {
      'ru': 'Буллиты',
      'en': 'Shootouts',
    },
    'lj427vlb': {
      'ru': 'Лед',
      'en': 'Ice',
    },
    'u0gyh13x': {
      'ru': 'Земля',
      'en': 'Earth',
    },
    '2xe8c64f': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'p9v28swn': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'opyyg254': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'md1s0tsa': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    '9883skuo': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'j58lqg0w': {
      'ru': 'Выносливость',
      'en': 'Endurance',
    },
    'kxpg08lx': {
      'ru': 'Обучение',
      'en': 'Training',
    },
  },
  // Virazhy
  {
    'w1l6pst9': {
      'ru': 'Новичок',
      'en': 'Beginner',
    },
    'fl1f7bim': {
      'ru': 'Любитель',
      'en': 'Amateur',
    },
    'ou297mjd': {
      'ru': 'Профи',
      'en': 'Pro',
    },
    'nfb87bo2': {
      'ru': 'Улитка ',
      'en': 'Snail',
    },
    '357h659w': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    '7ayjx49y': {
      'ru': '4.4',
      'en': '4.4',
    },
    'fnna7g1m': {
      'ru': 'Виражи в кресте',
      'en': 'Turns in the cross',
    },
    '8shrwc5t': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    'r6fq8icg': {
      'ru': '4.7',
      'en': '4.7',
    },
    '689teos7': {
      'ru': 'Новичок',
      'en': 'Beginner',
    },
    'lywgrpsu': {
      'ru': 'Любитель',
      'en': 'Amateur',
    },
    'w6pwo4mp': {
      'ru': 'Профи',
      'en': 'Pro',
    },
    'hbwgxir5': {
      'ru': 'Обманная Улитка',
      'en': 'Fake snail',
    },
    'ezxa8ljg': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    '76362n0q': {
      'ru': '4.8',
      'en': '4.8',
    },
    'yk2eltdc': {
      'ru': 'Улитка +',
      'en': 'Snail +',
    },
    'bofqubhk': {
      'ru': '+10 очков',
      'en': '+10 points',
    },
    '08dkp1v4': {
      'ru': '4.6',
      'en': '4.6',
    },
    'jjtt10rm': {
      'ru': 'Быстрая Улитка',
      'en': 'Fast snail',
    },
    'cifce6iw': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'bu9vxdv3': {
      'ru': '4.8',
      'en': '4.8',
    },
    'a9d8p4pi': {
      'ru': 'Улитка с подрезом',
      'en': 'Snail + Trimming',
    },
    'os66bs99': {
      'ru': '+10 очков',
      'en': '+10 points',
    },
    'lvaxgi4b': {
      'ru': '5.0',
      'en': '5.0',
    },
    'biznnrsq': {
      'ru': 'Новичок',
      'en': 'Beginner',
    },
    'qxnbobbd': {
      'ru': 'Любитель',
      'en': 'Amateur',
    },
    '3qzslam9': {
      'ru': 'Профи',
      'en': 'Pro',
    },
    'mpb6jype': {
      'ru': 'Улитка с прыжком',
      'en': 'Snail + Jump',
    },
    '2exxsknn': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'l8eguffn': {
      'ru': '5.0',
      'en': '5.0',
    },
    'g41uqzln': {
      'ru': 'Комплекс 1',
      'en': 'Complex 1',
    },
    'y4w2nb4g': {
      'ru': '+30 очков',
      'en': '+30 points',
    },
    'dgq31kma': {
      'ru': '5.0',
      'en': '5.0',
    },
    'lk62uybu': {
      'ru': 'Комплекс 2',
      'en': 'Complex 2',
    },
    'i13cv77q': {
      'ru': '+30 очков',
      'en': '+30 points',
    },
    'r3ad66op': {
      'ru': '4.9',
      'en': '4.9',
    },
    '2c5haopv': {
      'ru': 'Виражи',
      'en': 'Turns',
    },
    'g5ge4tpz': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Edges
  {
    '19lmm8xr': {
      'ru': 'Новичок',
      'en': 'Beginner',
    },
    'vy715y70': {
      'ru': 'Любитель',
      'en': 'Amateur',
    },
    'ktm44z4w': {
      'ru': 'Профи',
      'en': 'Pro',
    },
    '8q3e9ktf': {
      'ru': 'Внутреннее ребро',
      'en': 'Inside edge',
    },
    'vpjpjosk': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'zpc6oa5v': {
      'ru': '4.3',
      'en': '4.3',
    },
    'k1wj0r3e': {
      'ru': 'Внешнее ребро',
      'en': 'Outside edge',
    },
    'v91l1w2b': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'q5mtvsf7': {
      'ru': '4.3',
      'en': '4.3',
    },
    'r890lybe': {
      'ru': 'Слалом ',
      'en': 'Slalom',
    },
    'fu452crw': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    '8mt5yacr': {
      'ru': '4.2',
      'en': '4.2',
    },
    'd1y1iob9': {
      'ru': 'Торможение 1',
      'en': 'Stop 1',
    },
    'ixkrfdmo': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'xf3d5xfr': {
      'ru': '4.4',
      'en': '4.4',
    },
    '9q123fok': {
      'ru': 'Фонарики ',
      'en': 'Flashlight',
    },
    'cgchu7ww': {
      'ru': '+10 очков',
      'en': '+10 points',
    },
    'px5ynaa5': {
      'ru': '4.2',
      'en': '4.2',
    },
    'wlu0cdfx': {
      'ru': 'Переход на спину',
      'en': 'Switch to back',
    },
    'mcb85hjg': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    '4vq1c7g5': {
      'ru': '4.7',
      'en': '4.7',
    },
    'bblqd7bu': {
      'ru': 'Новичок',
      'en': 'Beginner',
    },
    'hwugezs8': {
      'ru': 'Любитель',
      'en': 'Amateur',
    },
    'iwvn76de': {
      'ru': 'Профи',
      'en': 'Pro',
    },
    'nz1hfp1i': {
      'ru': 'Плиометрика',
      'en': 'Pliometric',
    },
    'ppit0svo': {
      'ru': '+10 очков',
      'en': '+10 points',
    },
    'wmuru7pi': {
      'ru': '4.5',
      'en': '4.5',
    },
    'c6xlqps4': {
      'ru': 'Скрестный шаг',
      'en': 'Cross step',
    },
    'ug2ae1rd': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    '9l3p6grr': {
      'ru': '4.4',
      'en': '4.4',
    },
    'hqyqgime': {
      'ru': 'Торможение 2',
      'en': 'Stop 2',
    },
    'edr5uu4w': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'pb4ycrmd': {
      'ru': '4.7',
      'en': '4.7',
    },
    'm2gzxk3j': {
      'ru': 'Тормоз - взрыв',
      'en': 'Stop - Start',
    },
    '3j88bdvd': {
      'ru': '+25 очков',
      'en': '+25 points',
    },
    'j7ldzieo': {
      'ru': '4.9',
      'en': '4.9',
    },
    'o5t62hck': {
      'ru': 'Спина-лицо',
      'en': 'From back to front',
    },
    'stuv28n2': {
      'ru': '+25 очков',
      'en': '+25 points',
    },
    '594u4ii5': {
      'ru': '4.9',
      'en': '4.9',
    },
    '6c0p5jgp': {
      'ru': 'Новичок',
      'en': 'Beginner',
    },
    '3tx34haz': {
      'ru': 'Любитель',
      'en': 'Amateur',
    },
    '54ral5nd': {
      'ru': 'Профи',
      'en': 'Pro',
    },
    'jsnb62ge': {
      'ru': 'Слалом (1 н.)',
      'en': '1 leg slalom',
    },
    'g65sbjiq': {
      'ru': '+30 очков',
      'en': '+30 points',
    },
    'd9rqe3ih': {
      'ru': '5.0',
      'en': '5.0',
    },
    'uywdavmc': {
      'ru': 'Подрезание и убор',
      'en': 'Slice + Underself',
    },
    '51c4k2ne': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    '2j6uyhzq': {
      'ru': '4.8',
      'en': '4.8',
    },
    '6wjmdv8k': {
      'ru': 'Комплекс',
      'en': 'Complex',
    },
    '3vrt5e8a': {
      'ru': '+30 очков',
      'en': '+30 points',
    },
    't7gnbg7o': {
      'ru': '5.0',
      'en': '5.0',
    },
    '9oelnqao': {
      'ru': 'Переход в прыжке',
      'en': 'Jumping switch',
    },
    '4s5os62o': {
      'ru': '+25 очков',
      'en': '+25 points',
    },
    'gtl7zuqt': {
      'ru': '5.0',
      'en': '5.0',
    },
    'aycdltxy': {
      'ru': 'Грани',
      'en': 'Edges',
    },
    'gfv76l3l': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Steps
  {
    'rvlsgr0t': {
      'ru': 'Новичок',
      'en': 'Beginner',
    },
    'iner4v5r': {
      'ru': 'Любитель',
      'en': 'Amateur',
    },
    'paj5vmcd': {
      'ru': 'Ближней ногой',
      'en': 'Near foot',
    },
    'esd0go9e': {
      'ru': '+10 очков',
      'en': '+10 points',
    },
    'a28m7qyl': {
      'ru': '4.5',
      'en': '4.5',
    },
    'u6339nlw': {
      'ru': 'Дальней ногой',
      'en': 'Far foot',
    },
    '02z4qog6': {
      'ru': '+10 очков',
      'en': '+10 points',
    },
    'ouwgzgjz': {
      'ru': '4.5',
      'en': '4.5',
    },
    '93yo6j8x': {
      'ru': 'Ближней ногой (с.)',
      'en': 'Near foot (b.)',
    },
    'k26smzzn': {
      'ru': '+10 очков',
      'en': '+10 points',
    },
    '4j4szklk': {
      'ru': '4.6',
      'en': '4.6',
    },
    's4d86u8x': {
      'ru': 'Дальней ногой (с.)',
      'en': 'Far foot (b.)',
    },
    '5r4cefrz': {
      'ru': '+10 очков',
      'en': '+10 points',
    },
    'i0i7mhl1': {
      'ru': '4.6',
      'en': '4.6',
    },
    'qfo4xjg0': {
      'ru': 'Змейка ',
      'en': 'Snake',
    },
    'dey6h4f6': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    'kt2z5wjx': {
      'ru': '4.6',
      'en': '4.6',
    },
    'q1hy4kfz': {
      'ru': 'Новичок',
      'en': 'Beginner',
    },
    'dxo878a1': {
      'ru': 'Любитель',
      'en': 'Amateur',
    },
    'gf6jkdrv': {
      'ru': 'Ближней +',
      'en': 'Near foot +',
    },
    'fqphvueq': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    'j57dft2z': {
      'ru': '4.7',
      'en': '4.7',
    },
    'uixk3l5y': {
      'ru': 'Ближней + (с.)',
      'en': 'Near foot + (b.)',
    },
    'gppsk3bz': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    'v2o9zf8d': {
      'ru': '4.7',
      'en': '4.7',
    },
    '603l9yl7': {
      'ru': 'Переступания',
      'en': 'Steps',
    },
    'ci3uerb8': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Ships
  {
    'vn4htwwr': {
      'ru': 'Новичок',
      'en': 'Beginner',
    },
    'p710irf5': {
      'ru': 'Любитель',
      'en': 'Amateur',
    },
    'wabkkzfo': {
      'ru': 'Профи',
      'en': 'Pro',
    },
    'kxndsd9p': {
      'ru': 'Кораблик ',
      'en': 'Ship',
    },
    'f5m7ur8d': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'l5zz37cw': {
      'ru': '4.7',
      'en': '4.7',
    },
    'lhvzvbc2': {
      'ru': 'Корабль с улиткой',
      'en': 'Ship with a snail',
    },
    'gfaituib': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    'ixgkihdb': {
      'ru': '4.6',
      'en': '4.6',
    },
    'lngzawqp': {
      'ru': 'Прямая на корабле',
      'en': 'Ship on forward',
    },
    'ooks6flf': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    '654dx83y': {
      'ru': '4.7',
      'en': '4.7',
    },
    'bn5b6udk': {
      'ru': 'Новичок',
      'en': 'Beginner',
    },
    'ewmzaxbf': {
      'ru': 'Любитель',
      'en': 'Amateur',
    },
    '8ue5yayp': {
      'ru': 'Профи',
      'en': 'Pro',
    },
    'p41ekma1': {
      'ru': 'Корабль с убором',
      'en': 'Ship with underself',
    },
    '9gijt7gb': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    '9aafpwi7': {
      'ru': '4.6',
      'en': '4.6',
    },
    'wccfri22': {
      'ru': 'Корабль восьмерка',
      'en': 'Ship with eight',
    },
    'dnvn4j6r': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    'tlg02lvs': {
      'ru': '4.6',
      'en': '4.6',
    },
    'cbusjqcy': {
      'ru': 'Корабль + присед',
      'en': 'Ship with sitting',
    },
    'wljtbaz3': {
      'ru': '+10 очков',
      'en': '+10 points',
    },
    'sflfbb2n': {
      'ru': '4.6',
      'en': '4.6',
    },
    'l0ry6z35': {
      'ru': 'Треугольник 1',
      'en': 'Triangle 1',
    },
    'kv8ixlod': {
      'ru': '+30 очков',
      'en': '+30 points',
    },
    'mhjw68l5': {
      'ru': '5.0',
      'en': '5.0',
    },
    'j3oro857': {
      'ru': 'Новичок',
      'en': 'Beginner',
    },
    'zuzytkyh': {
      'ru': 'Любитель',
      'en': 'Amateur',
    },
    '1b3kf3z8': {
      'ru': 'Профи',
      'en': 'Pro',
    },
    'g99ee6y1': {
      'ru': 'Корабль (п. + у.)',
      'en': 'Ship (j + s)',
    },
    '8elitylg': {
      'ru': '+25 очков',
      'en': '+25 points',
    },
    '77tphzpz': {
      'ru': '4.9',
      'en': '4.9',
    },
    'irdk72hy': {
      'ru': 'Треугольник 2',
      'en': 'Triangle 2',
    },
    'hz33clps': {
      'ru': '+30 очков',
      'en': '+30 points',
    },
    'xg38siz3': {
      'ru': '5.0',
      'en': '5.0',
    },
    'ks8tjezw': {
      'ru': 'Обратный корабль',
      'en': 'Reverse ship',
    },
    'vqw3b4q7': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    '7s1d28wo': {
      'ru': '5.0',
      'en': '5.0',
    },
    'v10qrzpe': {
      'ru': 'Комплекс',
      'en': 'Complex',
    },
    '2r7kuxup': {
      'ru': '+30 очков',
      'en': '+30 points',
    },
    'ysjmezim': {
      'ru': '5.0',
      'en': '5.0',
    },
    'otc0j5go': {
      'ru': 'Кораблики',
      'en': 'Ships',
    },
    'usfsczhj': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Virazhy_FastUlitka
  {
    'vqhbyupf': {
      'ru': 'Быстрая Улитка',
      'en': 'Fast Snail',
    },
    'ga6y9by0': {
      'ru': '75',
      'en': '75',
    },
    'pmpblz0e': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    '3qpfi3mw': {
      'ru': '75',
      'en': '75',
    },
    'vf1958xw': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'qsth311m': {
      'ru': '80',
      'en': '80',
    },
    'ou1mk12x': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'twji2gim': {
      'ru':
          'Для быстрого выполнения \"улитки\", тебе нужно присесть чуть ниже чем обычно, и больше наклонить вес тела на внешнюю грань ближней к стойке ноги, почти как при подрезании, только без притормаживания. Также не забывай поворачивать в первую очередь голову, и старайся держать крюк клюшки (шайбу) ближе к конькам, для лучшего контроля.',
      'en':
          'To quickly perform a snail, you need to squat a little lower than usual and tilt your body weight more onto the outer edge of the leg closest to the stance, almost like when cutting, only without braking. Also, remember to turn your head first, and try to keep the shaft of your stick (puck) closer to your skates for better control.',
    },
    'j9t5mv1u': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'rcmprq43': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '3rrh6ipk': {
      'ru': 'Виражи',
      'en': 'Turns',
    },
    '6npdsnhz': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Virazhy_UlitkaBTOF
  {
    '4tf4wcip': {
      'ru': 'Переход + улитка в восьмерке',
      'en': 'Transition + snail in figure eight',
    },
    's6uz6lvl': {
      'ru': '75',
      'en': '75',
    },
    'b9frkn0j': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'fvj6odtw': {
      'ru': '85',
      'en': '85',
    },
    'pbjh04hr': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'vdlkhlwg': {
      'ru': '70',
      'en': '70',
    },
    'mer145px': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'eop38mze': {
      'ru':
          'Расставь три стойки в виде равнобедренного треугольника, на расстоянии в 3-4 метра друг от друга с двумя стойками в основании и одной вершиной. Начинай движение от одной из стоек оснований изнутри к вершине, доехав до середины стойки,соверши переход на спину, скрестный шаг назад и  переход на лицо (катясь в это время в сторону начальной стойки основания) и соверши улитку на стойке выехав по направлению ко второй стойке основания. На ней также соверши улитку, и на этот раз выедь в сторону стойки вершины, закольцевав тем самым упражнение, либо сделай вираж объехав треугольник, продолжив движение ко второму такому же треугольнику (если ты поставил линию из трех таких треугольников).',
      'en':
          'Arrange three posts in the form of an isosceles triangle, 3-4 meters apart, with two posts at the base and one at the top. Start moving from one of the base racks from the inside to the top, having reached the middle of the rack, make a transition to your back, a cross step back and a transition to the face (rolling at this time towards the initial base rack) and perform a snail on the rack moving towards the second rack grounds. Do a snail on it as well, and this time move towards the apex post, thereby completing the exercise, or make a turn, going around the triangle, continuing to move towards the second similar triangle (if you placed a line of three such triangles).',
    },
    '61brv79p': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '902jf9a4': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'l8od51av': {
      'ru': 'Виражи',
      'en': 'Turns',
    },
    '0uqdk5ov': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Virazhy_LiyingUlitka
  {
    'r2w7v7gs': {
      'ru': 'Обманная Улитка',
      'en': 'Trick Snail',
    },
    '25vmtfb4': {
      'ru': '85',
      'en': '85',
    },
    'f9oz4grb': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'qqppth5l': {
      'ru': '85',
      'en': '85',
    },
    'k27bh7a4': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    '8jx3ywh1': {
      'ru': '80',
      'en': '80',
    },
    'ivjkl466': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'cuxrzdm0': {
      'ru':
          'Расставь две стойки на расстоянии 3-5 метров друг от друга и начинай движение с боку к одной из стоек. Поравнявшись с началом стойки перенеси вес тела на ближнюю к стойке ногу, начиная выполнять элемент улитка, и в момент когда уже кажется что начнется поворот по предсказуемой траектории, резко выбрось дальнюю от стойки ногу вперед, выполнив элемент \"подрезание\" переходящее в вираж в обратном направлении. Таким образом, ты сможешь легко уходить от  защитников в углах. Обрати внимание на то, чтобы первое обманное движение было достоверным - перенеси вес тела как при настоящей улитке, и лишь в последний момент резко поменяй направление на обратное.',
      'en':
          'Place two racks at a distance of 3-5 meters from each other and start moving from the side to one of the racks. Having caught up with the beginning of the stance, transfer your body weight to the leg closest to the stance, starting to perform the snail element, and at the moment when it already seems that the turn along a predictable path will begin, sharply throw the leg farthest from the stance forward, performing the “cutting” element, turning into a turn in the opposite direction . This way you can easily escape defenders in the corners. Pay attention to the fact that the first deceptive movement is reliable - shift your body weight as if it were a real snail, and only at the last moment sharply change the direction to the opposite.',
    },
    'jcfevm0a': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'lzdjgsaq': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'mx4s1b70': {
      'ru': 'Виражи',
      'en': 'Turns',
    },
    'cxz2bc9z': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Virazhy_Christ
  {
    'kydp0wty': {
      'ru': 'Виражи в кресте',
      'en': 'Turns in the cross',
    },
    'soh3b8k5': {
      'ru': '65',
      'en': '65',
    },
    'zmr1b9da': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'gqilte1i': {
      'ru': '75',
      'en': '75',
    },
    'yhvtmj2n': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    '48xzmzts': {
      'ru': '70',
      'en': '70',
    },
    'l3595d94': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'rbk8lw0t': {
      'ru':
          'Расставь пять стоек в форме креста, в 2-3 метрах друг от друга. Начинай с нижней точки и двигайся к центру, на центральной точке сделай вираж к правой точке, доехав до правой точки, вернись к центральной и поверни направо к верхней точке, от нее заверни к центральной, от центральной, снова направо к левой стойке, снова к центральной точке, и последним на подходе виражом вернись к изначальной точке. Чередуй вираж на стойках - с левой и правой стороны, и старайся выполнять все упражнение в посадке, не выпрямляясь.',
      'en':
          'Arrange five racks in the shape of a cross, 2-3 meters from each other. Start from the bottom point and move to the center, at the center point make a turn to the right point, having reached the right point, return to the center and turn right to the top point, from there turn to the center, from the center, again to the right to the left post, again to the central point, and with the last turn on the approach, return to the starting point. Alternate turns on the racks - on the left and right sides, and try to perform the entire exercise in a landing position without straightening up.',
    },
    'oxk3oyyt': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '8uva6gt5': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'b3xugu77': {
      'ru': 'Виражи',
      'en': 'Turns',
    },
    '0lqp1r4l': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Virazhy_UlitkaPlusJump
  {
    '2graw6d6': {
      'ru': 'Улитка + Прыжок\n+ Вираж',
      'en': 'Snail + Jump\n+ Turn',
    },
    '07fmgjgt': {
      'ru': '90',
      'en': '90',
    },
    'f3btn8fg': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    '1j0zqgzy': {
      'ru': '90',
      'en': '90',
    },
    'qnrea1sr': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    '35tspirw': {
      'ru': '90',
      'en': '90',
    },
    'a3fczj7j': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'pu7b7xlw': {
      'ru':
          'Поставь стойку и перепрыгиваемое препятствие на расстоянии в 2-3 метрах друг от друга, и начни выполнение упражнения с улитки на первой стойке, после этого продолжи движение по дуге к перепрыгиваемому препятствию и по ходу движения перепрыгни его приземлившись на внешнюю грань ближней к препятствию ноги, опустив на нее вес тела, после чего измени направление движения на обратное совершив вираж, похожий на тот, что ты делаешь при \"ложной улитке\". Обрати внимание на качественное приземление на лед, ты должен смягчить приземление, небольшим приседанием. Перед выполнением упражнения, хорошо разомни галеностопы. ',
      'en':
          'Place the stand and the obstacle to be jumped at a distance of 2-3 meters from each other, and start the exercise with a snail on the first stand, then continue moving in an arc towards the obstacle to be jumped over and, as you move, jump over it, landing on the outer edge of the leg closest to the obstacle, lowering your body weight onto it, then change the direction of movement to the opposite direction, making a turn similar to what you do with a “false snail”. Pay attention to a good landing on the ice; you should soften the landing by squatting slightly. Before performing the exercise, stretch your ankles well.',
    },
    '72blgop3': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'ey4389jo': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '3828h032': {
      'ru': 'Виражи',
      'en': 'Turns',
    },
    'fyv46ibs': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Edges_Inside
  {
    'e8kv9qkl': {
      'ru': 'Прокат на внутреннем ребре',
      'en': 'Rolled on the inner edge',
    },
    '7qoymeyq': {
      'ru': '80',
      'en': '80',
    },
    'xcpzdr2q': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'ux7ejbgi': {
      'ru': '85',
      'en': '85',
    },
    'lhwil5gq': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'm7cbzfaf': {
      'ru': '70',
      'en': '70',
    },
    'b2815isb': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'gcmho2md': {
      'ru':
          'Прокат на внутреннем ребре в хоккее - это важный элемент, который позволяет хоккеисту эффективно передвигаться по льду, особенно при высокой скорости. Чтобы выполнить прокат на внутреннем ребре, следуй этим шагам:\n\n1. Начни с правильной постановки ног:\n   - Стой на коньках, согнутых в коленях и наклоненных вперед.\n   - Одна нога (внешняя) будет выполнять прокат, а другая (внутренняя) будет поддерживать равновесие.\n\n2. Перенеси вес на внешнюю ногу и внутреннюю грань ее конька:\n   - Внутренняя нога должна оставаться на весу, контролируя равновесие.\n\n3. Поверни конец конька:\n   - Наклоись в направлении поворота и немного поверни конец конька в сторону, в которую хочешь выполнить прокат, в данном случае тебе следует заворачивать полукругом.\n   - Полагайся на внутреннее ребро конька для создания силы и управления направлением.\n\n5. Оттолкнись:\n   - Оттолкнись от льда внутренним ребром ноги, которая выполняет прокат.\n   - Поддерживай равновесие второй ногой и продолжай движение вдоль нужной траектории.\n\n7. Смени ногу:\n     - Отталкиваясь поставь вторую ногу на лед, на внешнее ребро, и передай ей функцию управления направлением.\n      - После того как ты оттолкнешься первой ногой, подними ее в воздух, теперь она отвечает за управление балансом.\n\n8. Продолжай движения: \n     - Приземлившись на внешнее ребро второй ноги, после отталкивания и поднимания вверх первой ноги, перенеси вес тела на внутреннее ребро второй ноги которая выполняет прокат и продолжай управлять направлением с помощью наклона тела и направлением носка конька.\n\nОбрати внимание на то, чтобы держать плечи всегда на одном уровне не подскакивая вверх и вниз, а направляя всю энергию толчка только вперед по направлению траектории. И старайся двигаться в хоккейной посадке на полусогнутых в прокате ногах.',
      'en':
          'The inside edge roll in hockey is an important element that allows a hockey player to move efficiently across the ice, especially at high speed. To roll on an inside edge, follow these steps:\n\n1. Start with proper foot placement:\n   - Stand on your skates with your knees bent and leaning forward.\n   - One leg (outer) will perform the roll, and the other (inner) will maintain balance.\n\n2. Shift your weight to your outside leg and the inside edge of your skate:\n   - The inside leg should remain suspended, maintaining balance.\n\n3. Turn the end of the skate:\n   - Lean in the direction of the turn and slightly turn the end of the skate in the direction you want to skate, in this case you should turn it in a semicircle.\n   - Rely on the inner edge of the skate to generate force and control direction.\n\n5. Push off:\n   - Push off the ice with the inner edge of your rolling leg.\n   - Maintain balance with your other leg and continue moving along the desired path.\n\n7. Change your leg:\n     - When pushing off, place your second foot on the ice, on the outer edge, and transfer the direction control function to it.\n      - After you push off with your first leg, lift it into the air, now it is responsible for controlling balance.\n\n8. Keep moving:\n     - Landing on the outer edge of the second leg, after pushing off and lifting the first leg up, transfer your body weight to the inner edge of the second leg that is rolling and continue to control the direction using the tilt of the body and the direction of the toe of the skate.\n\nPay attention to keeping your shoulders always at the same level, not jumping up and down, but directing all the energy of the push only forward in the direction of the trajectory. And try to move in a hockey position with your legs half-bent.',
    },
    'uboqidr5': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'j6vszx2z': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'qjssfcw9': {
      'ru': 'Грани',
      'en': 'Edges',
    },
    'm1vsboyt': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Edges_Outside
  {
    'hzkrq36h': {
      'ru': 'Прокат на внешнем ребре',
      'en': 'Rolled on the outer edge',
    },
    '4u1gvzyx': {
      'ru': '80',
      'en': '80',
    },
    'mkd3k42u': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'ryu5d91e': {
      'ru': '85',
      'en': '85',
    },
    'ag6h47q4': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'ceo3lehj': {
      'ru': '70',
      'en': '70',
    },
    'qgsrelmh': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'eoqkx3d2': {
      'ru':
          'Прокат на внешнем ребре в хоккее - это важный элемент, который позволяет хоккеисту эффективно передвигаться по льду, особенно при высокой скорости. Чтобы выполнить прокат на внешнем ребре, следуй этим шагам:\n\n1. Начни с правильной постановки ног:\n   - Стой на коньках, согнутых в коленях и наклоненных вперед.\n   - Одна нога (внутренняя) будет выполнять прокат, а другая (внешняя) будет поддерживать равновесие.\n\n2. Перенеси вес на внутреннюю ногу и внешнюю грань ее конька:\n   - Внешняя нога, после толчка, должна оставаться на весу, контролируя равновесие.\n\n3. Поверни конец конька:\n   - Наклонись в направлении поворота и немного поверни конец конька в сторону, в которую хочешь выполнить прокат, в данном случае тебе следует заворачивать полукругом.\n   - Полагайся на внешнее ребро конька для создания силы и управления направлением.\n\n4. Оттолкнись:\n   - Когда выполнишь заворот полукругом на одной ноге и снова поедешь по прямой, оттолкнись от льда внешним ребром ноги, которая выполняет прокат.\n   - При отталкивании поставь вторую ногу на лед на внутренне ребро\n\n5. Смени ногу:\n     - Поставив вторую ногу на лед передай ей функцию управления направлением.\n      - После того как ты оттолкнешься первой ногой, подними ее в воздух, теперь она отвечает за управление балансом.\n\n6. Продолжай движения: \n     - Приземлившись на внутреннее ребро второй ноги, после отталкивания и поднимания вверх первой ноги, перенеси вес тела на внешнее ребро ноги которая выполняет прокат и продолжай управлять направлением с помощью наклона тела и направлением носка конька.\n\nОбрати внимание на то, чтобы держать плечи всегда на одном уровне не подскакивая вверх и вниз, а направляя всю энергию толчка только вперед по направлению траектории. И старайся двигаться в хоккейной посадке на полусогнутых в прокате ногах.',
      'en':
          'The outside edge roll in hockey is an important element that allows a hockey player to move efficiently across the ice, especially at high speed. To roll on an outside edge, follow these steps:\n\n1. Start with proper foot placement:\n   - Stand on your skates with your knees bent and leaning forward.\n   - One leg (inner) will perform the roll, and the other (outer) will maintain balance.\n\n2. Shift your weight to your inside leg and the outside edge of your skate:\n   - The outside leg, after the push, should remain suspended, controlling balance.\n\n3. Turn the end of the skate:\n   - Lean in the direction of the turn and slightly turn the end of the skate in the direction you want to skate, in this case you should turn it in a semicircle.\n   - Rely on the outside edge of the skate to generate force and control direction.\n\n4. Push off:\n   - When you complete the turn in a semicircle on one leg and go straight again, push off from the ice with the outer edge of the leg that is rolling.\n   - When pushing off, place your other foot on the ice on the inside edge\n\n5. Change your leg:\n     - By placing your other foot on the ice, give it the directional control function.\n      - After you push off with your first leg, lift it into the air, now it is responsible for controlling balance.\n\n6. Keep moving:\n     - Landing on the inside edge of the second leg, after pushing off and lifting the first leg up, transfer your body weight to the outside edge of the leg that is rolling and continue to control the direction using the tilt of the body and the direction of the toe of the skate.\n\nPay attention to keeping your shoulders always at the same level, not jumping up and down, but directing all the energy of the push only forward in the direction of the trajectory. And try to move in a hockey position with your legs half-bent.',
    },
    'cuowqfi5': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'zjwfnmva': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '22gzk5nj': {
      'ru': 'Грани',
      'en': 'Edges',
    },
    'llxx8jas': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Edges_Slalom
  {
    'uvbb7p2j': {
      'ru': 'Слалом',
      'en': 'Slalom',
    },
    'xia35zje': {
      'ru': '80',
      'en': '80',
    },
    'ljyycwig': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'jplf8vg7': {
      'ru': '85',
      'en': '85',
    },
    'obfy1spd': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'o7zwjels': {
      'ru': '80',
      'en': '80',
    },
    'bx8ts9k5': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    '2pemk63a': {
      'ru':
          'Упражнение слалом - это отличный способ улучшить координацию и равновесие при катании на коньках. Вот как его выполнить:\nНачни с правильной постановки ног:\nСтой на коньках, с согнутыми в коленях ногами и слегка наклонясь вперед.\nРаспредели вес равномерно между обеими ногами, которые должны стоять рядом друг с другом, практически конек к коньку.\nНачни движение вперед, используя короткие, управляемые толчки.\nПоочередно сгибай и разгибай ноги, как будто ты рисуешь \"S\" или зигзаг на льду.\nИспользуй руки для баланса, они могут помочь сохранять равновесие. \nУправляй скоростью:\nЧтобы увеличить скорость, увеличь амплитуду движений ногами. Чтобы уменьшить скорость, уменьши амплитуду.\nСледи за тем, чтобы независимо от движения ног корпус оставался ровным и был направлен только вперед.\n',
      'en':
          'Slalom exercise is a great way to improve coordination and balance when skating. Here\'s how to do it:\nStart with proper foot placement:\nStand on skates with your knees bent and slightly leaning forward.\nDistribute your weight evenly between both feet, which should be next to each other, almost skate to skate.\nStart moving forward using short, controlled thrusts.\nAlternately bend and straighten your legs, as if you were drawing an \"S\" or a zigzag on the ice.\nUse your hands for balance, they can help you maintain balance.\nControl the speed:\nTo increase speed, increase the range of motion of your legs. To reduce speed, reduce amplitude.\nMake sure that regardless of the movement of your legs, your body remains level and directed only forward.',
    },
    'k2txgwo3': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'qb11ypw3': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'dr5dfp8p': {
      'ru': 'Грани',
      'en': 'Edges',
    },
    'pvpxzxeq': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Edges_Stop1
  {
    'hylwnpbu': {
      'ru': 'Тормоз классический',
      'en': 'Classic stop',
    },
    'bz2zgwx4': {
      'ru': '90',
      'en': '90',
    },
    '8xe4x9u5': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'ky5anude': {
      'ru': '90',
      'en': '90',
    },
    'pn2fqmzx': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'd6fizkp1': {
      'ru': '80',
      'en': '80',
    },
    '2zygf6ra': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'q6oii5eb': {
      'ru':
          '1. Перенос веса тела: Начни с того, что снимаешь вес с одной из ног и переносишь его на другую. Например, если ты тормозишь левой ногой, то снимаешь вес с правой ноги и переносишь его на левую.\n\n2. Согни ногу: На ноге, на которой ты собираешься делать тормоз, немного согни колено. Это поможет лучше контролировать движение и снизит нагрузку на суставы.\n\n3. Плоская сторона лезвия: Убедись, что лезвие конька, которым ты делаешь тормоз, находится плоско на льду. Не наклоняй его слишком сильно вперед или назад.\n\n4. Примени давление: Чтобы сделать тормоз более эффективным, усиль давление на лезвие конька, которым выполняешь тормоз. Ты можешь сделать это, немного наклоняя вперед верхнюю часть тела.\n\n5. Потренируйся в контроле: Постепенно тренируйся в торможении на коньках, начиная с небольшой скорости и постепенно увеличивая ее. Важно научиться контролировать тормоз и не терять равновесие.\n\n6. Используй другую ногу: Умение делать тормоз на обеих ногах важно для маневрирования на льду. Поэтому тренируйся и на левой, и на правой ноге.\n',
      'en':
          '1. Shifting Your Body Weight: Start by taking the weight off one leg and transferring it to the other. For example, if you brake with your left foot, you take the weight off your right foot and transfer it to your left.\n\n2. Bend your leg: On the leg you are going to brake on, bend your knee slightly. This will help you better control your movement and reduce stress on your joints.\n\n3. Flat side of the blade: Make sure the blade of the skate you are using to brake is flat on the ice. Don\'t tilt it forward or backward too much.\n\n4. Apply Pressure: To make the brake more effective, apply more pressure to the blade of the skate you are using to brake. You can do this by leaning your upper body forward slightly.\n\n5. Practice control: Gradually practice braking on skates, starting at low speed and gradually increasing it. It is important to learn to control the brakes and not lose your balance.\n\n6. Use your other foot: Being able to brake on both feet is important for maneuvering on ice. Therefore, train on both your left and right legs.',
    },
    'wrudo7vv': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'y1pscsyl': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '0b76rheo': {
      'ru': 'Грани',
      'en': 'Edges',
    },
    'e1z5sbzp': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Edges_Fleshlights
  {
    'wzwusre4': {
      'ru': 'Фонарики',
      'en': 'Flashlights',
    },
    'jx47tewo': {
      'ru': '60',
      'en': '60',
    },
    'wrn40akb': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'adk0qxmt': {
      'ru': '75',
      'en': '75',
    },
    'acc7twea': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'b4sxiper': {
      'ru': '60',
      'en': '60',
    },
    '1tx4w6kk': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'duu4usvh': {
      'ru':
          'Наклонись вперед и прижмись ко льду,   согнутыми в коленях, ногами, и начни двигаться вперед с помощью разгибания ног в момент их разведения, а затем снова согни их сводя вместе. Эти движения должны рисовать круг. Важно сохранять низкую позицию во время отталкивания и начала разведения ног, а затем, когда они на 30-40 см. преодолели уровень ширины плеч (в этот момент они должны быть максимально выпрямлены) быстро сводить ноги. Таким образом продвигайся вперед, следи за тем, чтобы спина оставалась ровной и смотри по сторонам, тренируя визуальное ориентирование во время выполнения какого-либо физического действия.',
      'en':
          'Lean forward and press your legs against the ice with your knees bent, and begin to move forward by extending your legs as you spread them, and then bend them again, bringing them together. These movements should draw a circle. It is important to maintain a low position while pushing off and starting to spread your legs, and then, when they are 30-40 cm above shoulder width (at this moment they should be as straight as possible) quickly bring your legs together. Thus, move forward, make sure that your back remains straight and look around, training your visual orientation while performing any physical action.',
    },
    'jr2gh5ue': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '689e49kb': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'te70gsnj': {
      'ru': 'Грани',
      'en': 'Edges',
    },
    'xn754wuy': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Edges_ChristSteps
  {
    'cf5d4kp2': {
      'ru': 'Скрестный шаг',
      'en': 'Cross step',
    },
    'tlgfcw8y': {
      'ru': '70',
      'en': '70',
    },
    'gahg5lwb': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'e37gb4q2': {
      'ru': '80',
      'en': '80',
    },
    'u7ss154q': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'yeldtyui': {
      'ru': '65',
      'en': '65',
    },
    'xz6mt9qc': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'jnnyfr9o': {
      'ru':
          'Оттолкнись одной ногой и перенеси ее в сторону через другую, балансируй оставшейся на льду ноге, двигаясь на внешнем ребре конька. Когда скорость первоначального импульса начнет снижаться опусти перенесенную ногу на внутреннее ребро конька, и оттолкнись, остававшейся изначально на льду, ногой. После чего перенеси ее через только что опустившуюся, которая к этому времени уже должна перестроиться с внутреннего ребра на внешнее. ',
      'en':
          'Push off with one foot and move it to the side over the other, balancing with the remaining foot on the ice, moving on the outer edge of the skate. When the speed of the initial impulse begins to decrease, lower the transferred leg onto the inner edge of the skate, and push off with the leg that initially remained on the ice. Then transfer it over the one that has just descended, which by this time should already be rearranged from the inner edge to the outer one.',
    },
    'cl7e0d6g': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '8c9hu90o': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'iqvwv76e': {
      'ru': 'Грани',
      'en': 'Edges',
    },
    '3mhdjvtu': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Edges_PliometrikaIce
  {
    '4jx2pf7q': {
      'ru': 'Плиометрика крест',
      'en': 'Plyometrics cross',
    },
    '4i0r9q36': {
      'ru': '80',
      'en': '80',
    },
    '4imppf5e': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'tmmdz7ry': {
      'ru': '90',
      'en': '90',
    },
    'p1ovw3yx': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'ti8pxhcj': {
      'ru': '80',
      'en': '80',
    },
    '7e23aean': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    '61pbf9sa': {
      'ru':
          'Расставь пять стоек в виде креста с произвольным (от 2 до 7 метров ) расстоянием между ними. Начинай от нижней стойки бежать к центральной стойке. На ней сделай тромоз и боковыми шагами беги к левой стойке, на ней также сделай тормоз и боковыми шагами беги к правой стойке, минуя центральную. На правой сделай тормоз, вернись боковыми шагами к центральной, и по прямой беги к верхней стойке. После тормоза на верхней стойке, беги спиной вперед к нижней стойке с которой начинал. Суть этого упражнения в резкости смены направления движения. Чем быстрее ты сможешь перестраиваться от действия к действию, тем более резким и опасным игроком станешь.',
      'en':
          'Arrange five racks in the form of a cross with an arbitrary (from 2 to 7 meters) distance between them. Start running from the bottom post to the center post. Do a thromosis on it and run with lateral steps to the left post, also do a brake on it and run with lateral steps to the right post, bypassing the central one. On the right, apply the brake, return with lateral steps to the central one, and run in a straight line to the top post. After braking at the top rack, run backwards to the bottom rack where you started. The essence of this exercise is the sharpness of the change in direction of movement. The faster you can adjust from action to action, the sharper and more dangerous a player you will become.',
    },
    'qy3wvht2': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'zzv1h57u': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'd61z901l': {
      'ru': 'Грани',
      'en': 'Edges',
    },
    '2zp294ll': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Edges_Chelnok
  {
    'nacenmek': {
      'ru': 'Челночный бег боком',
      'en': 'Sideways shuttle run',
    },
    '9k1d4s4w': {
      'ru': '70',
      'en': '70',
    },
    'ochijx8f': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'eij9suns': {
      'ru': '75',
      'en': '75',
    },
    '76g0zmje': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    '1ujn7082': {
      'ru': '65',
      'en': '65',
    },
    'tfotq8nd': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'hqiblur7': {
      'ru':
          'Поставь две стойки на расстоянии в 3-4 метра друг от друга. Начинай стоя прямо перед одной из стоек, и быстрыми скрестными шагами двигайся ко второй стойке. Оказавшись перед второй стойкой затормози и быстро двигайся обратно такими же скрестными шагами, соответсвенно другим боком. Обрати внимание на резкий переход из тормоза в боковой бег в обратном направлении, старайся минимизировать время затраченное на торможение и взрыв в обратную сторону - чем быстрее, тем лучше !',
      'en':
          'Place two racks at a distance of 3-4 meters from each other. Start standing directly in front of one of the racks, and move quickly in cross steps to the second rack. Once in front of the second post, brake and quickly move back with the same cross steps, respectively, on the other side. Pay attention to the sharp transition from the brake to lateral running in the opposite direction, try to minimize the time spent on braking and explosion in the opposite direction - the faster, the better!',
    },
    'fujignqy': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'k18c0lk2': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'hxymj189': {
      'ru': 'Грани',
      'en': 'Edges',
    },
    '21jiodfm': {
      'ru': 'Home',
      'en': '',
    },
  },
  // BTOF_OnBackonForward
  {
    'mjpkinqd': {
      'ru': 'Переход спина/лицо',
      'en': 'Switch to back - to foward',
    },
    'hb31klpe': {
      'ru': '80',
      'en': '80',
    },
    'c9rkgqyg': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'o7kyfhkk': {
      'ru': '80',
      'en': '80',
    },
    '3pf6i6r3': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'kn3n2xwn': {
      'ru': '80',
      'en': '80',
    },
    'mrqakdmz': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    '1gn89bot': {
      'ru':
          'Для выполнения этого элемента, поставь две стойки на расстоянии 4-5 метров друг от друга, и начинай катить от одной стойки к другой с небольшого подката из выбранной стороны. Приблизившись к стойке сделай вираж, и когда твои ноги окажутся на одной линии с центром стойки резко поверни их в обратную от виража сторону, перейдя на катание спиной вперед продолжай движение в заданном направлении. После перехода на спину сделай два шага назад и через половину улитки выполни разворот на лицо, двигаясь в сторону второй стойки. Повтори то же самое на второй стойке, закатываясь с другой стороны. \n\nОбрати внимание - чтобы при переходах плечи оставались в одной плоскости, не подскакивая вверх-вниз, регулируй этот момент за счет посадки и техники катания.',
      'en':
          'To perform this element, place two racks at a distance of 4-5 meters from each other, and start rolling from one rack to the other with a small roll from the selected side. As you approach the rack, make a turn, and when your legs are in line with the center of the rack, sharply turn them in the opposite direction from the turn, switching to skating backwards and continue moving in the given direction. After switching to your back, take two steps back and through half a snail, perform a turn on your face, moving towards the second stance. Repeat the same on the second rack, rolling up on the other side.\n\nPay attention - so that during transitions your shoulders remain in the same plane, without jumping up and down, regulate this moment through your landing and skating technique.',
    },
    'e5tbhmqv': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'pgx1whsu': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'kx658szf': {
      'ru': 'Грани',
      'en': 'Edges',
    },
    '8cw1tch2': {
      'ru': 'Home',
      'en': '',
    },
  },
  // BTOF_Jumping
  {
    'syp1te2b': {
      'ru': 'Переходы в прыжке',
      'en': 'Jump transitions',
    },
    'b8t5ubpq': {
      'ru': '90',
      'en': '90',
    },
    's3f1i0s8': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'csb26lsx': {
      'ru': '90',
      'en': '90',
    },
    'qn2id2ba': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    '1yu8sq89': {
      'ru': '90',
      'en': '90',
    },
    'qd1ywl1f': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'snr5vujv': {
      'ru':
          'Для выполнения упражнения тебе потребуются две стойки и клюшка/палка поставленная на две стойки как на опору. Подъедь к препятствию с небольшого виража и перепрыгни его таким образом, чтобы приземляясь твои ноги уже были повернуты в сторону перехода, и первым же толчком ногой ты должен поехать в обратном направлении. ',
      'en':
          'To perform the exercise you will need two stands and a stick/stick placed on two stands as a support. Approach the obstacle from a slight turn and jump over it in such a way that when landing, your legs are already turned towards the transition, and with the first push of your foot you should go in the opposite direction.',
    },
    'y1gg3e1j': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '2d99ug4w': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '24omu676': {
      'ru': 'Грани',
      'en': 'Edges',
    },
    'fnu8l3ef': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Virazhy_complex
  {
    'fbqyl5ij': {
      'ru': 'Комплекс - Переход + Улитка + Ложная улитка',
      'en': 'Complex - Transition + Snail + False snail',
    },
    'sy5t8c60': {
      'ru': '85',
      'en': '85',
    },
    '6zu3qjak': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'rvb75fo9': {
      'ru': '85',
      'en': '85',
    },
    'gygfhytv': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    '3ihx2ink': {
      'ru': '80',
      'en': '80',
    },
    'pyvw0jr6': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'gae5jx1t': {
      'ru':
          'Расставь стойки в виде треугольника, где вершина находится сбоку, а два основания находятся от тебя по прямой. На первой стойке выполни переход на спину и на лицо, объехав ее по кругу, затем двигайся к боковой стойке и выполни на ней улитку выезжая в сторону третьей стойки. Подъедь к третьей стойке с внешней стороны и заложи корпус для виража вовнутрь, после чего выполни подрезание и вираж в обратную сторону, объезжая треугольник скрестными шагами.',
      'en':
          'Arrange the racks in the form of a triangle, where the top is on the side, and the two bases are in a straight line from you. On the first stand, perform a transition to your back and face, going around it in a circle, then move to the side stand and perform a snail on it, moving towards the third stand. Approach the third post from the outside and lay the body for the turn inward, then cut and turn in the opposite direction, driving around the triangle in cross steps.',
    },
    'g01xe7yf': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'v2g9dv30': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'qxwfp36d': {
      'ru': 'Виражи',
      'en': 'Turns',
    },
    'fx4818r8': {
      'ru': 'Home',
      'en': '',
    },
  },
  // EdgesSlicePlusUborPodSebya
  {
    '894dehlt': {
      'ru': 'Подрезание + убор под себя',
      'en': 'Trimming + tailoring',
    },
    '312fo1bc': {
      'ru': '90',
      'en': '90',
    },
    'etxk8vye': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'qyxol3rg': {
      'ru': '90',
      'en': '90',
    },
    '04ivfghw': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'co70sq76': {
      'ru': '90',
      'en': '90',
    },
    'c504ba6k': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'emip4gs7': {
      'ru':
          'Расставь стойки по прямой, с расстоянием 2-3 метра друг от друга. Начни двигаться немного сбоку к первой стойке и выполни на ней тормоз внешним ребром, не поднимая вторую ногу как при обычном тормозе, а выводя ее вбок, делая скрестный шаг, обеспечивая резкую смену направления движения. В это же время убери шайбу под себя, и оттолкнись ногой которой сделал торможение, а ногой которая сделала переступание задай направление для виража и укрой шайбу от соперника.\nОбрати внимание на то, чтобы после подрезания сделать быстрый скрестный шаг и сильный толчок подрезавшей ногой. Таким образом в игре ты застанешь в расплох защитника, если покажешь что будешь закладывать корпус, а вместо того чтобы лезть на ворота, сделаешь резкое подрезание с уходом в сторону за счет скрестного шага, и освободив тем самым место и время для броска.',
      'en':
          'Place the racks in a straight line, with a distance of 2-3 meters from each other. Start moving a little laterally towards the first post and perform a brake on it with the outer edge, without raising the second leg as with a normal brake, but moving it to the side, making a cross step, ensuring a sharp change in the direction of movement. At the same time, put the puck under you, and push off with the foot that made the braking, and with the foot that made the step, set the direction for the turn and hide the puck from the opponent.\nPay attention to the fact that after cutting, take a quick cross step and a strong push with the cutting leg. Thus, in the game, you will catch the defender by surprise if you show that you will lay down the body, and instead of climbing on the goal, you make a sharp cut and move to the side due to a cross step, thereby freeing up space and time for a throw.',
    },
    'gwaxo9mr': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '4n5trs2w': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '8hu9rxw9': {
      'ru': 'Грани',
      'en': 'Edges',
    },
    'egv46lo7': {
      'ru': 'Home',
      'en': '',
    },
  },
  // VirazhySlicePlusUlitka
  {
    'dp15lj1j': {
      'ru': 'Подрезание + Улитка',
      'en': 'Trimming + Snail',
    },
    'setza1fy': {
      'ru': '85',
      'en': '85',
    },
    '5o4g57ax': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    '3ug37id1': {
      'ru': '85',
      'en': '85',
    },
    'vq51uj03': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'nh2oegbj': {
      'ru': '90',
      'en': '90',
    },
    'de8g75up': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'b2mh9cn0': {
      'ru':
          'Расставь несколько препятствий в виде змейки и начни выполнение упражнения с подрезания возле первой стойки, в сторону второй стойки, на второй стойке сделай улитку в сторону третьей стойки, где снова произведи подрезание уже в сторону четвертой стойки и так далее. Получится что на одной стороне стоек ты будешь делать подрезания а на другой улитки. Чередуй стороны, чтобы развивать навыки всех граней коньков. Старайся не делать лишних шагов между стойками, не семени.',
      'en':
          'Place several obstacles in the form of a snake and start the exercise by cutting near the first rack, towards the second rack, on the second rack make a snail towards the third rack, where again make a cut towards the fourth rack and so on. It turns out that you will make cuts on one side of the posts and snails on the other. Alternate sides to develop skills on all sides of the skate. Try not to take extra steps between the posts, don\'t waste time.',
    },
    'z011iw85': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '8cbecc5j': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '3279jv8i': {
      'ru': 'Виражи',
      'en': 'Turns',
    },
    'bo0c5ykq': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Edges_Stop2
  {
    'qddivqtz': {
      'ru': 'Тормоз внешним ребром',
      'en': 'External edge stop',
    },
    '7iey7p4f': {
      'ru': '90',
      'en': '90',
    },
    'yad8mpsj': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'ito5palr': {
      'ru': '90',
      'en': '90',
    },
    'o0qov3zj': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    '6uve7pcf': {
      'ru': '80',
      'en': '80',
    },
    't5psrwpo': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'ctesa27f': {
      'ru':
          '1. Правильная постановка ног:\n   - Сначала удостоверься, что твоя стойка правильная. Согни колени, наклонись вперед и распредели вес равномерно на обе ноги.\nНачни движение вперед, которое остановишь с помощью тормоза внешним ребром.\n\n2. Перенос веса на внешнюю ногу:\n   - Определи, на какой из ног ты хочешь выполнять тормоз на внешнем ребре. \n   - Перенеси вес на эту ногу, подняв вторую немного вверх надо льдом, для лучшего контроля равновесия.\n\n3. Угол наклона:\n   - Наклони корпус немного назад и в сторону от той ноги, которая будет тормозить.\n\n4. Используй внешнее ребро:\n   - Чтобы тормозить, наклони внешнее ребро этой ноги вниз и внутрь, при этом упорно прижимая его к льду, это создаст трение между льдом и коньком, что приведет к замедлению.\n\n5. Производи постоянное давление:\n   - Постоянно поддерживай давление на внешнее ребро конька, чтобы поддерживать тормозное действие.\n   - Больший угол наклона и большее давление на ребро помогут замедлиться быстрее.\n\n',
      'en':
          '1. Correct foot placement:\n   - First make sure your stance is correct. Bend your knees, lean forward and distribute your weight evenly on both legs.\nStart moving forward, which you stop using the brake with the outer edge.\n\n2. Shifting weight to outside leg:\n   - Decide on which leg you want to perform the brake on the outer edge.\n   - Shift your weight to this leg, lifting the other one slightly above the ice for better balance control.\n\n3. Tilt angle:\n   - Tilt your body a little back and away from the leg that will brake.\n\n4. Use an external edge:\n   - To brake, tilt the outer edge of that foot down and inward, while pressing it firmly into the ice, this will create friction between the ice and the skate, which will lead to deceleration.\n\n5. Apply constant pressure:\n   - Maintain constant pressure on the outer edge of the skate to maintain braking action.\n   - A greater lean angle and more pressure on the edge will help you slow down faster.',
    },
    '6wp2x70b': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'f2c1ztlw': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'o1sc46al': {
      'ru': 'Грани',
      'en': 'Edges',
    },
    '7gxssf24': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Ships_Ship
  {
    'vzmnvvpv': {
      'ru': 'Кораблик',
      'en': 'Ship',
    },
    'dyn51ebb': {
      'ru': '80',
      'en': '80',
    },
    '4j4vm5m0': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'z4kxo73d': {
      'ru': '85',
      'en': '85',
    },
    'mcc0308l': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'eghzmucs': {
      'ru': '80',
      'en': '80',
    },
    '8h1rbshd': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'p623ur06': {
      'ru':
          'Начни движение боком по кругу на внутренних гранях коньков, развернув носки в противоположных друг от друга направлениях. Набирай скорость за счет переноса веса тела с одной ноги на другую. Перенося вес тела на ведущую, немного приподнимай заднюю ногу, важно чтобы на льду ты чувствовал все лезвие конька, а не только носок. Во время переноса веса тела на заднюю ногу, также опирайся на все лезвие конька, поднимая вверх ведущую ногу, немного прокатившись по траектории, оттолкнись задней ногой и перенеси вес тела на переднюю, используя ее в качестве задающего направление  механизма - в какую сторону будет направлен носок - туда ты и поедешь. Старайся держать спину прямо, и находиться в хоккейной посадке.',
      'en':
          'Start moving sideways in a circle on the inner edges of the skates, turning your toes in opposite directions from each other. Gain speed by transferring your body weight from one leg to the other. When transferring your body weight to your leading one, lift your back leg a little; it is important that on the ice you feel the entire blade of the skate, and not just the toe. While transferring your body weight to your back leg, also lean on the entire blade of the skate, lifting your leading leg up, rolling along the path a little, push off with your back leg and transfer your body weight to the front leg, using it as a direction-setting mechanism - in which direction the toe will be pointed - that\'s where you\'ll go. Try to keep your back straight and in a hockey position.',
    },
    'fo9h9q7x': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'osntuscp': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'a4ubjbe7': {
      'ru': 'Кораблики',
      'en': 'Ships',
    },
    'l2t47do2': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Ships_PlusUlitka
  {
    '2erxv4zn': {
      'ru': 'Кораблик + Улитка',
      'en': 'Ship + Snail',
    },
    'a52a4lrm': {
      'ru': '70',
      'en': '70',
    },
    'kbeyiiap': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'a068fh3k': {
      'ru': '80',
      'en': '80',
    },
    'wchc8wcc': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'kvqir4uv': {
      'ru': '75',
      'en': '75',
    },
    '873nua59': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'gtw7ffhf': {
      'ru':
          'Поставь две стойки на расстоянии 2-3 метра друг от друга. Двигайся по дуге в кораблике, огибая вторую стойку и возвращаясь к первой стойке изнутри. Доехав до нее, сделай полную улитку, с выездом в обратную сторону и продолжай двигаться в кораблике огибая вторую стойку и возвращаясь к первой, закольцовывая тем самым упражнение. Получится что на первой стойке ты всегда делаешь улитки с разных сторон, после чего катишь малый круг в кораблике попеременно левым и правым боком.',
      'en':
          'Place two racks at a distance of 2-3 meters from each other. Move in an arc in the boat, going around the second post and returning to the first post from the inside. Having reached it, do a full snail, going in the opposite direction and continue moving in the boat, going around the second post and returning to the first, thereby completing the exercise. It turns out that on the first stand you always make snails from different sides, after which you roll a small circle in a boat alternately with your left and right sides.',
    },
    'v2axloeg': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'zzqq7fr6': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '5a88w218': {
      'ru': 'Кораблики',
      'en': 'Ships',
    },
    'nuuyfx16': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Ships_OnForward
  {
    'gl4o2pw1': {
      'ru': 'Кораблик по прямой',
      'en': 'Ship in a straight line',
    },
    'rpn30rjt': {
      'ru': '75',
      'en': '75',
    },
    '0evaeao7': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'ab29kged': {
      'ru': '80',
      'en': '80',
    },
    'nt9boflj': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'p61xh292': {
      'ru': '75',
      'en': '75',
    },
    '4d5ozdkp': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'npnlyjon': {
      'ru':
          'Выполняй упражнение кораблик, двигаясь по прямой, меняя ведущую ногу на каждый толчковый шаг - раз левая нога и левый бок впереди, следующий толчок - правая нога и правый бок.',
      'en':
          'Perform the boat exercise, moving in a straight line, changing the leading leg for each push step - once the left leg and left side are in front, the next push is the right leg and right side.',
    },
    '8p1hun4e': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'nn0oitjh': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'hyljw694': {
      'ru': 'Кораблики',
      'en': 'Ships',
    },
    'xyfrsdb3': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Ship_ReversePlusUborPodSebya
  {
    '4pvjczi1': {
      'ru': 'Обратный кораблик + убор под себя',
      'en': 'Reverse ship + dressing for yourself',
    },
    'z98m2w29': {
      'ru': '80',
      'en': '80',
    },
    'hnm95ibb': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    '4bbbsjp1': {
      'ru': '80',
      'en': '80',
    },
    'wg4qwz1d': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    't2dmnw5q': {
      'ru': '80',
      'en': '80',
    },
    'ur81n1f1': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'tlh8xvys': {
      'ru':
          'Для выполнения этого упражнения поставь две стойки на расстоянии 2-3 метров и рядом с ними, по диагонали на расстоянии удобном для исполнения элемента поставь по одной шайбе или иному препятствию. Начинай катиться по дуге ко второй стойке, и выполняя элемент обратный кораблик одновременно, обыграй шайбу-препятствие убором под себя и продолжи движение по кругу к первой стойке, на которой выполни все то же самое. Старайся делать это упражнение быстро, но основное внимание удели качеству техники выполнения. Убирая под себя - проводи клюшку как можно ближе к конькам.',
      'en':
          'To perform this exercise, place two racks at a distance of 2-3 meters and next to them, diagonally at a distance convenient for performing the element, place one puck or other obstacle. Start rolling in an arc to the second post, and performing the reverse boat element at the same time, beat the obstacle puck with your body under you and continue moving in a circle to the first post, on which you do the same thing. Try to do this exercise quickly, but pay special attention to the quality of your technique. When putting it under you, move the stick as close to the skates as possible.',
    },
    '3wn7vg33': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'okhl1vw0': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    's9bt470i': {
      'ru': 'Кораблики',
      'en': 'Ships',
    },
    'aocmru5q': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Ships_BTOFPlus8
  {
    '6s75f0tt': {
      'ru': 'Переход + кораблик в восьмерке',
      'en': 'Transition + ship in figure eight',
    },
    'gfgka7kk': {
      'ru': '75',
      'en': '75',
    },
    'zhz288dq': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'gxr1xt8y': {
      'ru': '80',
      'en': '80',
    },
    'szhb3aap': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'xhrym5l0': {
      'ru': '80',
      'en': '80',
    },
    'rndz111z': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    't1bhwp6p': {
      'ru':
          'Расставь три стойки в виде равнобедренного треугольника, на расстоянии в 3-4 метра друг от друга с двумя стойками в основании и одной вершиной. Начинай движение от одной из стоек оснований изнутри к вершине. Доехав до середины стойки,соверши переход на спину, скрестный шаг назад и  переход на лицо (катясь в это время в сторону начальной стойки основания) и соверши вираж в кораблике на стойке выехав по направлению ко второй стойке основания. На ней также соверши вираж в кораблике, и на этот раз выедь в сторону стойки вершины, закольцевав тем самым упражнение, либо сделай вираж объехав треугольник, продолжив движение ко второму такому же треугольнику (если ты поставил линию из трех таких треугольников). Обрати внимание на момент перехода из движения спиной на кораблик в вираже, постарайся сохранить равновесие и осознанность своих движений. С прогрессом, старайся делать упражнение все быстрее и быстрее.',
      'en':
          'Arrange three posts in the form of an isosceles triangle, 3-4 meters apart, with two posts at the base and one at the top. Start moving from one of the base posts from the inside to the top. Having reached the middle of the stance, make a transition to your back, a cross step back and a transition to your face (rolling at this time towards the initial base post) and make a boat turn on the stance, driving towards the second base post. On it, also make a turn in a boat, and this time drive towards the apex post, thereby looping the exercise, or make a turn by going around the triangle, continuing to move to the second similar triangle (if you set up a line of three such triangles). Pay attention to the moment of transition from moving with your back to the boat in a turn, try to maintain balance and awareness of your movements. As you progress, try to do the exercise faster and faster.',
    },
    'ap8aonaj': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'zzz60hdx': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'ok3nolm4': {
      'ru': 'Кораблики',
      'en': 'Ships',
    },
    'v3iutz5l': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Ships_PlusSit
  {
    'vz6q63bp': {
      'ru': 'Кораблик + Приседание',
      'en': 'Ship + Crouch',
    },
    't3phzcio': {
      'ru': '75',
      'en': '75',
    },
    'ij0ry2in': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'iyioprft': {
      'ru': '75',
      'en': '75',
    },
    '2l27hwik': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'ef2c9ow2': {
      'ru': '70',
      'en': '70',
    },
    '59xntrdl': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    '7f0c2ubu': {
      'ru':
          'Выполняй упражнение кораблик, двигаясь по малому кругу, делая приседание в кораблике и касаясь руками льда на двух противоположных точках круга. Это поможет тебе научиться лучше управлять внутренними гранями коньков, и значительно повысит устойчивость в нестандартных ситуациях.',
      'en':
          'Perform the boat exercise, moving in a small circle, doing a boat squat and touching the ice with your hands on two opposite points of the circle. This will help you learn to better control the inner edges of your skates, and will significantly increase your stability in unusual situations.',
    },
    'oiarkmqj': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '7xvqh8e8': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'qyu2mghy': {
      'ru': 'Кораблики',
      'en': 'Ships',
    },
    'vp35tfj1': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Ships_Reverse
  {
    'lc12k6ob': {
      'ru': 'Обратный Кораблик',
      'en': 'Reverse Ship',
    },
    'mw5vxgf7': {
      'ru': '80',
      'en': '80',
    },
    'd2nm34dt': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'opnudxvp': {
      'ru': '85',
      'en': '85',
    },
    'hwrw95bb': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    '42pyc1hh': {
      'ru': '80',
      'en': '80',
    },
    'h1bc29ia': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'fl5pj34n': {
      'ru':
          'Элемент обратный кораблик заключается в ложном развороте задней ноги в позицию из которой обычно начинают делать вираж в обратном направлении, оставляя при этом ведущую ногу катиться прежним курсом, после чего ставшая задней вторая нога кораблика делает характерное отталкивание внутренней гранью лезвия и ты продолжаешь движение в изначальном направлении с новым импульсом. После этого выведи заднюю ногу кораблика в дальнюю ногу виража и продолжай катить по заданной траектории. Таким образом получается кораблик, направленный во внешнюю часть зоны упражнения ( от стоек, тогда как при обычном кораблике все упражнение выполняется на стойки). Обрати внимание на то, что при обратном кораблике, клюшка должна уйти в обратном направлении, показывая всем видом, что ты собираешься сделать вираж. Клюшка в этот момент должна находиться как можно ближе к конькам, сохраняя максимальный контроль над шайбой, и будучи готовой отдать пас, или совершить техничный обыгрыш.',
      'en':
          'The reverse boat element consists of a false turn of the back leg into a position from which they usually begin to turn in the opposite direction, leaving the leading leg to roll in the same direction, after which the second boat leg, which has become the back leg, makes a characteristic push off with the inner edge of the blade and you continue moving in the original direction with new impetus. After this, move the back leg of the boat into the far leg of the turn and continue to roll along the given trajectory. This way, you get a boat directed to the outer part of the exercise zone (from the racks, whereas with a regular boat, the entire exercise is performed on the racks). Pay attention to the fact that when you reverse the boat, the club should go in the opposite direction, showing with all appearance that you are going to make a turn. The stick at this moment should be as close to the skates as possible, maintaining maximum control over the puck, and being ready to pass or make a technical dribble.',
    },
    'gqid0742': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'lqil1mh3': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '75fxf9e8': {
      'ru': 'Кораблики',
      'en': 'Ships',
    },
    'mkcrsvex': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Ships_OnForwardAndUlitka
  {
    'fj4uzvhu': {
      'ru': 'Прямая в кораблике и на улитках',
      'en': 'Straight in a ships and on snails',
    },
    '2vdmspa1': {
      'ru': '85',
      'en': '85',
    },
    'tlp65pxz': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'vyhterea': {
      'ru': '90',
      'en': '90',
    },
    'u37vhtpv': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    '9h7vberq': {
      'ru': '85',
      'en': '85',
    },
    'dwkih29r': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    '0olk5j65': {
      'ru':
          'Расставь прямую из препятствий, расстояние между которыми 2-3 метра. Выполняй на каждой стойке улитку, после чего передвигайся до следующей стойки в кораблике по закруглению, ты должен делать улитки поочередно с разных сторон. Обрати внимание на момент перехода из улитки в кораблик, он должен быть максимально быстрым, и ты не должен терять при этом координацию. Это особенно поможет при игре в углах.  ',
      'en':
          'Place a straight line of obstacles, the distance between which is 2-3 meters. Do a snail on each stand, then move to the next stand in the boat along the curve, you must do snails alternately from different sides. Pay attention to the moment of transition from the snail to the boat, it should be as fast as possible, and you should not lose coordination. This will especially help when playing in corners.',
    },
    'ep0xyuui': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'rxjil0oj': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'zl4380hr': {
      'ru': 'Кораблики',
      'en': 'Ships',
    },
    'qlk5ednx': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Steps_Snake
  {
    'iyl1orcr': {
      'ru': 'Змейка',
      'en': 'Snake',
    },
    'c2j887n0': {
      'ru': '75',
      'en': '75',
    },
    'erfwfzgf': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    '05us47b7': {
      'ru': '70',
      'en': '70',
    },
    '1h2ko2fh': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'w8coez9y': {
      'ru': '65',
      'en': '65',
    },
    'ngg0xciw': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    '2fwltq8j': {
      'ru':
          'Расставь препятствия в виде змейки, и начинай двигаться диагональными переступаниями от стойки к стойке, заворачивая за препятствие и меняя траекторию движения из стороны в сторону. Обрати внимание на быструю смену направления за счет перехода с внешней грани конька на внутреннюю, при выполнении поворота.',
      'en':
          'Place the obstacles in the form of a snake, and begin to move in diagonal steps from rack to rack, turning behind the obstacle and changing the trajectory of movement from side to side. Pay attention to the quick change of direction due to the transition from the outer edge of the skate to the inner one when making a turn.',
    },
    'thzlonjj': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'rs37ixey': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'k400ybgy': {
      'ru': 'Переступания',
      'en': 'Steps',
    },
    'uoqfmurz': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Steps_FirstLeg
  {
    'yu5nmkta': {
      'ru': 'Толчки Ближней Ногой',
      'en': 'Near Foot Push',
    },
    'tqs4nqih': {
      'ru': '65',
      'en': '65',
    },
    '7de4ecrq': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'hqgctqhq': {
      'ru': '65',
      'en': '65',
    },
    '8cpay47x': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'nzp7cag6': {
      'ru': '60',
      'en': '60',
    },
    'xrafv4j5': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'zbowgedl': {
      'ru':
          'Начни движение по малому кругу в хоккейной посадке, держа спину прямо и не отрывая ног ото льда, толкайся только ближней к внутреннему радиусу круга ногой, уводя ее за опорную, которая статично катится. Обрати внимание на то, чтобы отталкиваясь внешней гранью конька, толчок совершала вся стопа, а не только носок, и нога должна выпрямляться до конца в крайней точке. ',
      'en':
          'Start moving in a small circle in a hockey position, keeping your back straight and without taking your feet off the ice, push only with the foot closest to the inner radius of the circle, leading it behind the supporting leg, which rolls statically. Pay attention to the fact that when pushing off with the outer edge of the skate, the entire foot makes the push, and not just the toe, and the leg should straighten to the end at the extreme point.',
    },
    '4z8uoqcg': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'lnz3d05p': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'rf51g4wa': {
      'ru': 'Переступания',
      'en': 'Steps',
    },
    'vse81d9r': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Steps_SecondLeg
  {
    '68do04fr': {
      'ru': 'Толчки дальней ногой',
      'en': 'Far leg pushes',
    },
    '044lq2xi': {
      'ru': '65',
      'en': '65',
    },
    'kxi25n7s': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'o6bgf06i': {
      'ru': '65',
      'en': '65',
    },
    'thot26ra': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'ak0youd6': {
      'ru': '60',
      'en': '60',
    },
    'per181fq': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'h65vvq1m': {
      'ru':
          'Начни движение по малому кругу в хоккейной посадке, держа спину прямо и не отрывая ног ото льда, толкайся только дальней от внутреннего радиуса круга ногой, производя ей характерные для упражнения \"фонарик\" движения. Вторая нога статично катится и получается такой односторонний фонарик. Обрати внимание на то, чтобы отталкиваясь внутренней гранью конька, толчок совершала вся стопа, а не только носок, и нога должна выпрямляться до конца в крайней точке. Старайся держать корпус прямо, не наклоняя плеч. ',
      'en':
          'Start moving in a small circle in a hockey position, keeping your back straight and without taking your feet off the ice, push only with the leg farthest from the inner radius of the circle, making the movements characteristic of the “flashlight” exercise. The second leg rolls statically and you get this one-sided flashlight. Pay attention to the fact that when pushing off with the inner edge of the skate, the entire foot makes the push, and not just the toe, and the leg should straighten to the end at the extreme point. Try to keep your body straight without tilting your shoulders.',
    },
    '4j7vkqcy': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'e5xwe8nm': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '14l8xrz3': {
      'ru': 'Переступания',
      'en': 'Steps',
    },
    'jmmpitzd': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Steps_FirstLegBack
  {
    'u53hwhk1': {
      'ru': 'Толчки Ближней Ногой Спиной',
      'en': 'Pushes with Near Leg and Back',
    },
    'cjvx67dr': {
      'ru': '75',
      'en': '75',
    },
    'j9ukltnk': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    '8weuiw47': {
      'ru': '65',
      'en': '65',
    },
    '3nm93zxp': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    '8dpgvq17': {
      'ru': '65',
      'en': '65',
    },
    '86l0zw5h': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'qg3tt49k': {
      'ru':
          'Начни движение по малому кругу в хоккейной посадке спиной, держа спину прямо и не отрывая ног ото льда, толкайся только ближней к внутреннему радиусу круга ногой, уводя ее за опорную. Обрати внимание на то, чтобы отталкиваясь внешней гранью конька, толчок совершала вся стопа, а не только носок, и нога должна выпрямляться до конца в крайней точке. Не забывай про движения рук и поворот головы.',
      'en':
          'Start moving in a small circle in a hockey position with your back, keeping your back straight and without taking your feet off the ice, push only with the foot closest to the inner radius of the circle, leading it beyond the supporting leg. Pay attention to the fact that when pushing off with the outer edge of the skate, the entire foot makes the push, and not just the toe, and the leg should straighten to the end at the extreme point. Don\'t forget to move your arms and turn your head.',
    },
    'ugih32e9': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '510r37yh': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'x853v4o4': {
      'ru': 'Переступания',
      'en': 'Steps',
    },
    'ktaqlr72': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Steps_SecondLegBack
  {
    'n729amsp': {
      'ru': 'Толчки дальней ногой спиной',
      'en': 'Pushes with the far leg with your back',
    },
    'ejz9d2v1': {
      'ru': '75',
      'en': '75',
    },
    'yxeex645': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    '992a5uy5': {
      'ru': '65',
      'en': '65',
    },
    'o50nbcno': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'u0lek60s': {
      'ru': '65',
      'en': '65',
    },
    '5gbaxg5w': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'ygz9zojx': {
      'ru':
          'Начни движение по малому кругу в хоккейной посадке спиной, держа корпус прямо и не отрывая ног ото льда, толкайся только дальней от внутреннего радиуса круга ногой, производя ей характерные для упражнения \"фонарик\" движения. Вторая нога статично катится и получается такой односторонний фонарик. Обрати внимание на то, чтобы отталкиваясь внутренней гранью конька, толчок совершала вся стопа, а не только носок, и нога должна выпрямляться до конца в крайней точке. Старайся не наклонять плечи, и не забывай крутить головой. ',
      'en':
          'Start moving in a small circle in a hockey position with your back, keeping your body straight and without taking your feet off the ice, push only with the leg farthest from the inner radius of the circle, making the movements characteristic of the “flashlight” exercise. The second leg rolls statically and you get this one-sided flashlight. Pay attention to the fact that when pushing off with the inner edge of the skate, the entire foot makes the push, and not just the toe, and the leg should straighten to the end at the extreme point. Try not to tilt your shoulders, and don\'t forget to turn your head.',
    },
    'a6eqfjz8': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'm4phtxmy': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'whxzr586': {
      'ru': 'Переступания',
      'en': 'Steps',
    },
    '512p4hq3': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Steps_SecondLegPlus
  {
    'tbjd9v7w': {
      'ru': 'Толчки дальней ногой\nРука на льду',
      'en': 'Far foot pushes\nHand on ice',
    },
    'p8irebfu': {
      'ru': '75',
      'en': '75',
    },
    'g5guxqin': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'uwu0jg4e': {
      'ru': '70',
      'en': '70',
    },
    'fglso6n4': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'r1radkuj': {
      'ru': '70',
      'en': '70',
    },
    'o9q78kc9': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'hpl5r4vn': {
      'ru':
          'Начни движение по малому кругу сев ниже чем обычно в хоккейной посадке, но старайся все равно держать спину прямо и не отрывать ног ото льда, толкайся только дальней от внутреннего радиуса круга ногой, производя ей характерные для упражнения \"фонарик\" движения. Ближняя к радиусу круга рука касается льда на протяжении всего выполнения упражнения. Вторая нога статично катится и получается такой односторонний фонарик. Обрати внимание на то, чтобы отталкиваясь внутренней гранью конька, толчок совершала вся стопа, а не только носок, и нога должна выпрямляться до конца в крайней точке. Старайся доставать льда рукой за счет более низкой посадки, а не чрезмерного наклона корпуса.',
      'en':
          'Start moving in a small circle by sitting lower than usual in a hockey position, but try to still keep your back straight and keep your feet on the ice, push only with the leg farthest from the inner radius of the circle, making the movements characteristic of the “flashlight” exercise. The hand closest to the radius of the circle touches the ice throughout the entire exercise. The second leg rolls statically and you get this one-sided flashlight. Pay attention to the fact that when pushing off with the inner edge of the skate, the entire foot makes the push, and not just the toe, and the leg should straighten to the end at the extreme point. Try to reach the ice with your hand by lowering your body rather than by tilting your body too much.',
    },
    '1zmk8gmp': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'tmx2px31': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'pr7mk4rr': {
      'ru': 'Переступания',
      'en': 'Steps',
    },
    'jgt9fjqr': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Steps_SecondLegPlusBack
  {
    'gsavfni9': {
      'ru': 'Толчки дальней ногой\nРука на льду спиной',
      'en': 'Far leg pushes\nHand on ice with back',
    },
    '3emri0l5': {
      'ru': '75',
      'en': '75',
    },
    '4xocyr5e': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    '5rxunt3o': {
      'ru': '70',
      'en': '70',
    },
    'd3iw21cg': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'v1uqu1nt': {
      'ru': '70',
      'en': '70',
    },
    '94xjgfbi': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    '0j03yii0': {
      'ru':
          'Начни движение по малому кругу сев ниже чем обычно в хоккейной посадке спиной, но старайся все равно держать корпус прямо и не отрывать ног ото льда, толкайся только дальней от внутреннего радиуса круга ногой, производя ей характерные для упражнения \"фонарик\" движения. Ближняя к радиусу круга рука касается льда на протяжении всего выполнения упражнения. Вторая нога статично катится и получается такой односторонний фонарик. Обрати внимание на то, чтобы отталкиваясь внутренней гранью конька, толчок совершала вся стопа, а не только носок, и нога должна выпрямляться до конца в крайней точке. Старайся доставать льда рукой за счет более низкой посадки, а не чрезмерного наклона корпуса.',
      'en':
          'Start moving in a small circle by sitting lower than usual in a hockey position with your back, but try to still keep your body straight and not take your feet off the ice, push only with the leg farthest from the inner radius of the circle, making the movements characteristic of the “flashlight” exercise. The hand closest to the radius of the circle touches the ice throughout the entire exercise. The second leg rolls statically and you get this one-sided flashlight. Pay attention to the fact that when pushing off with the inner edge of the skate, the entire foot makes the push, and not just the toe, and the leg should straighten to the end at the extreme point. Try to reach the ice with your hand by lowering your body rather than by tilting your body too much.',
    },
    'pm8ljzu8': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '0twd0qhs': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'oqnqbw88': {
      'ru': 'Переступания',
      'en': 'Steps',
    },
    'qukq9b3x': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting
  {
    'g4pcv0oq': {
      'ru': 'Новичок',
      'en': 'Beginner',
    },
    '3s9fcwl3': {
      'ru': 'Любитель',
      'en': 'Amateur',
    },
    'kjfh5s61': {
      'ru': 'Профи',
      'en': 'Pro',
    },
    '38dnil99': {
      'ru': 'Бросок с удобной',
      'en': 'Shoot forehand',
    },
    '1cero6yn': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    '3wjeo1th': {
      'ru': '4.4',
      'en': '4.4',
    },
    '7j78pv98': {
      'ru': 'Бросок с неудобной',
      'en': 'Shoot backhand',
    },
    'wnkwqf6c': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    '6fryrllu': {
      'ru': '4.2',
      'en': '4.2',
    },
    'mrxq6vh5': {
      'ru': 'Щелчок',
      'en': 'Click',
    },
    '8i053sju': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'op7joe2o': {
      'ru': '4.3',
      'en': '4.3',
    },
    'qr1von2u': {
      'ru': 'Бросок кистями',
      'en': 'Handshoot',
    },
    '5f8k9c4w': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    'oykosu18': {
      'ru': '4.7',
      'en': '4.7',
    },
    '3pdiv6td': {
      'ru': 'Бросок в статике',
      'en': 'Static shoot',
    },
    '8z32zwz0': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    '3eewkpns': {
      'ru': '4.7',
      'en': '4.7',
    },
    '8w8sojje': {
      'ru': 'Новичок',
      'en': 'Beginner',
    },
    '7zu05bs4': {
      'ru': 'Любитель',
      'en': 'Amateur',
    },
    '0vytiqpb': {
      'ru': 'Профи',
      'en': 'Pro',
    },
    'y10lomwu': {
      'ru': 'Бросок в касание',
      'en': 'One Timer',
    },
    'isk4wcsv': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    'ld4ppcmz': {
      'ru': '4.7',
      'en': '4.7',
    },
    'qy65on4f': {
      'ru': 'Резкий бросок',
      'en': 'Rapid shoot',
    },
    'nklufrtp': {
      'ru': '+10 очков',
      'en': '+10 points',
    },
    'ebko1931': {
      'ru': '4.7',
      'en': '4.7',
    },
    'hf0pciew': {
      'ru': 'Бросок после убора',
      'en': 'After underself',
    },
    'zagnulqo': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    'bkf0abgp': {
      'ru': '4.8',
      'en': '4.8',
    },
    '51x0zaio': {
      'ru': 'Бросок c 2 пасов',
      'en': 'After 2 passes',
    },
    '5v8ezavs': {
      'ru': '+10 очков',
      'en': '+10 points',
    },
    'jp2h43l9': {
      'ru': '4.8',
      'en': '4.8',
    },
    'fdqnhlii': {
      'ru': 'Бросок с ноги (ст.)',
      'en': 'From 1 leg (st.)',
    },
    'fu8v52cn': {
      'ru': '+10 очков',
      'en': '+10 points',
    },
    '7m3qt7fx': {
      'ru': '4.7',
      'en': '4.7',
    },
    'pkvxf3ay': {
      'ru': 'Короткий щелчок',
      'en': 'Short click',
    },
    'ncaai2tp': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    'm276jrcc': {
      'ru': '4.8',
      'en': '4.8',
    },
    '27jrlg9s': {
      'ru': 'QuickShot с паса',
      'en': 'Pass - QuickShot',
    },
    'u0r415yx': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'k508rz93': {
      'ru': '4.9',
      'en': '4.9',
    },
    'vjjt7pjx': {
      'ru': 'Бросок двух шайб',
      'en': 'Two puck shoot',
    },
    'rezjk5r8': {
      'ru': '+10 очков',
      'en': '+10 points',
    },
    'l9i9bdb6': {
      'ru': '4.4',
      'en': '4.4',
    },
    '2cn9t7jx': {
      'ru': 'Бросок из убора (л)',
      'en': 'After lie underself',
    },
    'sa58x8l3': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    '22epyn69': {
      'ru': '4.4',
      'en': '4.4',
    },
    'lr9bh1ub': {
      'ru': 'Новичок',
      'en': 'Beginner',
    },
    'yizmttk0': {
      'ru': 'Любитель',
      'en': 'Amateur',
    },
    '519dr2ir': {
      'ru': 'Профи',
      'en': 'Pro',
    },
    '7xk24sy2': {
      'ru': 'Бросок сидя',
      'en': 'Sitting shot',
    },
    'swodsgxv': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    '3fw269fa': {
      'ru': '5.0',
      'en': '5.0',
    },
    '5srgyu9e': {
      'ru': 'Бросок в прыжке +',
      'en': 'Shoot in jump',
    },
    'hocmdnvq': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    '5eo25trh': {
      'ru': '5.0',
      'en': '5.0',
    },
    'hevntutz': {
      'ru': 'Бросок с 1 ноги (с)',
      'en': 'From one leg (sit)',
    },
    'o6lm61m3': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    'j6z6yyu5': {
      'ru': '4.9',
      'en': '4.9',
    },
    '3tcpn8dx': {
      'ru': 'Бросок после шага',
      'en': 'After step',
    },
    'iwsoegys': {
      'ru': '+10 очков',
      'en': '+10 points',
    },
    'mxv8sgh1': {
      'ru': '4.8',
      'en': '4.8',
    },
    '8dt8oh47': {
      'ru': 'QuickShot (Пр.)',
      'en': 'Jump - QuickShot',
    },
    '105jlm55': {
      'ru': '+25 очков',
      'en': '+25 points',
    },
    'tdvn2m0e': {
      'ru': '5.0',
      'en': '5.0',
    },
    '4ofl1c99': {
      'ru': 'QuickShot (Кач.)',
      'en': 'QuickShot + fake',
    },
    'pwvxds94': {
      'ru': '+10 очков',
      'en': '+10 points',
    },
    '3knq04nc': {
      'ru': '4.9',
      'en': '4.9',
    },
    't2itphhv': {
      'ru': 'Бросок с 1 ноги (б)',
      'en': 'From one leg (s)',
    },
    '4brnfkf7': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'ywws22c6': {
      'ru': '5.0',
      'en': '5.0',
    },
    '9arsazx0': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'ugg80uxp': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_Forehand
  {
    'lmk3u625': {
      'ru': 'Бросок с удобной',
      'en': 'Forehand shoot',
    },
    'u4v8ljel': {
      'ru': '30',
      'en': '30',
    },
    'h1pp0n46': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'ey2mjv2e': {
      'ru': '70',
      'en': '70',
    },
    'gv1v9uof': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'mzixmlmg': {
      'ru': '25',
      'en': '25',
    },
    'z4q02l89': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'g4vwe0qw': {
      'ru':
          'Встань в хоккейную стойку держа шайбу на удобной стороне крюка. Перенеси вес тела на дальнюю от ворот ногу, немного отведя клюшку в соответствующую сторону, после чего одновременно вытолкни клюшку, корпус и ногу в направлении броска, совершая бросок шайбы за счет всего тела, и в конце добавь силы и точности броску за счет вращательного движения кистями. Провожай шайбу после броска, направляя клюшку в сторону цели. ',
      'en':
          'Get into a hockey stance with the puck on the comfortable side of your puck. Shift your body weight to the leg farthest from the goal, moving the stick slightly to the appropriate side, then simultaneously push the stick, body and leg in the direction of the shot, throwing the puck using the whole body, and finally add strength and accuracy to the shot through a rotational movement of the hands . Follow the puck after the shot, pointing the stick towards the target.',
    },
    'g1qwvbf1': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '6r189c7a': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'r8c7xpfs': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'u0lf5zdc': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_Backhand
  {
    'tjbnllxe': {
      'ru': 'Бросок с неудобной',
      'en': 'Backhand shoot',
    },
    'pknaloch': {
      'ru': '30',
      'en': '30',
    },
    'ws1995mh': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    '4eqy6do9': {
      'ru': '70',
      'en': '70',
    },
    'grgit28k': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'eyhdkdtq': {
      'ru': '45',
      'en': '45',
    },
    'zzu0py5f': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'oy01y9s4': {
      'ru':
          'Встань в хоккейную стойку держа шайбу на неудобной стороне крюка. Перенеси вес тела на дальнюю от ворот ногу, немного отведя клюшку в соответствующую сторону, после чего одновременно вытолкни клюшку, корпус и ногу в направлении броска, совершая бросок шайбы за счет всего тела, и в конце добавляя силы и точности броску за счет вращательного движения кистями. Провожай шайбу после броска, направляя клюшку в сторону цели. ',
      'en':
          'Get into a hockey stance with the puck on the awkward side of your blade. Shift your body weight to the leg farthest from the goal, moving the stick slightly to the appropriate side, then simultaneously push the stick, body and leg in the direction of the shot, throwing the puck using the whole body, and finally adding force and accuracy to the shot through the rotational movement of the hands . Follow the puck after the shot, pointing the stick towards the target.',
    },
    'zdynt39u': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'b9pbwhw1': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    't195u136': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    '4ncryyzd': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_Shelchok
  {
    'i896w404': {
      'ru': 'Щелчок',
      'en': 'Click',
    },
    'zgq7aysb': {
      'ru': '50',
      'en': '50',
    },
    'np8be5pg': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'ivj5dh5i': {
      'ru': '75',
      'en': '75',
    },
    'r4ozke3s': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'lhaw978c': {
      'ru': '60',
      'en': '60',
    },
    'bxk084fu': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'yp7nfrvv': {
      'ru':
          'Встань боком к воротам, контролируя шайбу с удобной стороны. Соверши замах клюшкой, доведя ее до линии плеча и резким движением обратно ударь по шайбе всеми силами рук, корпуса и толчковой ноги, перенося вес тела на ближнюю к воротам ногу.',
      'en':
          'Stand with your side to the goal, controlling the puck from your comfortable side. Swing the stick, bringing it to the shoulder line and with a sharp movement back, hit the puck with all the strength of your arms, body and pushing leg, transferring your body weight to the leg closest to the goal.',
    },
    'sqcj5pvk': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'mh9ethed': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'yr1vaxb4': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    '3dosm72g': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_RapidShoot
  {
    'vfmqdv0g': {
      'ru': 'Быстрый бросок кистями',
      'en': 'RapidShot',
    },
    '6qebja6z': {
      'ru': '75',
      'en': '75',
    },
    '0jog3ne6': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    's7sa5dav': {
      'ru': '90',
      'en': '90',
    },
    'fradlmlx': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'b7lb6h5o': {
      'ru': '70',
      'en': '70',
    },
    'm89428se': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    '7v405hcg': {
      'ru':
          'Встань напротив ворот, и совершай бросок исключительно за счет резкого движения кистей и рук. Этот бросок часто встречается в игровых ситуациях, когда возможность для хорошего прицельного броска ограничена скоростью приближающегося соперника и расположением рук и ног по отношению к воротам.',
      'en':
          'Stand in front of the goal, and make a throw solely through the sharp movement of your hands and arms. This shot is often found in game situations where the opportunity for a good aimed shot is limited by the speed of the approaching opponent and the positioning of the arms and legs in relation to the goal.',
    },
    't4i8t8ow': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'wvpczte6': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'cnox9qh9': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    '7itx9i47': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_Statick
  {
    'x3w4ftbn': {
      'ru': 'Бросок кистями в статике',
      'en': 'Static handshoot',
    },
    '42tt77e7': {
      'ru': '75',
      'en': '75',
    },
    'ogcnxdgv': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    '0fzxc99i': {
      'ru': '75',
      'en': '75',
    },
    'o4j2wyfd': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'uepkfwrx': {
      'ru': '75',
      'en': '75',
    },
    'jc2csg5d': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'dskisjhe': {
      'ru':
          'Встань в хоккейную посадку, лицом к воротам, контролируя шайбу на удобной стороне. Совершай броски только за счет кистей, таким образом, чтобы корпус и ноги не поворачивались, находясь в статическом положении.',
      'en':
          'Get into a hockey position, facing the goal, controlling the puck on your good side. Make throws only using your hands, so that your body and legs do not turn while in a static position.',
    },
    'fbujbdhj': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '18cxog23': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'ircjb0vg': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'nwvgnbw6': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_OneTimer
  {
    '89vzvo09': {
      'ru': 'Бросок в касание',
      'en': 'One timer',
    },
    'jdrpr8yb': {
      'ru': '55',
      'en': '55',
    },
    'gshvvqmk': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    '7p7qm1hg': {
      'ru': '70',
      'en': '70',
    },
    'c4iodt9a': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'atw8uddt': {
      'ru': '35',
      'en': '35',
    },
    '7maygb6a': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'ddih6xcq': {
      'ru':
          'Установи шайбу напротив ворот, и сделай пять - семь шагов назад. После чего подъедь к шайбе и соверши бросок в одно касание таким образом, чтобы момент соприкосновения клюшки и шайбы был минимальным. Используй разные виды замаха - из-за плеча, полузамах, короткий замах со льда, для развития резкого броска в одно касание.',
      'en':
          'Place the puck in front of the goal and take five to seven steps back. Then drive up to the puck and make a one-touch shot so that the moment of contact between the stick and the puck is minimal. Use different types of swing - over the shoulder, half-swing, short swing from the ice, to develop a sharp throw in one touch.',
    },
    'nn5h59qv': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '9myy2heq': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'i71h9j7e': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'l6k8pd6e': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_QuickShotAfterPerebor
  {
    '2sjg3tru': {
      'ru': 'Резкий бросок после перебора',
      'en': 'QuickShot after busting',
    },
    'wjvw80xl': {
      'ru': '80',
      'en': '80',
    },
    '673v4fgc': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    '6f1yrgp3': {
      'ru': '80',
      'en': '80',
    },
    'dkkua31t': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'hy9zd0hi': {
      'ru': '85',
      'en': '85',
    },
    '270roy13': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'tymv9gyk': {
      'ru':
          'Начинай выполнение упражнения с амплитудного перебора на неудобную сторону, затем быстрым движением верни клюшку на удобную сторону и произведи резкий бросок, минимизировав время затраченное между возвратом на удобную и самим броском. Обрати внимание на перенос веса тела в сторону убора клюшки (для большей правдоподобности в игре), и силу броска (если бросок будет не только резким но и сильным, то это значительно увеличит шанс взятия ворот).',
      'en':
          'Start the exercise with an amplitude stroke to the uncomfortable side, then quickly return the club to the comfortable side and make a sharp throw, minimizing the time spent between returning to the comfortable side and the throw itself. Pay attention to the transfer of body weight towards the stick (for greater plausibility in the game), and the force of the throw (if the throw is not only sharp but also strong, this will significantly increase the chance of scoring a goal).',
    },
    'x7ka2qgq': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '6vpp62wa': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'qz8yco27': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'g7p3ti7u': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_AfterTwoPasses
  {
    'oes8z0po': {
      'ru': 'Бросок после двух передач',
      'en': 'Shoot after two passes',
    },
    'iyitfgfb': {
      'ru': '65',
      'en': '65',
    },
    'g2jt0ks3': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    '9d4mr4ic': {
      'ru': '75',
      'en': '75',
    },
    '0t1zx2d4': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'urirastd': {
      'ru': '70',
      'en': '70',
    },
    'ol2dlg0x': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'o6z5wu2k': {
      'ru':
          'Сыграй в \"стеночку\" с партнером слева, после этого также с партнером справа, и после второго приема соверши резкий и хлесткий бросок. Чередуй очередность передач, бросая после передачи то слева, то справа.',
      'en':
          'Play \"wall\" with the partner on the left, then also with the partner on the right, and after the second technique, make a sharp and biting throw. Alternate the order of passes, throwing after the pass either from the left or from the right.',
    },
    '72kptzob': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'ca5l4o0t': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    't9l9yboe': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'wle7099q': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_QuickShotAfterPass
  {
    '9lys71se': {
      'ru': 'Быстрый бросок после передачи',
      'en': 'QuickShot after a pass',
    },
    '2m9ccxhq': {
      'ru': '85',
      'en': '85',
    },
    'u7pwre05': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    '6yxy51by': {
      'ru': '85',
      'en': '85',
    },
    'f1kqw5az': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'hwx4wo6w': {
      'ru': '85',
      'en': '85',
    },
    'sqo50juo': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'hyfjg3ow': {
      'ru':
          'Принимай передачу от партнера на удобную сторону клюшки, крюк которой направлен на ворота, и совершай быстрый бросок кистями сразу же после приема шайбы. Старайся выполнять эти два действия (прием и бросок) настолько быстро и сильно насколько это возможно. На первых порах рекомендуется обратить внимание на технику приема и силу броска. Со временем ускоряя выполнение этих элементов.',
      'en':
          'Receive the pass from your partner on the comfortable side of the stick, the blade of which is aimed at the goal, and make a quick throw with your wrists immediately after receiving the puck. Try to perform these two actions (reception and throw) as quickly and strongly as possible. At first, it is recommended to pay attention to the technique of the technique and the force of the throw. Accelerating the completion of these elements over time.',
    },
    'h9mhb0vj': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'b65gaae6': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'v9dnhhih': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'oo1wiyrg': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_ShootFromMyself
  {
    '8wxgsgey': {
      'ru': 'Бросок после убора под себя',
      'en': 'Shoot after underself',
    },
    'roe73fus': {
      'ru': '65',
      'en': '65',
    },
    'trzxuwom': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'o68rvl9c': {
      'ru': '80',
      'en': '80',
    },
    'agn6gq8o': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'z32mbken': {
      'ru': '70',
      'en': '70',
    },
    'xuhu0xca': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    '2fpzf0ib': {
      'ru':
          'Установи на своем пути к воротам препятствие. Заведи шайбу за препятствие, и совершай бросок в момент убора шайбы под себя из под препятствия. Это особенно полезно при выходах 1 на 1 с защитником. Когда только он отделяет тебя от очной встречи с вратарем.',
      'en':
          'Place an obstacle on your way to the gate. Bring the puck behind the obstacle and throw it as you move the puck under yourself from under the obstacle. This is especially useful in 1v1 situations with a defender. When only he separates you from a face-to-face meeting with the goalkeeper.',
    },
    '386kk4r9': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'flgmw4zs': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'd15dfpnr': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'e2ze3hgq': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_FromOneLegStatick
  {
    'st3rnmj2': {
      'ru': 'Бросок с одной ноги в статике',
      'en': 'Static shoot with one leg',
    },
    'kvwqzlna': {
      'ru': '70',
      'en': '70',
    },
    'pmanr7ij': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'oflr8yxt': {
      'ru': '80',
      'en': '80',
    },
    'kedqxwgj': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'iyzmgqfa': {
      'ru': '80',
      'en': '80',
    },
    'nk3p0kq1': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'tyayxl8e': {
      'ru':
          'Встань на одну ногу напротив ворот, вторую держи на весу. Бросай только за счет движения рук и в особенности кистей. Старайся зафиксировать ногу и корпус в статическом состоянии для развития качества броска из ограниченного положения.',
      'en':
          'Stand on one leg in front of the gate, keep the other in weight. Throw only through the movement of your arms and especially your hands. Try to fix your leg and body in a static state to develop the quality of your throw from a limited position.',
    },
    'a6fi9t5f': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'wdfng0xp': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'axps1eds': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'ceoq8c8d': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_shortSchelchok
  {
    'uu18e180': {
      'ru': 'Бросок с короткого замаха',
      'en': 'Short click',
    },
    'xpvvrp8f': {
      'ru': '65',
      'en': '65',
    },
    'jpnqzouf': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'z06gfth9': {
      'ru': '75',
      'en': '75',
    },
    'x1f9bys3': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'ixsfarb5': {
      'ru': '70',
      'en': '70',
    },
    'obaw2m2v': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'pcpcjukc': {
      'ru':
          'Встань боком к воротам. Расположи шайбу примерно посередине между ног, как при щелчке. Отведи клюшку в сторону для разгона, но не поднимай надо льдом, и с такого замаха произведи удар по шайбе в сторону ворот, добавляя в конце движение кистями, заворачивая шайбу туда, куда хочешь чтобы она полетела. ',
      'en':
          'Stand sideways to the gate. Place the puck approximately halfway between your legs, as if you were snapping. Move the stick to the side to accelerate, but do not lift it above the ice, and with such a swing, hit the puck towards the goal, adding a movement with your wrists at the end, turning the puck where you want it to fly.',
    },
    'bvzu7csc': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'xhhtng4p': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'f6ol2i71': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'f6yc2sfl': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_FromMyselfAfterSecondPuck
  {
    '4cu10lgn': {
      'ru': 'Бросок из под второй шайбы',
      'en': 'Shoot from underself after second puck',
    },
    'vygx1g10': {
      'ru': '70',
      'en': '70',
    },
    'o2hsv2e1': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    '560fwet9': {
      'ru': '75',
      'en': '75',
    },
    '1mhn5xwy': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'g3gcnq82': {
      'ru': '70',
      'en': '70',
    },
    'b5a0wayt': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'le86gopt': {
      'ru':
          'Для упражнения бери по две шайбы, и совершай бросок, обыгрывая одну шайбу другой круговым движением, выполняя бросок в точке окончания круга. ',
      'en':
          'For the exercise, take two pucks at a time and shoot, beating one puck with the other in a circular motion, throwing at the end point of the circle.',
    },
    'cm8bglk2': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'sxq20dmp': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'c0di6d1x': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'pj7i9z5q': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_SitOnPlatform
  {
    'hwb7evb1': {
      'ru': 'Бросок сидя на платформе',
      'en': 'Shoot sitting on a platform',
    },
    'ac3pjs8l': {
      'ru': '75',
      'en': '75',
    },
    '52oav1dh': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'oiogajoe': {
      'ru': '80',
      'en': '80',
    },
    '0pjk03zr': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'nxfdybku': {
      'ru': '85',
      'en': '85',
    },
    '07ckffdh': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'gmnf984e': {
      'ru':
          'Для этого упражнения требуется вспомогательная платформа, по примеру скамейки. Совершай броски сидя на платформе, стараясь не двигать ногами. Таким образом ты прокачаешь способность бросать в любых ситуациях.',
      'en':
          'This exercise requires an auxiliary platform, similar to a bench. Make throws while sitting on the platform, trying not to move your legs. This way you will improve your throwing ability in any situation.',
    },
    'j8pm4er1': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'mzd7r9u0': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'za5v6dh4': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'gdqo2sad': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_OneLegOnPlatformBack
  {
    '23xz965r': {
      'ru': 'Бросок с одной ноги, вторая - сзади на платформе',
      'en': 'Shoot from one leg, the second - from behind on the platform',
    },
    'mvlgm69u': {
      'ru': '70',
      'en': '70',
    },
    '9xcga98q': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'nxzxmtt6': {
      'ru': '75',
      'en': '75',
    },
    'nxyg4lg7': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'h0gbronh': {
      'ru': '70',
      'en': '70',
    },
    '3hbkzuek': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'cf23u9lh': {
      'ru':
          'Для этого упражнения требуется вспомогательная платформа, по примеру скамейки. Установи согнутую в колене ногу на платформу, закрепившись в статическом положении второй ногой. Совершай броски из этого положения, стараясь не совершать разворотов туловища, и нарушения баланса.',
      'en':
          'This exercise requires a support platform, similar to a bench. Place your leg bent at the knee on the platform, securing yourself in a static position with your other leg. Make throws from this position, trying not to turn your torso and upset your balance.',
    },
    '3tvp9kha': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '4v7i8xal': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '1sj3bfyd': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    '7gcse5i4': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_QuickShotAfterJumpOnLeg
  {
    'hxb5wc56': {
      'ru': 'Быстрый бросок после прыжка на ногу',
      'en': 'QuickShot after jumping on your leg',
    },
    'yp1o87vn': {
      'ru': '80',
      'en': '80',
    },
    'zpnxqwz4': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'ciqx0q10': {
      'ru': '85',
      'en': '85',
    },
    'iwdv4juj': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'txsdzlk6': {
      'ru': '75',
      'en': '75',
    },
    'ntaacz22': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'vju0yjun': {
      'ru':
          'Выполняй это упражнение в движении. Проехав с шайбой несколько шагов после входа в зону выполни быстрый резкий бросок кистями в момент прыжка на удобную ногу. Созданный импульс позволит сделать очень сильный и акцентированный бросок по воротам соперника.',
      'en':
          'Do this exercise while moving. Having walked a few steps with the puck after entering the zone, perform a quick sharp throw with your wrists at the moment of jumping on your comfortable foot. The created impulse will allow you to make a very strong and accentuated shot at the opponent’s goal.',
    },
    '5nl615vz': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'dslr6k8y': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'pyv8qg1k': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    '9jtqc208': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_ShotFromKneeAfterPerestupaniye
  {
    '66qp11cz': {
      'ru': 'Бросок с колена после переступания',
      'en': 'Shoot from the knee after stepping over',
    },
    'nl2qwdqr': {
      'ru': '85',
      'en': '85',
    },
    '78soyojs': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'tcpgws0y': {
      'ru': '75',
      'en': '75',
    },
    'uteekvx7': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    '3r0c4gi1': {
      'ru': '80',
      'en': '80',
    },
    'tr78hvp1': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    '1ekeqotx': {
      'ru':
          'Встань боком к воротам, контролируя шайбу на удобной стороне клюшки. Соверши переступание дальней ногой, после чего выставь вперед изначально ближнюю ногу, и соверши бросок с колена.',
      'en':
          'Stand with your side to the goal, controlling the puck on the comfortable side of your stick. Step over with your far foot, then put your initially near foot forward and throw from your knee.',
    },
    '8hqud2z7': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'ucuu0m4e': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'ocu0a4wd': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'pqigzzys': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_InStaticJumpFromLegToLeg
  {
    'epzley8n': {
      'ru': 'Бросок в статическом прыжке на ногу',
      'en': 'Shoot in a static jump on the leg',
    },
    '4i8xz1cl': {
      'ru': '75',
      'en': '75',
    },
    'j35vvp47': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'bn2kkkej': {
      'ru': '75',
      'en': '75',
    },
    'sem1waek': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    '9xn3400u': {
      'ru': '80',
      'en': '80',
    },
    '60dra0og': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'b557hf2g': {
      'ru':
          'Встань на одну ногу напротив ворот, контролируя шайбу. Соверши перепрыжку с одной ноги на другую, и в момент приземления произведи мощный бросок кистями. Нога и корпус в данном случае образуют пружину, которая должна разжиматься вместе с выполнением броска придавая ему дополнительный мощный импульс. Чередуй бросок в момент прыжка на разные ноги.',
      'en':
          'Stand on one foot in front of the goal, controlling the puck. Jump from one foot to the other, and at the moment of landing, make a powerful throw with your hands. The leg and body in this case form a spring, which should expand along with the throw, giving it an additional powerful impulse. Alternate the throw at the moment of jumping on different legs.',
    },
    'flteac3x': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'forz8ov6': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'svvqlfsc': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'hhiy84y2': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Shooting_QuickShotAfterLieBackhandForehand
  {
    'pjh1j8ex': {
      'ru': 'Быстрый бросок после ложного раскачивания',
      'en': 'QuickShot after a false swing',
    },
    '10ixmt3x': {
      'ru': '65',
      'en': '65',
    },
    'do3rjt3e': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'vmadu1k6': {
      'ru': '75',
      'en': '75',
    },
    'p5zh6hhu': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'iuqlfggl': {
      'ru': '70',
      'en': '70',
    },
    '32zszo7x': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'uijv1bu5': {
      'ru':
          'Выполни быстрый и резкий бросок кистями после ложного раскачивания (не забывай про перенос веса тела). В игровой ситуации это эффективный элемент, позволяющий отвлечь внимание защитника на противодействие вашему обыгрышу, когда на самом деле это ловушка, итогом которой становится опасный бросок по воротам.',
      'en':
          'Perform a quick and sharp throw with your wrists after a false swing (don’t forget about transferring your body weight). In a game situation, this is an effective element that allows you to divert the defender\'s attention to countering your play, when in fact it is a trap, the result of which is a dangerous shot on goal.',
    },
    '6lgk5mzg': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'ec2pcxjw': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'aios1716': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'r57s03mb': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Earth_Lovkost
  {
    'bxgfz3ma': {
      'ru': 'Скакалка ',
      'en': 'Jump rope',
    },
    '2y6dl7ta': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'vigynpd1': {
      'ru': 'Кувырки ',
      'en': 'Somersaults',
    },
    's3f6td44': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'ds5mwbgl': {
      'ru': 'Боковые прыжки',
      'en': 'Side jumps',
    },
    'bdlrky4b': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'ibxxazqh': {
      'ru': 'Лесенка ',
      'en': 'Ladder',
    },
    'll8j8ibr': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'eyctj0t3': {
      'ru': 'Тенисный мячик',
      'en': 'Tennis ball',
    },
    '3ir1xtyn': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'poemz10l': {
      'ru': 'Разножка ',
      'en': 'Spreader',
    },
    'azr2tcos': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'slzaqyao': {
      'ru': 'Узкое пространство',
      'en': 'Narrow space',
    },
    'wordqoqp': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'fglm6e7a': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'ozett8qs': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Earth_Moshnost
  {
    'ke6pedlg': {
      'ru': 'Выпрыгивания ',
      'en': 'Jumping',
    },
    'hd8e1dxh': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'g3hhfios': {
      'ru': 'Прыжки на ноге',
      'en': 'Jumping on the leg',
    },
    'mi6tlm59': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'n5o54exm': {
      'ru': 'Плиометрика ',
      'en': 'Plyometrics',
    },
    'ibpna90z': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    '0kqdlkc9': {
      'ru': 'Медицинбол ',
      'en': 'Medicine ball',
    },
    'sj9fufwg': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'wtgwoxwu': {
      'ru': 'Жим от груди',
      'en': 'Chest press',
    },
    'qceyd4hb': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'eqwgjf9o': {
      'ru': 'Жгуты ',
      'en': 'Harnesses',
    },
    'bzcw69qs': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'lvh5q1y4': {
      'ru': 'Отжимания (пр.)',
      'en': 'Push-ups (jm.)',
    },
    'umup4s8d': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'hhtyuh3s': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    'roe9jq58': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Earth_Vynoslivost
  {
    'm8i1dwq5': {
      'ru': 'Круги ',
      'en': 'Circles',
    },
    '4yf7qbpa': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    't89zm30r': {
      'ru': 'Велосипед ',
      'en': 'Byke',
    },
    'h51jhcso': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'fqf9lkqv': {
      'ru': 'Скакалка +',
      'en': 'Jump rope +',
    },
    'itggnhwb': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    '0jt8rrr3': {
      'ru': 'Табата',
      'en': 'Tabata',
    },
    'eq0yyzdn': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'at15vmmu': {
      'ru': 'Плавание ',
      'en': 'Swimming',
    },
    'wbjf76mf': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'os54zyop': {
      'ru': 'Мини-футбол',
      'en': 'Mini football',
    },
    'kis1wh5q': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    '0ho9ni7r': {
      'ru': 'Выдержка',
      'en': 'Endurance',
    },
    '0ynv5j0c': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Earth_Balance
  {
    'h1hd6khq': {
      'ru': 'Мостик ',
      'en': 'Bridge',
    },
    'l5vp4xp9': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'xpphhwnw': {
      'ru': 'Ласточка ',
      'en': 'Bird',
    },
    'bbyjzkvy': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'r06cxhcb': {
      'ru': 'Приседания (1 н.)',
      'en': 'One leg sit',
    },
    'jge6sucu': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'aiafz3fd': {
      'ru': 'Прыжки (лестница)',
      'en': 'Jumping (stairs)',
    },
    '5vruvad0': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'vt9axw4h': {
      'ru': 'Присед (подушка)',
      'en': 'Sit (platform)',
    },
    '4q8zpxle': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'ezautj1f': {
      'ru': 'Скручивания ',
      'en': 'Crunch',
    },
    'odniccwz': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'ccohrpeq': {
      'ru': 'Супермен ',
      'en': 'Superman',
    },
    'i3t97r57': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'tr3lwi4z': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'bv9hqkc4': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Earth_Force
  {
    '2y6whsge': {
      'ru': 'Приседания ',
      'en': 'Sit',
    },
    '5rkj2dm8': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'jkyzgqfg': {
      'ru': 'Планка ',
      'en': 'Plank',
    },
    'y0qpbwuk': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'fjinia75': {
      'ru': 'Подтягивания ',
      'en': 'Pull-ups',
    },
    '01l9asav': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    '9xjvjuuv': {
      'ru': 'Отжимания - паук',
      'en': 'Push-ups - spider',
    },
    '3xi814jh': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    '62ii32kb': {
      'ru': 'Отжимания (брус.)',
      'en': 'Push-ups (bars)',
    },
    'ze7s9g1o': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'ekxkcd8m': {
      'ru': 'Жим на бицепс',
      'en': 'Biceps press',
    },
    'hw6xq4ia': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'lbixwgkq': {
      'ru': 'Тяга в наклоне',
      'en': 'Bent-over row',
    },
    'awb102h2': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'wd229yo3': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'xp6x2e5d': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Earth_Speed
  {
    'p35pbgb9': {
      'ru': 'Спринт ',
      'en': 'Sprint',
    },
    '2cjvrmx0': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    '4yfmmrrj': {
      'ru': 'Змейка ',
      'en': 'Snake',
    },
    'on18hcrw': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    '594v1607': {
      'ru': 'Лягушка ',
      'en': 'Frogg',
    },
    'jn49xita': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'w9x3yysc': {
      'ru': 'Запрыгивание ',
      'en': 'Jumping (plt.)',
    },
    'hrzymyrr': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'roxhlvpu': {
      'ru': 'Прыжки в приседе',
      'en': 'Squat Jumps',
    },
    '2qrv5es3': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'nr0f1vnx': {
      'ru': 'Бег боком',
      'en': 'Side run',
    },
    '3ef5blne': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    'za57od5w': {
      'ru': 'Бег на месте',
      'en': 'Static run',
    },
    'aw7lq44w': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    '3qfiq6cj': {
      'ru': 'Бег по лестнице',
      'en': 'Running (stairs)',
    },
    'wzwhpee5': {
      'ru': '+5 очков',
      'en': '+5 points',
    },
    '06w48za1': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'lfiszzr2': {
      'ru': 'Home',
      'en': '',
    },
  },
  // AfterGamePsychlogy
  {
    '5ltw67nu': {
      'ru': 'Психология',
      'en': 'Psychology',
    },
    'jgllfupk': {
      'ru': 'Перед игрой',
      'en': 'Pre-game',
    },
    'f3jewrfc': {
      'ru': 'После игры',
      'en': 'After game',
    },
    'osrm5ehm': {
      'ru': 'День отдыха',
      'en': 'Free day',
    },
    '6av1kkbf': {
      'ru': 'До тренировки',
      'en': 'Pre-training',
    },
    'ij3ykeh7': {
      'ru': 'После тренировки',
      'en': 'After training',
    },
    'dg7rzgvg': {
      'ru': 'В отпуске',
      'en': 'On vacation',
    },
    'd64ez5uh': {
      'ru':
          'Психологическая подготовка и перестройка после игры играют важную роль в достижении высокой эффективности и успешных результатов в хоккее. Вот несколько советов, как хоккеисту можно перестроиться после игры и готовиться к следующей:\n\n1.  Отдохни и восстановись:  После игры важно дать своему телу время для восстановления. Отдохни, уделяя внимание физической релаксации, питанию и сну. Это поможет тебе восстановить энергию и готовность к следующей тренировке или игре.\n\n2. Анализируй прошедшую игру:м Сразу же после игры пройди в уме через основные моменты и ситуации. Оцени свои успехи и ошибки, чтобы понять, над чем нужно работать и как улучшить свою игру. Но не фокусируйся только на отрицательных моментах – также выдели положительные моменты.\n\n3.  Позитивное мышление:  Оставь за собой прошедшую игру и её эмоции. Переключись на позитивный настрой и уверенность в своих способностях. Важно верить в себя и в свою команду.\n\n4.  Учись у прошлого:  Используй анализ прошлых игр как урок для улучшения своих навыков. Что работало хорошо? Что можно улучшить? Определи конкретные аспекты, над которыми стоит работать в тренировках.\n\n5.  Практикуй ментальные навыки:  Занимайся ментальной тренировкой, включая визуализацию успешных игровых ситуаций, концентрацию и управление стрессом. Это поможет тебе поддерживать позитивное состояние ума и готовность к будущим вызовам.\n\n6.  Определи цели:  Задай себе конкретные цели на ближайшие тренировки и игры. Это поможет тебе ориентироваться и держать фокус на достижении результата.\n\n7.  Тренировка и физическая подготовка:  После анализа прошлой игры, настройся на следующие тренировки и подготовку. Удели особое внимание упражнениям, которые помогут улучшить те аспекты игры, над которыми ты работаешь.\n\n8.  Расслабление и стрессоустойчивость:  Используй техники расслабления, дыхательные упражнения и медитацию для снятия стресса и поддержания эмоциональной устойчивости.\n\n9.  Поддержка команды:  Общение с тренерами и товарищами по команде может помочь тебе переработать эмоции после игры, получить обратную связь и поддержку.\n\n10.  Установи ритуалы:  Создай ритуалы после игры, которые помогут тебе переключиться с игрового режима на режим тренировок и подготовки к следующей игре. Это может быть что-то специфическое, что помогает тебе переключить внимание и эмоции.\n\nПомни, что психологическая подготовка так же важна, как и физическая тренировка, для достижения успеха в хоккее. Регулярная работа над своим умственным состоянием поможет тебе стать более эффективным на площадке и успешным в своей спортивной карьере.\n\n',
      'en':
          'Psychological preparation and post-game adjustment play an important role in achieving high performance and successful results in hockey. Here are some tips on how a hockey player can regroup after a game and prepare for the next one:\n\n1. Rest and Recover: After playing, it is important to give your body time to recover. Rest by focusing on physical relaxation, nutrition and sleep. This will help you regain your energy and readiness for your next practice or game.\n\n2. Analyze the past game: Immediately after the game, go through the main points and situations in your mind. Evaluate your successes and mistakes to understand what you need to work on and how to improve your game. But don\'t just focus on the negatives - highlight the positives too.\n\n3. Positive thinking: Leave the past game and its emotions behind you. Switch to a positive attitude and confidence in your abilities. It is important to believe in yourself and your team.\n\n4. Learn from the past: Use analysis of past games as a lesson to improve your skills. What worked well? What can be improved? Identify specific aspects to work on in your training.\n\n5. Practice mental skills: Engage in mental training, including visualization of successful game situations, concentration and stress management. This will help you maintain a positive state of mind and be prepared for future challenges.\n\n6. Set goals: Set yourself specific goals for the upcoming practices and games. This will help you navigate and stay focused on achieving results.\n\n7. Training and physical preparation: After analyzing the last game, get ready for the next training and preparation. Focus on drills that will help improve the aspects of your game you are working on.\n\n8. Relaxation and stress tolerance: Use relaxation techniques, breathing exercises and meditation to relieve stress and maintain emotional stability.\n\n9. Team Support: Communication with coaches and teammates can help you process emotions after a game, get feedback and support.\n\n10. Establish rituals: Create post-game rituals that will help you switch from game mode to practice mode and preparation for the next game. It could be something specific that helps you shift your attention and emotions.\n\nRemember that mental preparation is just as important as physical training for success in hockey. Regular work on your mental state will help you become more effective on the court and successful in your sports career.',
    },
    'i1t5hdwe': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '6v7xd18r': {
      'ru': 'Home',
      'en': '',
    },
  },
  // FreeDayPsychology
  {
    '9x1517l2': {
      'ru': 'Перед игрой',
      'en': 'Pre-game',
    },
    'l7zoevk8': {
      'ru': 'После игры',
      'en': 'After game',
    },
    'v9cdr4wo': {
      'ru': 'День отдыха',
      'en': 'Free day',
    },
    '574998bb': {
      'ru': 'До тренировки',
      'en': 'Pre-training',
    },
    'rrxs40o5': {
      'ru': 'После тренировки',
      'en': 'After training',
    },
    'j12dt67u': {
      'ru': 'В отпуске',
      'en': 'On vacation',
    },
    'j129y3vm': {
      'ru':
          'Психологический подход к выходному дню также играет роль в общей эффективности хоккеиста. Это время отдыха и восстановления, которое также может помочь подготовиться к будущим тренировкам и играм. Вот несколько советов, как хоккеисту можно психологически подходить к выходному, чтобы быть эффективным:\n\n1.  Разнообразь активности: Выходные - это отличное время для разнообразных занятий, помимо хоккея. Включи в свой план активности, которые помогут расслабиться и отвлечься от тренировок. Это может быть прогулка на свежем воздухе, чтение, общение с друзьями и семьей.\n\n2.  Расслабление и восстановление:  Отдыхай полноценно и заботься о своем физическом и психологическом восстановлении. Это поможет восполнить энергию и подготовиться к следующей неделе тренировок.\n\n3.  Позитивное мышление:  Оставь за собой недавние тренировки и игры, освободись от стресса и напряжения. Подходи к выходным с позитивным настроем и открытым умом.\n\n4.  Планирование и цели:  Вместе с отдыхом удели время для планирования следующей недели. Определи цели, которые ты хотели бы достичь, и разработай план действий для их реализации.\n\n5.  Социальное общение:  Общение с друзьями, семьей или товарищами по команде помогает расслабиться и получить позитивные эмоции. Социальная поддержка важна для укрепления ментального состояния.\n\n6.  Медитация и релаксация:  Используй техники медитации, релаксации и дыхательных упражнений для снятия стресса и поддержания психологического равновесия.\n\n7.  Планирование свободного времени:  Включи в выходной день время для свободных занятий, которые приносят тебе радость и удовольствие. Это может быть хобби, спортивные игры или другие увлечения.\n\n8.  Поддержка сна:  Обрати внимание на качество сна. Выходные - отличное время, чтобы выспаться и дать телу возможность восстановиться.\n\n9.  Положительная рефлексия:  Оцени свои достижения и прогресс, которые ты сделал за прошедшую неделю. Это поможет сохранить мотивацию и видеть положительные изменения.\n\n10.  Сбалансированность:  Не забывай о важности сбалансированного подхода. Выходные - это время как для активности, так и для отдыха. Поддерживай гармонию между этими аспектами.\n\nСоблюдение психологического баланса в выходные поможет тебе полностью восстановиться, подготовиться к будущим вызовам и сохранить мотивацию и эффективность в спортивной деятельности.',
      'en':
          'The psychological approach to a day off also plays a role in a hockey player\'s overall performance. This is a time of rest and recovery that can also help prepare for future practices and games. Here are some tips on how a hockey player can approach a day off mentally to be effective:\n\n1. Variety of activities: Weekends are a great time for a variety of activities other than hockey. Include activities in your plan that will help you relax and take your mind off your workouts. This could be a walk in the fresh air, reading, talking with friends and family.\n\n2. Relaxation and recovery: Take full rest and take care of your physical and psychological recovery. This will help replenish your energy and prepare you for the next week of training.\n\n3. Positive thinking: Leave the recent training and games behind you, free yourself from stress and tension. Approach the weekend with a positive attitude and an open mind.\n\n4. Planning and Goals: Along with your rest, take time to plan for the next week. Determine the goals you would like to achieve and develop an action plan to achieve them.\n\n5. Social Communication: Connecting with friends, family, or teammates helps you relax and gain positive emotions. Social support is important for improving mental health.\n\n6. Meditation and relaxation: Use meditation, relaxation and breathing techniques to relieve stress and maintain psychological balance.\n\n7. Planning free time: Include time on your day off for free activities that bring you joy and pleasure. This could be a hobby, sports or other hobbies.\n\n8. Sleep support: Pay attention to the quality of your sleep. The weekend is a great time to get enough sleep and give your body a chance to recover.\n\n9. Positive Reflection: Evaluate your achievements and the progress you have made over the past week. This will help you stay motivated and see positive changes.\n\n10. Balance: Remember the importance of a balanced approach. Weekends are a time for both activity and relaxation. Maintain harmony between these aspects.\n\nMaintaining mental balance over the weekend will help you fully recover, prepare for future challenges and maintain motivation and efficiency in sports activities.',
    },
    'sdq9y3rl': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'gs3plaac': {
      'ru': 'Психология',
      'en': 'Psychology',
    },
    'yh6f2de2': {
      'ru': 'Home',
      'en': '',
    },
  },
  // BeforeTrainingPsychology
  {
    'ryscahgv': {
      'ru': 'Перед игрой',
      'en': 'Pre-game',
    },
    'prxcarx3': {
      'ru': 'После игры',
      'en': 'After game',
    },
    '1ilhpfou': {
      'ru': 'День отдыха',
      'en': 'Free day',
    },
    'nidbp267': {
      'ru': 'До тренировки',
      'en': 'Pre-training',
    },
    'qqqubooy': {
      'ru': 'После тренировки',
      'en': 'After training',
    },
    'dwhf0yyh': {
      'ru': 'В отпуске',
      'en': 'On vacation',
    },
    'ost26gnf': {
      'ru':
          'Психологическая подготовка перед тренировкой имеет большое значение для достижения максимальной эффективности в хоккее. Вот несколько советов, как подготовиться психологически к тренировке и быть эффективным:\n\n1.  Позитивный настрой:  Заранее настройся на позитивное отношение к тренировке. Уверенность в своих способностях и ожидание положительных результатов создают благоприятное психологическое состояние.\n\n2.  Цели и задачи:  Определи конкретные цели и задачи на предстоящую тренировку. Это может быть улучшение определенных навыков, увеличение физической выносливости или работа над тактическими аспектами игры.\n\n3.  Визуализация:  Перед тренировкой проведи небольшую визуализацию, воображая себя успешно выполняющим задачи на льду. Это поможет укрепить уверенность и подготовить ум к успешному выполнению задач.\n\n4.  Дыхательные практики:  Используй методы глубокого дыхания для снятия нервного напряжения и установления концентрации. Ритмичное дыхание помогает успокоить разум и подготовиться к тренировке.\n\n5.  Ритуалы и подготовка:  Создай свои ритуалы перед тренировкой. Это может быть конкретный порядок подготовки амуниции, определенные ментальные упражнения или позитивные аффирмации.\n\n6.  Фокус на процесс:  Сосредоточься на процессе тренировки, а не только на результате. Отдай приоритет улучшению техники, навыков и тактической подготовке.\n\n7.  Управление стрессом:  Если перед тренировкой ощущается нервозность или стресс, попробуй техники управления стрессом, такие как глубокое дыхание, прогулка на свежем воздухе или позитивные визуализации.\n\n8.  Сосредоточенность:  Забудь о внешних моментах и целиком сосредоточься на текущем моменте. Сосредоточенность помогает улучшить качество тренировки и поднять уровень эффективности.\n\n9.  Мотивация:  Напоминай себе о своих мотивах и страстях в хоккее. Воспламени в себе внутренний огонь, который будет поддерживать твою решимость и энтузиазм.\n\n10.  Позитивная саморечь:  Избегай негативных самоутверждений и самокритики перед тренировкой. Заменяй их позитивными утверждениями и верой в свои способности.\n\nПсихологическая подготовка перед тренировкой помогает не только повысить эффективность, но и создает оптимальные условия для достижения твоих спортивных целей.',
      'en':
          'Mental preparation before training is essential to achieving maximum performance in hockey. Here are some tips on how to prepare mentally for training and be effective:\n\n1. Positive Attitude: Establish a positive attitude towards your workout in advance. Confidence in one\'s abilities and the expectation of positive results create a favorable psychological state.\n\n2. Goals and objectives: Determine specific goals and objectives for the upcoming training. This could be improving certain skills, increasing physical endurance, or working on the tactical aspects of the game.\n\n3. Visualization: Before training, do a little visualization, imagining yourself successfully completing tasks on the ice. This will help build confidence and prepare the mind to successfully complete tasks.\n\n4. Breathing practices: Use deep breathing techniques to relieve nervous tension and establish concentration. Rhythmic breathing helps calm your mind and prepare you for your workout.\n\n5. Rituals and preparation: Create your pre-workout rituals. This could be a specific procedure for preparing equipment, certain mental exercises, or positive affirmations.\n\n6. Process Focus: Focus on the process of training, not just the result. Prioritize improving technique, skills and tactical training.\n\n7. Stress Management: If you feel nervous or stressed before a workout, try stress management techniques such as deep breathing, walking outside, or positive visualization.\n\n8. Focus: Forget about external issues and focus entirely on the present moment. Focus helps improve the quality of your workout and raise your performance levels.\n\n9. Motivation: Remind yourself of your motivations and passions for hockey. Ignite an inner fire within you that will fuel your determination and enthusiasm.\n\n10. Positive Self-Speech: Avoid negative self-statements and self-criticism before training. Replace them with positive affirmations and belief in your abilities.\n\nMental preparation before training not only helps improve performance, but also creates optimal conditions for achieving your athletic goals.',
    },
    'n7bnu2t7': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '867j0dmo': {
      'ru': 'Психология',
      'en': 'Psychology',
    },
    'zmyme5yi': {
      'ru': 'Home',
      'en': '',
    },
  },
  // AfterTrainingPsychology
  {
    'wrlxhugh': {
      'ru': 'Перед игрой',
      'en': 'Pre-game',
    },
    'wmt65bt3': {
      'ru': 'После игры',
      'en': 'After game',
    },
    'b0bm9n4n': {
      'ru': 'День отдыха',
      'en': 'Free day',
    },
    'r0puhqu8': {
      'ru': 'До тренировки',
      'en': 'Pre-training',
    },
    'skj1e6vf': {
      'ru': 'После тренировки',
      'en': 'After training',
    },
    'wdbxq0mz': {
      'ru': 'В отпуске',
      'en': 'On vacation',
    },
    'm2ruffnj': {
      'ru':
          'Психологическая перестройка после тренировки также играет важную роль в достижении высокой эффективности в хоккее. Вот несколько советов, как хоккеисту можно перестроиться после тренировки и быть эффективным:\n\n1.  Физическая расслабленность:  После тренировки удели время для расслабления и релаксации своего тела. Растяжка, массаж и другие методы помогут уменьшить мышечное напряжение и восстановиться.\n\n2.  Рефлексия:  Отметь свои успехи и прогресс, достигнутые во время тренировки. Это может быть улучшение определенных навыков, увеличение выносливости и т.д. Эта положительная обратная связь поможет тебе поддерживать мотивацию и веру в свои способности.\n\n3.  Отделение от тренировки:  Попробуй отключиться от тренировки после её окончания. Не переноси негативные моменты или неудачи на свои личные дела. Умение отделяться от спорта вне тренировочных сессий поможет сохранить эмоциональное равновесие.\n\n4.  Дыхательные практики:  Используй дыхательные упражнения для снятия напряжения и установления спокойного состояния ума. Глубокое дыхание помогает стабилизировать нервную систему и улучшить концентрацию.\n\n5.  Положительные аффирмации:  Практикуй положительные утверждения или аффирмации, которые поддерживают твою веру в себя и свои способности. Произноси их себе после тренировки.\n\n6.  Восстановление ментальной энергии:  Тренировки могут быть интенсивными не только физически, но и умственно. После тренировки найди способы расслабить свой разум – это может быть медитация, чтение книги, прогулка на свежем воздухе.\n\n7.  Оптимизм и готовность:  После тренировки поддерживайте оптимистичный настрой и готовность к следующим вызовам. Помни, что каждая тренировка приближает тебя к достижению твоих целей.\n\n8.  Планирование:  Определи следующие шаги в твоей тренировочной программе. Это поможет четко ориентироваться в будущих целях и сохранять мотивацию.\n\n9.  Само-поощрение:  Поощряй себя после каждой успешной тренировки. Это может быть какой-то маленький подарок себе или время, проведенное с близкими.\n\nПомни, что эффективная психологическая перестройка после тренировки помогает не только восстановиться, но и поддерживает твою мотивацию, уверенность и готовность к следующим вызовам на площадке.',
      'en':
          'Psychological adjustment after training also plays an important role in achieving high performance in hockey. Here are some tips on how a hockey player can restructure after training and be effective:\n\n1. Physical relaxation: After training, take time to relax and relax your body. Stretching, massage, and other techniques can help relieve muscle tension and promote recovery.\n\n2. Reflection: Note your successes and progress made during training. This could be improving certain skills, increasing endurance, etc. This positive feedback will help keep you motivated and confident in your abilities.\n\n3. Disengagement from the workout: Try to disconnect from the workout after finishing it. Do not transfer negative moments or failures to your personal affairs. Learning to separate yourself from the sport outside of training sessions will help maintain emotional balance.\n\n4. Breathing Practices: Use breathing exercises to relieve tension and establish a calm state of mind. Deep breathing helps stabilize the nervous system and improve concentration.\n\n5. Positive Affirmations: Practice positive statements or affirmations that support your belief in yourself and your abilities. Say them to yourself after your workout.\n\n6. Restore mental energy: Training can be intense not only physically, but also mentally. After your workout, find ways to relax your mind - this could be meditation, reading a book, or taking a walk outside.\n\n7. Optimism and Preparedness: After training, maintain an optimistic attitude and be prepared for the next challenge. Remember that every workout brings you closer to achieving your goals.\n\n8. Planning: Determine the next steps in your training program. This will help you clearly focus on future goals and stay motivated.\n\n9. Self-reward: Reward yourself after every successful workout. It could be some small gift to yourself or time spent with loved ones.\n\nRemember that an effective mental adjustment after training not only helps with recovery, but also keeps you motivated, confident and ready for the next challenge on the court.',
    },
    'bmem5791': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'n15ow03a': {
      'ru': 'Психология',
      'en': 'Psychology',
    },
    'sierphpy': {
      'ru': 'Home',
      'en': '',
    },
  },
  // OnVacationPsychology
  {
    'ucrbk2iq': {
      'ru': 'Перед игрой',
      'en': 'Pre-game',
    },
    'm9t1t7im': {
      'ru': 'После игры',
      'en': 'After game',
    },
    'ujl72vyo': {
      'ru': 'День отдыха',
      'en': 'Free day',
    },
    'aqx7n2u2': {
      'ru': 'До тренировки',
      'en': 'Pre-training',
    },
    'c2p25l3w': {
      'ru': 'После тренировки',
      'en': 'After training',
    },
    '31y00azh': {
      'ru': 'В отпуске',
      'en': 'On vacation',
    },
    'zah9ucq1': {
      'ru':
          'Работа над психологией во время отпуска может быть важным шагом для поддержания эффективности и максимизации результатов в хоккее. Вот несколько советов, как хоккеисту можно работать с собственной психологией во время отпуска:\n\n1.  Разреши себе отдохнуть:  Во время отпуска дай себе разрешение на полноценный отдых. Отпусти тренировки и соревнования на это время и сфокусируйся на отдыхе и восстановлении.\n\n2.  Установи психологический план:  Подумай, какие аспекты твоей психологии ты хотел бы улучшить во время отпуска. Это может быть работа над уверенностью, управлением стрессом или повышением мотивации.\n\n3.  Медитация и релаксация:  Практика медитации и релаксации помогает снизить стресс, улучшить концентрацию и общее состояние психики. Попробуй включить в свой распорядок дня медитативные практики.\n\n4.  Позитивные аффирмации:  Работа с позитивными утверждениями может помочь укрепить уверенность и позитивное мышление. Произноси позитивные фразы о себе и своих способностях.\n\n5.  Визуализация успеха:  Визуализируй себя успешно выполняющим хоккейные действия. Это поможет поддержать твою уверенность и зарядить позитивными эмоциями.\n\n6.  Цельные занятия:  Включи в отпуске цельные занятия, которые помогут развивать физическую форму, например, плавание или тренировки на свежем воздухе.\n\n7.  Рефлексия и анализ:  Проведи анализ своих успехов и неудач на хоккейном поле. Определи, над чем нужно работать и какие аспекты психологии могут помочь улучшить твою игру.\n\n8.  Создай баланс:  Важно найти баланс между активными занятиями и отдыхом. Сконцентрируйся на том, чтобы отпуск был источником энергии и вдохновения, а не истощением.\n\n9.  Общение и поддержка:  Общайся с близкими и друзьями о своих эмоциях и планах на будущее. Поддержка окружающих может быть важной составляющей психологического благополучия.\n\n10.  Саморазвитие:  Воспользуйся временем отпуска для саморазвития и изучения новых аспектов, которые могут помочь как на хоккейном поле, так и в жизни в целом.\n\nПомни, что психологическая работа над собой во время отпуска может существенно повлиять на твою эффективность и улучшить общее состояние. Поддерживай баланс между отдыхом и развитием, чтобы вернуться к тренировкам с новой энергией и уверенностью.',
      'en':
          'Working on your mental health while on vacation can be an important step to maintaining efficiency and maximizing your hockey results. Here are some tips on how a hockey player can work with his own psychology during the holidays:\n\n1. Give yourself permission to rest: During your vacation, give yourself permission to get some quality rest. Let go of training and competition during this time and focus on rest and recovery.\n\n2. Set a mental plan: Think about what aspects of your psychology you would like to improve during your vacation. This could be working on confidence, stress management or increasing motivation.\n\n3. Meditation and Relaxation: Practicing meditation and relaxation helps reduce stress, improve concentration and overall mental health. Try incorporating meditation practices into your daily routine.\n\n4. Positive Affirmations: Working with positive affirmations can help build confidence and positive thinking. Say positive phrases about yourself and your abilities.\n\n5. Visualization of Success: Visualize yourself successfully performing hockey actions. This will help maintain your confidence and charge you with positive emotions.\n\n6. Wholesome activities: Incorporate wholesome activities into your vacation that will help you develop physical fitness, such as swimming or exercising outdoors.\n\n7. Reflection and analysis: Analyze your successes and failures on the hockey field. Determine what you need to work on and what aspects of psychology can help improve your game.\n\n8. Create a balance: It is important to find a balance between active activities and relaxation. Focus on making your vacation a source of energy and inspiration, rather than a drain.\n\n9. Communication and support: Communicate with loved ones and friends about your emotions and plans for the future. Support from others can be an important component of psychological well-being.\n\n10. Self-development: Take advantage of your vacation time to develop yourself and learn new aspects that can help both on the hockey field and in life in general.\n\nRemember that psychological work on yourself during vacation can significantly affect your efficiency and improve your overall condition. Maintain a balance between rest and development so you can return to training with renewed energy and confidence.',
    },
    'p3inoo0b': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    't5pbx94i': {
      'ru': 'Психология',
      'en': 'Psychology',
    },
    'ij3h2g70': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Sleep_pregame
  {
    'rh20lcv3': {
      'ru': 'Перед игрой',
      'en': 'Pre-game',
    },
    'p6g44cng': {
      'ru': 'После игры',
      'en': 'After game',
    },
    'uiabcmii': {
      'ru': 'После тренировки',
      'en': 'After training',
    },
    'jhc94atl': {
      'ru': 'День отдыха',
      'en': 'Free day',
    },
    'zsipd25n': {
      'ru': 'В отпуске',
      'en': 'On vacation',
    },
    '2pskjkr9': {
      'ru':
          'Хороший сон перед игрой играет важную роль в достижении максимальной эффективности на хоккейной площадке. Вот несколько советов, как хоккеисту хорошо поспать перед игрой:\n\n1.  Создай уютную атмосферу:  Обеспечь комфортные условия для сна в своей спальне. Поддерживай прохладную температуру, убедись, что помещение темное и тихое.\n\n2.  Поддерживай режим:  Постарайся ложиться спать и просыпаться примерно в одно и то же время каждый день, даже в дни перед игрой. Регулярность сна помогает улучшить качество сна.\n\n3.  Исключи сильные эмоции перед сном:  Избегай волнений, конфликтов и других сильных эмоций перед сном. Помоги своему разуму успокоиться и подготовиться к отдыху.\n\n4.  Избегай поздней активности:  Ограничь физическую и умственную активность перед сном. Избегай интенсивных тренировок, стрессовых ситуаций или долгой работы за компьютером.\n\n5.  Расслабляющие практики:  Практикуй методы расслабления перед сном, такие как глубокое дыхание, медитация или йога. Эти практики помогут тебе успокоить разум и тело.\n\n6.  Избегай кофеина:  Воздержись от потребления кофеина перед сном. Это вещество может оказать стимулирующее воздействие и мешать твоему сну.\n\n7.  Избегай тяжелой пищи перед сном:  Постарайся не употреблять тяжелую или жирную пищу ближе чем за 2-3 часа до сна. Легкая закуска может быть более подходящим вариантом.\n\n8.  Создай ритуал перед сном:  Установи ритуал, который сигнализирует твоему организму о приближении времени сна. Это может быть чтение книги, теплая ванна или другие спокойные действия.\n\n9.  Используй техники визуализации:  Перед сном визуализируй себя спокойным, уверенным и успешным во время игры. Это может помочь снизить напряжение и создать позитивное состояние.\n\n10.  Темная комната:  Убедись, что в комнате, где ты спишь, нет яркого освещения, которое может помешать нормальному сну. Используйте шторы, чтобы затемнить окна.\n\nСохранение регулярного и качественного сна перед игрой поможет тебе быть максимально эффективным на льду. Не забывай, что хороший сон - это неотъемлемая часть подготовки к играм и тренировкам.',
      'en':
          'Getting good sleep before a game plays an important role in achieving peak performance on the hockey rink. Here are some tips on how a hockey player can get a good night\'s sleep before a game:\n\n1. Create a cozy atmosphere: Provide a comfortable sleeping environment in your bedroom. Keep the temperature cool and make sure the room is dark and quiet.\n\n2. Maintain a routine: Try to go to bed and wake up at approximately the same time every day, even in the days before a game. Regular sleep helps improve sleep quality.\n\n3. Avoid strong emotions before going to bed: Avoid worries, conflicts and other strong emotions before going to bed. Help your mind calm down and prepare for relaxation.\n\n4. Avoid late activity: Limit physical and mental activity before bed. Avoid intense workouts, stressful situations, or long periods of computer work.\n\n5. Relaxation Practices: Practice relaxation techniques before bed, such as deep breathing, meditation or yoga. These practices will help you calm your mind and body.\n\n6. Avoid caffeine: Avoid consuming caffeine before bed. This substance may have a stimulating effect and interfere with your sleep.\n\n7. Avoid heavy meals before bed: Try not to eat heavy or fatty foods within 2-3 hours before bedtime. A light snack may be a better option.\n\n8. Create a pre-bed ritual: Establish a ritual that signals your body that bedtime is approaching. This could be reading a book, taking a warm bath, or other calm activities.\n\n9. Use visualization techniques: Before going to bed, visualize yourself calm, confident and successful while playing. This can help reduce tension and create a positive state.\n\n10. Dark room: Make sure that the room where you sleep does not have bright lights that can interfere with normal sleep. Use curtains to darken windows.\n\nMaintaining regular, quality sleep before a game will help you be as effective as possible on the ice. Don\'t forget that good sleep is an integral part of preparing for games and training.',
    },
    'dont9ruw': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'ffs787eu': {
      'ru': 'Сон',
      'en': 'Sleep',
    },
    't25fyxcl': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Sleep_aftergame
  {
    'db0ygbx2': {
      'ru': 'Перед игрой',
      'en': 'Pre-game',
    },
    '0my6g8qo': {
      'ru': 'После игры',
      'en': 'After game',
    },
    '4esu39e4': {
      'ru': 'После тренировки',
      'en': 'After training',
    },
    'ds1zccxd': {
      'ru': 'День отдыха',
      'en': 'Free day',
    },
    'd96h191z': {
      'ru': 'В отпуске',
      'en': 'On vacation',
    },
    'v4g2jqlp': {
      'ru':
          'После тяжелой игры и выброса адреналина, уснуть может быть сложно из-за возбужденного состояния организма. Однако существует несколько методов, которые могут помочь максимально быстро расслабиться и уснуть:\n\n1.  Глубокое дыхание:  Примени методики глубокого дыхания, чтобы успокоить нервную систему. Вдохни через нос, считая до трех, на мгновение задержи дыхание, затем медленно выдохни через рот считая до четырех. Повторяй этот цикл несколько раз.\n\n2.  Расслабляющая музыка:  Включи медитативную или расслабляющую музыку. Это может помочь создать спокойную атмосферу и снизить возбуждение.\n\n3.  Теплая ванна или душ:  Прием теплой ванны или душа помогает расслабить мышцы и способствует релаксации.\n\n4.  Медитация или визуализация:  Попробуй заняться медитацией или визуализацией, воображая себя в спокойном месте или восстанавливая свои силы после игры.\n\n5.  Избегай яркого света:  Попытайся избегать яркого света перед сном, так как это может подавлять выработку мелатонина, гормона сна.\n\n6.  Создай уютную атмосферу:  Обеспечь комфортные условия для сна: убери из комнаты все раздражающие факторы, обеспечь прохладную температуру и тишину.\n\n7.  Практика расслабления мышц:  Пройдись умственно по всем частям тела и последовательно расслабь каждую из них. Это поможет уменьшить напряжение.\n\n8.  Постепенное снижение активности:  Отключи все устройства с яркими экранами (смартфоны, планшеты, компьютеры) за час до сна. Проведи это время с пониженной активностью и успокаивающими действиями.\n\n9.  Теплая нежная пища:  Легкая и теплая пища, такая как горячий напиток или суп, может помочь создать ощущение уюта и спокойствия.\n\n10.  Избегай кофеина:  Воздержись от употребления кофеина перед сном, так как он может оставаться стимулирующим веществом в организме.\n\nЗапомни, что важно дать себе время на переключение с активности на режим отдыха и подготовки к сну. Комбинируя различные методы расслабления и подготовки к сну, ты сможешь уснуть быстрее и обеспечить своему организму необходимый отдых после тяжелой игры.',
      'en':
          'After a hard game and adrenaline rush, falling asleep can be difficult due to the excited state of the body. However, there are several methods that can help you relax and fall asleep as quickly as possible:\n\n1. Deep Breathing: Use deep breathing techniques to calm your nervous system. Inhale through your nose for a count of three, hold your breath for a moment, then exhale slowly through your mouth for a count of four. Repeat this cycle several times.\n\n2. Relaxing Music: Play meditative or relaxing music. This can help create a calm atmosphere and reduce agitation.\n\n3. Warm Bath or Shower: Taking a warm bath or shower helps relax your muscles and promotes relaxation.\n\n4. Meditation or Visualization: Try meditation or visualization, imagining yourself in a calm place or recovering from a game.\n\n5. Avoid bright light: Try to avoid bright light before bed, as it can suppress the production of melatonin, the sleep hormone.\n\n6. Create a cozy atmosphere: Provide comfortable sleeping conditions: remove all irritating factors from the room, ensure cool temperature and silence.\n\n7. Muscle relaxation practice: Walk mentally through all parts of the body and sequentially relax each of them. This will help reduce tension.\n\n8. Gradually reduce activity: Turn off all devices with bright screens (smartphones, tablets, computers) an hour before bed. Spend this time with reduced activity and calming activities.\n\n9. Warm, tender foods: Light and warm foods, such as a hot drink or soup, can help create a feeling of comfort and calm.\n\n10. Avoid Caffeine: Avoid consuming caffeine before bed as it can remain a stimulant in the body.\n\nRemember that it is important to give yourself time to switch from activity to rest and preparation for sleep. By combining various methods of relaxation and preparation for sleep, you can fall asleep faster and provide your body with the rest it needs after a hard game.',
    },
    'jx9ahkx4': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '0fuwgemv': {
      'ru': 'Сон',
      'en': 'Sleep',
    },
    'wp74gvcw': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Sleep_trainingday
  {
    '6xaqvpcy': {
      'ru': 'Перед игрой',
      'en': 'Pre-game',
    },
    'pzwzfsby': {
      'ru': 'После игры',
      'en': 'After game',
    },
    '3kokv3co': {
      'ru': 'После тренировки',
      'en': 'After training',
    },
    '0ooufvf2': {
      'ru': 'День отдыха',
      'en': 'Free day',
    },
    't0hl29m1': {
      'ru': 'В отпуске',
      'en': 'On vacation',
    },
    '5yrtmkf3': {
      'ru':
          'Успешный сон в день тренировки играет важную роль в восстановлении, эффективности и общем состоянии хоккеиста. Вот несколько советов, как успешно засыпать в классический тренировочный день:\n\n1.  Установи режим:  Старайся ложиться спать и просыпаться примерно в одно и то же время каждый день, даже в дни тренировок. Регулярность помогает улучшить качество сна.\n\n2.  Избегай тяжелой пищи:  Ужинай за 2-3 часа до сна, предпочтительно легкой и усваиваемой пищей. Тяжелая пища перед сном может создавать дискомфорт и мешать сну.\n\n3.  Расслабь мышцы:  Перед сном можно сделать небольшую растяжку или выполнить простые расслабляющие упражнения для мышц. Это поможет снять напряжение и укрепит расслабление.\n\n4.  Техники расслабления:  Практика методов расслабления, таких как глубокое дыхание, медитация или йога, поможет унять нервное напряжение перед сном.\n\n5.  Создай комфортную атмосферу:  Обеспечь в своей спальне прохладную температуру, тишину и темноту. Это поможет создать оптимальные условия для сна.\n\n6.  Избегай яркого света:  Ограничь просмотр экранов с яркими светодиодами (телевизор, смартфон, компьютер) за час до сна, так как яркий свет может подавлять выработку мелатонина, гормона сна.\n\n7.  Теплая ванна или душ:  Прием теплой ванны или душа перед сном помогает расслабить мышцы и способствует улучшению сна.\n\n8.  Избегай кофеина:  Воздержись от потребления кофеина перед сном. Это вещество может оказать стимулирующее воздействие и мешать твоему сну.\n\n9.  Воздух и циркуляция:  Обеспечь хорошую циркуляцию воздуха в спальне. Свежий воздух поможет создать приятную атмосферу для сна.\n\n10.  Устройте себе \"время отключения\":* Постепенно уходи от активности перед сном, почитай книгу, послушай расслабляющую музыку или проведи время в приятной беседе.\n\nЗапомни, что хороший сон перед тренировкой обеспечит тебе эффективность и максимальную подготовку к физической активности. Создавай спокойное и расслабляющее окружение, чтобы помочь себе заснуть быстро и качественно.',
      'en':
          'Successful sleep on the day of training plays an important role in the recovery, performance and overall health of a hockey player. Here are some tips for successfully falling asleep on a classic training day:\n\n1. Establish a routine: Try to go to bed and wake up at approximately the same time every day, even on training days. Regularity helps improve sleep quality.\n\n2. Avoid heavy foods: Have dinner 2-3 hours before bed, preferably light and digestible food. Eating heavy food before bed can create discomfort and interfere with sleep.\n\n3. Relax your muscles: Before going to bed, you can do some light stretching or simple muscle relaxation exercises. This will help relieve tension and promote relaxation.\n\n4. Relaxation Techniques: Practicing relaxation techniques such as deep breathing, meditation or yoga can help ease nervous tension before bed.\n\n5. Create a comfortable atmosphere: Keep your bedroom cool, quiet and dark. This will help create optimal sleep conditions.\n\n6. Avoid bright light: Limit viewing of screens with bright LEDs (TV, smartphone, computer) an hour before bed, as bright light can suppress the production of melatonin, the sleep hormone.\n\n7. Warm Bath or Shower: Taking a warm bath or shower before bed helps relax your muscles and promotes better sleep.\n\n8. Avoid Caffeine: Avoid consuming caffeine before bed. This substance may have a stimulating effect and interfere with your sleep.\n\n9. Air and circulation: Ensure good air circulation in the bedroom. Fresh air will help create a pleasant sleeping environment.\n\n10. Give yourself a “wind down time”: * Gradually withdraw from activity before bed, read a book, listen to relaxing music or spend time in a pleasant conversation.\n\nRemember that good sleep before training will ensure your effectiveness and maximum preparation for physical activity. Create a calm and relaxing environment to help you fall asleep quickly and efficiently.',
    },
    '1vt81jju': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '1qj6kdhu': {
      'ru': 'Сон',
      'en': 'Sleep',
    },
    'ei8xs4q2': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Sleep_freeday
  {
    'mz8zq4ja': {
      'ru': 'Перед игрой',
      'en': 'Pre-game',
    },
    'wix3xcr3': {
      'ru': 'После игры',
      'en': 'After game',
    },
    'gv8qzrq1': {
      'ru': 'После тренировки',
      'en': 'After training',
    },
    '4e3xklyi': {
      'ru': 'День отдыха',
      'en': 'Free day',
    },
    'u11n6zy8': {
      'ru': 'В отпуске',
      'en': 'On vacation',
    },
    'wowg8v8i': {
      'ru':
          'Сохранение регулярного режима сна, даже в выходные дни, играет важную роль в обеспечении эффективности и поддержании хорошей формы. Вот несколько советов, как хоккеисту не нарушать режим сна в выходной день:\n\n1.  Установи консистентное расписание:  Старайся ложиться спать и просыпаться примерно в одно и то же время каждый день, включая выходные дни. Это поможет поддерживать стабильный циркадный ритм и качество сна.\n\n2.  Определи оптимальное количество сна:  Найди оптимальную продолжительность сна для себя. Обычно это 7-9 часов сна в сутки.\n\n3.  Установите \"будильник сна\":  Установи напоминание за час или полчаса до запланированного времени сна. Это поможет начать постепенно готовиться ко сну, выключить устройства с яркими экранами и расслабиться.\n\n4.  Избегай длинных дневных снов:  Если тебе хочется дремать в течение дня, старайся ограничивать дневные сны 20-30 минутами. Длинные дневные сны могут мешать нормальному сну в ночное время.\n\n5.  Поддерживай физическую активность:  Занимайся физической активностью в течение дня, это поможет поддержать бодрствование и улучшить качество сна.\n\n6.  Избегай больших изменений в режиме сна:  Старайся придерживаться одного и того же расписания сна как в будни, так и в выходные. Большие изменения могут сбить твой биологический ритм.\n\n7.  Создай комфортные условия для сна:  Обеспечь тишину, темноту и прохладу в спальне. Удобный матрас и подушка также важны для хорошего сна.\n\n8.  Избегай кофеина перед сном:  Воздержись от употребления кофеина за несколько часов до сна, так как он может повлиять на качество твоего сна.\n\n9.  Создай ритуал перед сном:  Установи определенные действия перед сном, например, часовой период для расслабления, чтения книги или прогулки на свежем воздухе.\n\n10.  Поддерживай баланс:  Важно находить баланс между тренировками, отдыхом и сном. Не забывай, что хороший сон является частью общей подготовки к тренировкам и играм.\n\nСохранение регулярного режима сна даже в выходные дни поможет тебе поддерживать высокую эффективность и бодрость, что важно для хорошей производительности на хоккейной площадке.',
      'en':
          'Maintaining a regular sleep schedule, even on weekends, plays an important role in ensuring efficiency and staying fit. Here are some tips on how a hockey player can avoid disrupting his sleep schedule on a day off:\n\n1. Set a consistent schedule: Try to go to bed and wake up at approximately the same time every day, including weekends. This will help maintain a stable circadian rhythm and sleep quality.\n\n2. Determine the optimal amount of sleep: Find the optimal duration of sleep for yourself. Usually this is 7-9 hours of sleep per day.\n\n3. Set a “sleep alarm”: Set a reminder an hour or half an hour before your scheduled bedtime. This will help you begin to gradually prepare for bed, turn off devices with bright screens and relax.\n\n4. Avoid long naps: If you feel like napping during the day, try to limit your naps to 20-30 minutes. Long naps during the day can interfere with normal sleep at night.\n\n5. Stay physically active: Engaging in physical activity throughout the day will help maintain wakefulness and improve sleep quality.\n\n6. Avoid big changes in your sleep schedule: Try to stick to the same sleep schedule both weekdays and weekends. Big changes can throw off your biological rhythm.\n\n7. Create comfortable sleeping conditions: Ensure silence, darkness and coolness in the bedroom. A comfortable mattress and pillow are also important for good sleep.\n\n8. Avoid caffeine before bed: Avoid consuming caffeine a few hours before bed, as it can affect the quality of your sleep.\n\n9. Create a pre-bed ritual: Establish specific activities before bed, such as an hour-long period of relaxation, reading a book, or taking a walk outside.\n\n10. Maintain balance: It is important to find a balance between training, rest and sleep. Don\'t forget that good sleep is part of your overall preparation for training and games.\n\nMaintaining a regular sleep schedule, even on weekends, will help you maintain high efficiency and alertness, which is important for good performance on the hockey rink.',
    },
    '2ayx0vye': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'kiippicl': {
      'ru': 'Сон',
      'en': 'Sleep',
    },
    'qhc7avi2': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Sleep_onvacation
  {
    'wfhoegpa': {
      'ru': 'Перед игрой',
      'en': 'Pre-game',
    },
    'tl9k7ao1': {
      'ru': 'После игры',
      'en': 'After game',
    },
    'svcggkg6': {
      'ru': 'После тренировки',
      'en': 'After training',
    },
    '8t7qpgou': {
      'ru': 'День отдыха',
      'en': 'Free day',
    },
    'j077e99q': {
      'ru': 'В отпуске',
      'en': 'On vacation',
    },
    '9hv4wy88': {
      'ru':
          'Поддержание регулярного распорядка сна, даже во время отпуска, может существенно повлиять на твою эффективность в сезоне и обеспечить более плавный переход от отдыха к интенсивным тренировкам и играм. Вот несколько советов, как это можно сделать:\n\n1.  Установи четкое расписание:  Даже в отпуске определи фиксированное время для сна и пробуждения. Старайся придерживаться этого расписания каждый день.\n\n2.  Создай уютные условия для сна:  Твое место проживания в отпуске должно быть комфортным для сна. Обеспечь прохладную температуру, тишину и темноту.\n\n3.  Избегай экранов перед сном:  Ограничь использование устройств с яркими экранами, такими как смартфоны, планшеты или компьютеры, перед сном. Яркий свет может подавлять выработку мелатонина, гормона сна.\n\n4.  Упражнения для расслабления:  Перед сном можно практиковать расслабляющие упражнения, такие как глубокое дыхание, растяжка или йога.\n\n5.  Избегай кофеина: Воздержись от потребления кофеина перед сном, так как он может влиять на качество твоего сна.\n\n6.  Установи предсказуемый ритуал перед сном:  Создай ритуал перед сном, который будет сигнализировать организму о приближении времени отдыха. Это может быть чтение книги, теплая ванна или другие спокойные действия.\n\n7.  Спи на хорошем матрасе:  Подумай о качестве твоего спального места. Удобный и поддерживающий матрас может значительно улучшить твой сон.\n\n9.  Фиксируй свой график:  Возможно, тебе будет полезно вести дневник сна, чтобы отслеживать свою практику сна в отпуске и увидеть, как она влияет на твою эффективность.\n\n10.  Остановись в спокойном месте:  Выбери место для отпуска, которое обеспечит спокойствие и умиротворение, чтобы помочь тебе хорошо высыпаться.\n\nПоддержание регулярного сна даже во время отпуска поможет сохранить баланс и подготовиться к новому сезону с эффективностью. Важно помнить, что отдых и сон - это не менее важные составляющие успешной спортивной подготовки, как тренировки, психология и питание.',
      'en':
          'Maintaining a regular sleep routine, even while on vacation, can make a big difference in your performance during the season and provide a smoother transition from rest to intense training and games. Here are some tips on how to do this:\n\n1. Set a clear schedule: Even on vacation, set a fixed time for sleeping and waking up. Try to stick to this schedule every day.\n\n2. Create a comfortable sleeping environment: Your vacation accommodation should be comfortable for sleeping. Provide a cool temperature, quiet and darkness.\n\n3. Avoid screens before bed: Limit the use of devices with bright screens, such as smartphones, tablets or computers, before bed. Bright light can suppress the production of melatonin, the sleep hormone.\n\n4. Relaxation Exercises: Before going to bed, you can practice relaxation exercises such as deep breathing, stretching or yoga.\n\n5. Avoid caffeine: Avoid consuming caffeine before bed as it can affect the quality of your sleep.\n\n6. Establish a predictable bedtime ritual: Create a bedtime routine that signals your body that rest time is approaching. This could be reading a book, taking a warm bath, or other calm activities.\n\n7. Sleep on a good mattress: Think about the quality of your sleeping space. A comfortable and supportive mattress can greatly improve your sleep.\n\n9. Keep a track of your schedule: You may find it helpful to keep a sleep diary to track your vacation sleep practices and see how they affect your efficiency.\n\n10. Stay in a calm place: Choose a vacation spot that provides peace and tranquility to help you get a good night\'s sleep.\n\nMaintaining regular sleep even while on vacation will help you maintain balance and prepare for the new season with efficiency. It is important to remember that rest and sleep are no less important components of successful sports training, like training, psychology and nutrition.',
    },
    'd8nfr5u7': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'rk9m6z4c': {
      'ru': 'Сон',
      'en': 'Sleep',
    },
    'dgaw2jvj': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Eating_Pregame
  {
    'hw87udia': {
      'ru': 'Перед игрой',
      'en': 'Pre-game',
    },
    '4jtcbgyk': {
      'ru': 'После игры',
      'en': 'After game',
    },
    'ppw9khxn': {
      'ru': 'Дни отдыха',
      'en': 'Free day',
    },
    'x8n06l57': {
      'ru': 'До тренировки',
      'en': 'Pre-training',
    },
    'onvz9to8': {
      'ru': 'После тренировки',
      'en': 'After training',
    },
    'l47mzoq5': {
      'ru':
          'Правильное питание перед игрой играет ключевую роль в обеспечении энергии, выносливости и эффективности на хоккейной площадке. Вот несколько советов по питанию для хоккеистов перед игрой:\n\n1.  Употребляй углеводы:  Углеводы являются главным источником энергии для мышц. За 2-3 часа до игры употреби углеводную пищу, такую как макароны, цельнозерновой хлеб, каши, фрукты или овощи.\n\n2.  Избегай тяжелой жирной пищи:  Перед игрой избегай слишком жирных и тяжелых блюд, так как они могут вызвать чувство тяжести и дискомфорта.\n\n3.  Увеличь потребление белка:  Белок помогает поддерживать мышечную массу и восстановление. Включи в рацион куриную грудку, индейку, или другие источники белка.\n\n4.  Употребляй жидкость:  Поддерживай гидратацию, употребляя достаточное количество воды в течение дня и перед игрой. Воду лучше пить постепенно, а не сразу в большом количестве.\n\n5.  Употребляй здоровые жиры:  Включи в рацион полезные жиры, такие как орехи, семена, авокадо и рыба. Они помогут обеспечить долгосрочную энергию.\n\n6.  Овощи и фрукты:  Употребляй овощи и фрукты, которые обогатят твой организм витаминами и минералами, укрепят иммунную систему и помогут восстановлению.\n\n7.  Ограничь сахар и кофеин:  Избегай избыточного потребления сахара и кофеина перед игрой, так как они могут вызвать нервозность и изменения в уровне энергии.\n\n8.  Маленькие, но частые приемы пищи:  Раздели питание на несколько небольших приемов пищи в течение дня. Это поможет поддерживать стабильный уровень энергии и предотвратит чрезмерное чувство голода перед игрой.\n\n9.  Изучи свое тело:  Пробуй различные варианты питания и обрати внимание на то, как твое тело реагирует. Это поможет определить оптимальные продукты и порции для тебя.\n\n10.  Время последнего приема пищи:  Последний прием пищи должен быть за 2-3 часа до начала игры. Это даст возможность организму переварить пищу и обеспечить энергию во время матча.\n\nПомни, что питание - это индивидуальный аспект, и важно найти оптимальный подход, который будет соответствовать твоим потребностям и особенностям организма. Планируй свой рацион заблаговременно и экспериментируй с разными продуктами, чтобы определить наилучший вариант для поддержания высокой эффективности на хоккейной площадке.',
      'en':
          'Eating well before a game plays a key role in ensuring energy, stamina and performance on the hockey rink. Here are some nutrition tips for hockey players before a game:\n\n1. Eat Carbohydrates: Carbohydrates are the main source of energy for muscles. 2-3 hours before the game, eat carbohydrate foods such as pasta, whole grain bread, cereal, fruits or vegetables.\n\n2. Avoid heavy fatty foods: Before the game, avoid foods that are too fatty or heavy, as they can cause a feeling of heaviness and discomfort.\n\n3. Increase your protein intake: Protein helps support muscle mass and recovery. Include chicken breast, turkey, or other sources of protein in your diet.\n\n4. Stay hydrated: Stay hydrated by drinking plenty of water throughout the day and before playing. It is better to drink water gradually, rather than in large quantities at once.\n\n5. Eat healthy fats: Include healthy fats in your diet, such as nuts, seeds, avocado and fish. They will help provide long-term energy.\n\n6. Vegetables and fruits: Eat vegetables and fruits that will enrich your body with vitamins and minerals, strengthen the immune system and help recovery.\n\n7. Limit Sugar and Caffeine: Avoid excess sugar and caffeine intake before a game, as they can cause nervousness and changes in energy levels.\n\n8. Small but frequent meals: Divide your meals into several small meals throughout the day. This will help keep your energy levels stable and prevent you from feeling too hungry before a game.\n\n9. Know your body: Try different foods and pay attention to how your body reacts. This will help you determine the optimal foods and portions for you.\n\n10. Last meal time: The last meal should be 2-3 hours before the start of the game. This will allow the body to digest food and provide energy during the match.\n\nRemember that nutrition is an individual aspect, and it is important to find the optimal approach that will suit your needs and body characteristics. Plan your diet ahead of time and experiment with different foods to determine the best option for maintaining high performance on the hockey rink.',
    },
    '3kq9nhjp': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '2ewsbl78': {
      'ru': 'Питание',
      'en': 'Food',
    },
    '9lbm4ejf': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Eating_BeforeTraining
  {
    'h0hwtbty': {
      'ru': 'Перед игрой',
      'en': 'Pre-game',
    },
    'nvdxbjdm': {
      'ru': 'После игры',
      'en': 'After game',
    },
    'wxskhsui': {
      'ru': 'Дни отдыха',
      'en': 'Free day',
    },
    'fb9uzry4': {
      'ru': 'До тренировки',
      'en': 'Pre-training',
    },
    'w6wodkoy': {
      'ru': 'После тренировки',
      'en': 'After trainig',
    },
    '2ywr47qb': {
      'ru':
          'Правильное питание перед тренировкой играет ключевую роль в обеспечении энергии, выносливости и эффективности во время физической активности. Вот несколько советов по питанию перед тренировкой в тренировочные дни:\n\n1.  Время приема пищи:  Употребляй пищу за 1,5-2 часа до тренировки. Это даст твоему организму время переварить пищу и предоставит энергию во время тренировки.\n\n2.  Углеводы для энергии:  Употребляй легкоусваиваемые углеводы перед тренировкой. Это могут быть фрукты, бананы, ягоды, овсянка, цельнозерновой хлеб или макароны.\n\n3.  Белок для поддержания мышц:  Добавь небольшое количество белка в свой прием пищи перед тренировкой. Это может быть яйцо, греческий йогурт, тофу или куриная грудка.\n\n4.  Избегай жирной и тяжелой пищи:  Перед тренировкой избегай слишком жирной и тяжелой пищи, так как она может вызвать чувство дискомфорта во время физической активности.\n\n5.  Поддерживай гидратацию:  Пей достаточное количество воды перед тренировкой, чтобы избежать обезвоживания. Выпивай воду постепенно, чтобы избежать чрезмерного наполнения желудка.\n\n6.  Снизь потребления кофеина:  Если ты употребляешь кофеин, делай это умеренно. Избегай слишком больших доз перед тренировкой, чтобы избежать нервозности и повышенного пульса.\n\n7.  Питательный снэк:  Если у тебя нет времени на полноценный прием пищи, можно употребить питательный снэк, содержащий углеводы и белок, например, орехи и фрукты, йогурт с овсянкой или банан.\n\n8.  Изучи свою реакцию:  Пробуй разные комбинации продуктов и определи, что лучше всего подходит именно тебе перед тренировкой.\n\n9.  Учитывай индивидуальные особенности:  Некоторые люди могут чувствовать себя лучше с плотной пищей перед тренировкой, другие - с легким снэком. Учитывай свои предпочтения и реакцию организма.\n\nПомни, что правильное питание перед тренировкой поможет тебе получить максимальную выгоду от физической активности, обеспечив энергию и снизив риск чувства утомления и слабости во время тренировки.',
      'en':
          'Proper pre-workout nutrition plays a key role in ensuring energy, endurance and performance during physical activity. Here are some pre-workout nutrition tips on training days:\n\n1. Meal time: Eat food 1.5-2 hours before training. This will give your body time to digest the food and provide energy during your workout.\n\n2. Carbohydrates for Energy: Consume easily digestible carbohydrates before your workout. This could be fruits, bananas, berries, oatmeal, whole grain bread or pasta.\n\n3. Muscle Maintenance Protein: Add a small amount of protein to your pre-workout meal. This could be an egg, Greek yogurt, tofu or chicken breast.\n\n4. Avoid fatty and heavy foods: Before training, avoid foods that are too fatty and heavy, as they can cause discomfort during physical activity.\n\n5. Stay Hydrated: Drink enough water before exercise to avoid dehydration. Drink water gradually to avoid overfilling your stomach.\n\n6. Reduce caffeine intake: If you consume caffeine, do it in moderation. Avoid taking too much before exercise to avoid nervousness and increased heart rate.\n\n7. Nutritious Snack: If you don\'t have time to eat a full meal, you can eat a nutritious snack containing carbohydrates and protein, such as nuts and fruits, yogurt with oatmeal or a banana.\n\n8. Know Your Response: Try different food combinations and see what works best for you before your workout.\n\n9. Consider individual differences: Some people may feel better with a heavy meal before exercise, others with a light snack. Consider your preferences and body reaction.\n\nRemember that eating well before exercise will help you get the maximum benefit from physical activity by providing energy and reducing the risk of feeling tired and weak during exercise.',
    },
    'drmcndxe': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'd8wz5nex': {
      'ru': 'Питание',
      'en': 'Food',
    },
    '32xv0ieh': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Eating_AfterTraining
  {
    'undscpf0': {
      'ru': 'Перед игрой',
      'en': 'Pre-game',
    },
    'trkynjat': {
      'ru': 'После игры',
      'en': 'After game',
    },
    '52ws3441': {
      'ru': 'Дни отдыха',
      'en': 'Free day',
    },
    'xdipdos7': {
      'ru': 'До тренировки',
      'en': 'Pre-training',
    },
    'woc9wfmj': {
      'ru': 'После тренировки',
      'en': 'After training',
    },
    'czfvskd6': {
      'ru':
          'Питание после тренировки играет важную роль в восстановлении, росте мышц и общем состоянии организма. Здоровое питание в этот период помогает восполнить энергию, белки и другие питательные вещества, которые были потеряны во время физической активности. Вот некоторые рекомендации по питанию после тренировки:\n\n1.  Восстановление углеводов: Употреби продукты, богатые углеводами, чтобы восполнить запасы гликогена, основного источника энергии. Это могут быть фрукты, овощи, цельнозерновой хлеб или каши.\n\n2.  Белок для восстановления мышц: Употреби продукты, богатые белком, чтобы поддержать восстановление и рост мышц. Источники белка включают куриную грудку, индейку, рыбу, яйца, молочные продукты, тофу и другие.\n\n3.  Оптимальное время приема пищи:  Старайся употребить пищу в течение 30-60 минут после тренировки, чтобы максимально быстро начать процесс восстановления.\n\n4.  Здоровые жиры:  Включи в рацион полезные жиры, такие как орехи, семена, авокадо и рыба. Они помогут улучшить общее состояние.\n\n5.  Антиоксиданты:  Овощи и фрукты обогатят тебя витаминами, минералами и антиоксидантами, которые помогут улучшить общее состояние.\n\n6.  Гидратация:  Пей достаточное количество воды, чтобы избежать обезвоживания. Тренировка может привести к потере жидкости, поэтому важно ее восполнить.\n\n7.  Питательный белковый снэк:  Если у тебя нет возможности приготовить полноценную еду, можно употребить белковый снэк, например, йогурт с орехами, творог с фруктами или белковый батончик.\n\n8.  Избегай много сахара:  Избегай избыточного потребления сахара после тренировки, чтобы не допустить резкого подъема и падения уровня сахара в крови.\n\n9.  Учитывай индивидуальные особенности:  Некоторые люди могут чувствовать себя лучше с полноценным приемом пищи, другие - с легким снэком. Прислушивайся к своему организму.\n\n10.  Изучи свою реакцию:  Пробуй разные продукты и комбинации, чтобы определить, что лучше всего подходит именно тебе для быстрого восстановления.\n\nПитание после тренировки поможет тебе восстановиться, улучшить результаты и подготовиться к следующей тренировке. Важно уделять внимание качеству и разнообразию пищи, чтобы обеспечить организм всеми необходимыми питательными веществами.',
      'en':
          'Post-workout nutrition plays an important role in recovery, muscle growth, and overall health. Eating healthy during this period helps replenish energy, protein and other nutrients that were lost during physical activity. Here are some post-workout nutrition recommendations:\n\n1. Carbohydrate Replenishment: Consume foods rich in carbohydrates to replenish glycogen stores, the main source of energy. This could be fruits, vegetables, whole grain bread or cereal.\n\n2. Protein for Muscle Recovery: Consume foods rich in protein to support muscle recovery and growth. Protein sources include chicken breast, turkey, fish, eggs, dairy, tofu and others.\n\n3. Optimal meal times: Try to eat within 30-60 minutes after training to begin the recovery process as quickly as possible.\n\n4. Healthy Fats: Include healthy fats in your diet, such as nuts, seeds, avocado and fish. They will help improve your overall condition.\n\n5. Antioxidants: Vegetables and fruits will provide you with vitamins, minerals and antioxidants that will help improve your overall health.\n\n6. Hydration: Drink enough water to avoid dehydration. Working out can cause you to lose fluid, so it\'s important to replenish it.\n\n7. Nutritious Protein Snack: If you can\'t prepare a full meal, you can eat a protein snack, such as yogurt with nuts, cottage cheese with fruit, or a protein bar.\n\n8. Avoid a lot of sugar: Avoid excess sugar consumption after exercise to prevent your blood sugar levels from rising and falling sharply.\n\n9. Consider individual differences: Some people may feel better with a full meal, others with a light snack. Listen to your body.\n\n10. Know Your Response: Try different foods and combinations to determine what works best for you to quickly recover.\n\nEating after a workout will help you recover, improve your performance, and prepare for your next workout. It is important to pay attention to the quality and variety of food to provide the body with all the necessary nutrients.',
    },
    'p4sxbqt5': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'x9fmuz1e': {
      'ru': 'Питание',
      'en': 'Food',
    },
    '49enyrfq': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Eating_FreeDays
  {
    'f75ya6ot': {
      'ru': 'Перед игрой',
      'en': 'Pre-game',
    },
    'lsyx8yn2': {
      'ru': 'После игры',
      'en': 'After game',
    },
    'dvp9gh5h': {
      'ru': 'Дни отдыха',
      'en': 'Free day',
    },
    'p51gt8e1': {
      'ru': 'До тренировки',
      'en': 'Pre-training',
    },
    'm0uz81rs': {
      'ru': 'После тренировки',
      'en': 'After training',
    },
    'gvqm8owc': {
      'ru':
          'Правильное питание во время отдыха и в выходные дни играет важную роль в поддержании высокой эффективности и подготовки к хоккейному сезону. Вот некоторые советы, как правильно питаться на отдыхе и в выходные дни для максимальной эффективности:\n\n1.  Поддерживай регулярное питание:  Не пропускай приемы пищи и старайся употреблять пищу примерно в одно и то же время каждый день, даже в выходные. Это поможет поддерживать стабильный метаболизм и энергетический баланс.\n\n2.  Увеличь употребление белка:  Белок важен для поддержания мышечной массы и восстановления. Увеличь употребление белка в своей диете, включая куриную грудку, рыбу, индейку, яйца, молочные продукты и другие источники белка.\n\n3.  Углеводы для энергии:  Употребляй углеводы, особенно цельнозерновые, чтобы обеспечить организм энергией на протяжении дня. Овощи, фрукты, овсянка, каши и цельнозерновой хлеб - отличные источники углеводов.\n\n4.  Здоровые жиры:  Включай в рацион полезные жиры, такие как орехи, семена, авокадо и рыба. Они важны для общего здоровья и поддержания энергии.\n\n5.  Питательные снэки:  Если ты проводишь активный день, подготовь питательные снэки, чтобы поддержать энергию. Это могут быть комбинации орехов и сухофруктов, творога с фруктами или батончики с высоким содержанием белка.\n\n6.  Гидратация:  Пей достаточное количество воды, чтобы поддерживать гидратацию организма. Вода играет важную роль в обмене веществ и общем состоянии.\n\n7.  Умеренность:  В выходные дни старайся поддерживать умеренное потребление пищи. Избегай чрезмерных угощений, которые могут негативно повлиять на твою физическую форму.\n\n8.  Учитывай индивидуальные потребности:  Каждый организм разный, поэтому важно учитывать свои индивидуальные потребности, особенности и реакции на определенные продукты.\n\n9.  Здоровый завтрак:  Не пренебрегай завтраком даже в выходные. Завтрак является важным стартом дня и помогает поддержать энергию.\n\n10.  Расслабление и наслаждение:  Не забывай, что отдых также важен для твоего общего состояния. Расслабься, насладись временем с близкими и заботься о своем физическом и психологическом благополучии.\n\nПравильное питание на отдыхе и в выходные дни поможет тебе поддерживать высокую эффективность, здоровье и готовность к хоккейному сезону. Старайся создавать баланс между активностью, питанием и отдыхом, чтобы достичь оптимальных результатов.',
      'en':
          'Proper nutrition during rest and on weekends plays an important role in maintaining high performance and preparation for the hockey season. Here are some tips on how to eat healthy on vacation and on weekends for maximum efficiency:\n\n1. Maintain Regular Eating: Don\'t skip meals and try to eat around the same time every day, even on weekends. This will help maintain a stable metabolism and energy balance.\n\n2. Increase your protein intake: Protein is important for maintaining muscle mass and recovery. Increase your protein intake in your diet, including chicken breast, fish, turkey, eggs, dairy and other protein sources.\n\n3. Carbohydrates for Energy: Consume carbohydrates, especially whole grains, to provide energy throughout the day. Vegetables, fruits, oatmeal, cereal and whole grain bread are excellent sources of carbohydrates.\n\n4. Healthy Fats: Include healthy fats in your diet, such as nuts, seeds, avocado and fish. They are important for overall health and energy maintenance.\n\n5. Nutritious Snacks: If you have an active day, prepare nutritious snacks to keep your energy up. These could be combinations of nuts and dried fruits, cottage cheese with fruits, or high protein bars.\n\n6. Hydration: Drink enough water to keep your body hydrated. Water plays an important role in metabolism and general health.\n\n7. Moderation: On weekends, try to maintain moderate food intake. Avoid excessive treats, which can negatively affect your fitness.\n\n8. Consider individual needs: Every body is different, so it is important to consider your individual needs, characteristics and reactions to certain foods.\n\n9. Healthy breakfast: Don\'t neglect breakfast even on weekends. Breakfast is an important start to the day and helps maintain energy.\n\n10. Relaxation and Enjoyment: Don\'t forget that rest is also important for your overall well-being. Relax, enjoy time with loved ones and take care of your physical and mental well-being.\n\nProper nutrition on vacation and on weekends will help you maintain high performance, health and readiness for the hockey season. Try to create a balance between activity, nutrition and rest to achieve optimal results.',
    },
    'mg13ozh9': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'kk1w5p58': {
      'ru': 'Питание',
      'en': 'Food',
    },
    'ya8crk74': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Eating_AfterGame
  {
    'stph9x30': {
      'ru': 'Перед игрой',
      'en': 'Pre-game',
    },
    'u3jdpd52': {
      'ru': 'После игры',
      'en': 'After game',
    },
    'ayevfdx2': {
      'ru': 'Дни отдыха',
      'en': 'Free day',
    },
    'h5wm895q': {
      'ru': 'До тренировки',
      'en': 'Pre-training',
    },
    '9fws7jxo': {
      'ru': 'После тренировки',
      'en': 'After training',
    },
    '5hl1sh1l': {
      'ru':
          'Питание после игры играет важную роль в восстановлении энергии, мышц и общего состояния организма. Важно обеспечить организм необходимыми питательными веществами для эффективной регенерации. Вот несколько советов по питанию после игры:\n\n1.  Восполнение углеводов: После игры организм нуждается в восстановлении уровня гликогена - основного источника энергии. Употребляй продукты, богатые углеводами, такие как цельнозерновые продукты, фрукты и овощи.\n\n2.  Белок для восстановления мышц: Употребляй белок, который поможет восстановить поврежденные мышцы и поддержать их рост. Источники белка: куриная грудка, индейка, рыба, яйца, молочные продукты, тофу и другие.\n\n3.  Жидкость для гидратации: После игры убедись, что ты пьешь достаточное количество воды, чтобы компенсировать потерю жидкости во время матча.\n\n4.  Антиоксиданты из овощей и фруктов:  Овощи и фрукты обогатят тебя витаминами, минералами и антиоксидантами, которые помогут  улучшить общее состояние.\n\n5.  Здоровые жиры:  Включай в рацион полезные жиры, такие как орехи, семена, авокадо и рыба. Они помогут поддержать общее здоровье.\n\n6.  Питательные смузи или батончики: Можешь подготовить питательные смузи или батончики с углеводами, белками и здоровыми жирами для быстрого восстановления после игры.\n\n7.  Время приема пищи:  Старайся употребить пищу в течение часа-полутора после окончания игры. Это позволит быстрее начать процесс восстановления.\n\n8.  Приоритет на натуральные продукты: Отдавай предпочтение натуральным продуктам, которые обеспечат тебе полезные питательные вещества.\n\nПравильное питание после игры поможет тебе восстановиться быстрее, уменьшить риск мышечных травм и подготовиться к следующей тренировке или игре. Старайся уделять внимание качеству и разнообразию пищи, чтобы обеспечить своему организму все необходимое для эффективного восстановления.',
      'en':
          'Post-game nutrition plays an important role in restoring energy, muscles and overall health. It is important to provide the body with the necessary nutrients for effective regeneration. Here are some tips for eating after a game:\n\n1. Carbohydrate replenishment: After a game, the body needs to restore glycogen levels - the main source of energy. Eat carbohydrate-rich foods such as whole grains, fruits and vegetables.\n\n2. Protein for Muscle Recovery: Eat protein that will help repair damaged muscles and support their growth. Sources of protein: chicken breast, turkey, fish, eggs, dairy products, tofu and others.\n\n3. Hydration: After the game, make sure you drink enough water to compensate for fluid loss during the match.\n\n4. Antioxidants from Vegetables and Fruits: Vegetables and fruits will provide you with vitamins, minerals and antioxidants that will help improve your overall health.\n\n5. Healthy fats: Include healthy fats in your diet, such as nuts, seeds, avocado and fish. They will help maintain overall health.\n\n6. Nutritional smoothies or bars: You can prepare nutritional smoothies or bars with carbohydrates, proteins and healthy fats for quick recovery after the game.\n\n7. Meal time: Try to eat food within an hour and a half after finishing the game. This will allow the recovery process to begin faster.\n\n8. Prioritize natural products: Give preference to natural products that will provide you with healthy nutrients.\n\nEating well after a game will help you recover faster, reduce the risk of muscle injury, and prepare for your next practice or game. Try to pay attention to the quality and variety of food to provide your body with everything it needs to recover effectively.',
    },
    'y94h7zur': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'ld8549o8': {
      'ru': 'Питание',
      'en': 'Food',
    },
    'kc89kwah': {
      'ru': 'Home',
      'en': '',
    },
  },
  // speed_jumping_on_platform
  {
    'tqoyq960': {
      'ru': 'Запрыгивание на платформу',
      'en': 'Jumping onto the platform',
    },
    '559kc9kb': {
      'ru': '80',
      'en': '80',
    },
    'ktdghp04': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '5l0dmil2': {
      'ru': '90',
      'en': '90',
    },
    'es1rnifj': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    'wrof65ly': {
      'ru': '85',
      'en': '85',
    },
    'aqb9zhyh': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'fbphoshq': {
      'ru':
          'Для развития скорости с помощью упражнения \"запрыгивание на платформу\" начни стоя перед платформой или боксом. Сделай короткий присед и из него - резкий прыжок, подтягивая колени к груди, и приземлись на платформу. После этого сойди (не спрыгивай) обратно на пол и повторяй упражнение быстро и последовательно, стараясь сохранять ритм, чтобы развивать скоростные навыки и силу нижней части тела. Постепенно увеличивай высоту платформы, с развитием навыков.',
      'en':
          'To develop speed with the platform jumping exercise, start by standing in front of the platform or box. Do a short squat and then a sharp jump, pulling your knees to your chest, and land on the platform. After this, step (don\'t jump) back to the floor and repeat the exercise quickly and consistently, trying to maintain a rhythm to develop speed skills and lower body strength. Gradually increase the height of the platform as your skills develop.',
    },
    '70apocy9': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'gk18jdev': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    '6opvuzuq': {
      'ru': 'Home',
      'en': '',
    },
  },
  // speed_running_on_lestnitsa
  {
    'lzeaugyw': {
      'ru': 'Бег по лестнице',
      'en': 'Running up the stairs',
    },
    'bc2cfman': {
      'ru': '75',
      'en': '75',
    },
    '41te2ndh': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '281njcui': {
      'ru': '75',
      'en': '75',
    },
    'vcq8oixh': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    'kk6oinze': {
      'ru': '90',
      'en': '90',
    },
    'q7qm4zrs': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'l33fuq52': {
      'ru':
          'Для развития скорости с помощью бега по лестнице, просто беги по лестнице попадая ногой на каждю ступень. Таким образом у тебя будет развиваться мелкая семенящая скорость, которая необходимо при игре в ограниченном пространстве.',
      'en':
          'To develop speed with stair running, simply run up the stairs with your foot on each step. This way you will develop the fine mincing speed that is necessary when playing in a confined space.',
    },
    'ebp196lu': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '9puhkz8x': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'ymbuh4cm': {
      'ru': 'Home',
      'en': '',
    },
  },
  // speed_running_on_side
  {
    'ewxt7m41': {
      'ru': 'Бег боком',
      'en': 'Running sideways',
    },
    '2qa90xy0': {
      'ru': '80',
      'en': '80',
    },
    'g13ynq8e': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'ngpxyywh': {
      'ru': '75',
      'en': '75',
    },
    '2inu5orw': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    '557d0cgy': {
      'ru': '85',
      'en': '85',
    },
    'au4p1rhk': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'vyh3dx3h': {
      'ru':
          'Для развития скорости с помощью упражнения \"бег боком\" начни, стоя боком к направлению движения. Сделай короткие, быстрые шаги в сторону, меняя ноги скрестным шагом одной ногой через другую, и поднимай колени выше, чтобы максимально активизировать боковые мышцы и улучшить баланс. Постепенно увеличивай темп и дистанцию, стараясь сохранять правильную технику, чтобы развивать скоростные характеристики и навыки.',
      'en':
          'To develop speed with the sideways running exercise, start by standing with your side to the direction of movement. Take short, quick steps to the side, switching legs with one leg over the other, and lifting your knees higher to maximize activation of your side muscles and improve balance. Gradually increase your pace and distance, making sure to maintain proper technique to develop your speed and skill.',
    },
    'ccccy4ry': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'gljxakht': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    '1a9tivtk': {
      'ru': 'Home',
      'en': '',
    },
  },
  // speed_running_on_place
  {
    'n2jqhtm2': {
      'ru': 'Бег на месте',
      'en': 'Running in place',
    },
    'xg04xtib': {
      'ru': '65',
      'en': '65',
    },
    'zqerjib3': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'bt008cbj': {
      'ru': '70',
      'en': '70',
    },
    'h4hopthu': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    'i25gpgxq': {
      'ru': '85',
      'en': '85',
    },
    'gxajflra': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'halzoblr': {
      'ru':
          'Для развития скорости с помощью упражнения \"бег на месте\" встань на месте с прямой осью тела и поднимай колени вперед, как при беге. Быстро и ритмично меняй ноги, создавая впечатление бега на месте. Увеличивай темп движений и старайся поднимать колени выше, чтобы стимулировать развитие скоростных характеристик и улучшить кардио-выносливость.',
      'en':
          'To develop speed using the “running in place” exercise, stand in place with the axis of your body straight and raise your knees forward, as if running. Change your legs quickly and rhythmically, creating the impression of running in place. Increase the tempo of your movements and try to raise your knees higher to stimulate the development of speed characteristics and improve cardio endurance.',
    },
    'bfqk6xma': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'kiimy8v7': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'iz3i9a7n': {
      'ru': 'Home',
      'en': '',
    },
  },
  // speed_sprinting
  {
    'y161265x': {
      'ru': 'Спринт',
      'en': 'Sprint',
    },
    'ck55sgiv': {
      'ru': '60',
      'en': '60',
    },
    'cfdx68u2': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'j3tjaeae': {
      'ru': '75',
      'en': '75',
    },
    'wqcvskjt': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    'zf3i0og6': {
      'ru': '90',
      'en': '90',
    },
    'ymks6our': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'ubzcrtka': {
      'ru':
          'Для развития скорости с помощью упражнения \"спринт\" начни с установки на стартовую позицию, ноги на ширине плеч, готовясь к быстрому старту. При сигнале, резко оттолкнись от земли, набирая быстрые мощные шаги и максимально увеличивай их ширину по мере набора скорости. Поддерживай вертикальное положение тела, махая руками для придания дополнительной скорости , чтобы максимально развивать скорость и мощность при беге на короткие дистанции.',
      'en':
          'To develop speed with the sprint exercise, start by setting up in a starting position with your feet shoulder-width apart in preparation for a quick start. At the signal, push off the ground quickly, taking quick, powerful strides and maximizing their width as you gain speed. Maintain an upright body position while swinging your arms for added speed to maximize speed and power when sprinting.',
    },
    '30jgn0vw': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'r16u80dn': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'qekn2eiy': {
      'ru': 'Home',
      'en': '',
    },
  },
  // speed_snakes
  {
    '1n3f4m9d': {
      'ru': 'Змейка',
      'en': 'Snake',
    },
    'ijh6e8of': {
      'ru': '75',
      'en': '75',
    },
    '5aj1qfzy': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '96gydrru': {
      'ru': '75',
      'en': '75',
    },
    'elbkbwlt': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    'u0aqnxm7': {
      'ru': '80',
      'en': '80',
    },
    '1xunwd8n': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'nyqfbfm9': {
      'ru':
          'Для выполнения упражнения \"змейка\", расставь стойки на расстоянии 3-5 метров друг от друга в виде зигзага. И начни от нижней стойки бег скрестным шагом к боковой стойке, достигнув которой коснись ее, и быстро измени направление движения, побежав к следующей стойке. Развивай таким образом быструю смену направления. ',
      'en':
          'To perform the “snake” exercise, place the racks at a distance of 3-5 meters from each other in the form of a zigzag. And start running from the bottom stand in a cross step to the side stand, when you reach it, touch it, and quickly change the direction of movement by running to the next stand. Develop a quick change of direction in this way.',
    },
    'zfn8s2om': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'ocmzy7za': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'j05rzdmb': {
      'ru': 'Home',
      'en': '',
    },
  },
  // speed_frogg
  {
    'g5yb04zb': {
      'ru': 'Лягушка',
      'en': 'Frogg',
    },
    'viwxjazf': {
      'ru': '75',
      'en': '75',
    },
    '57u9dcg5': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '0d6rgl1b': {
      'ru': '85',
      'en': '85',
    },
    'blbubz2f': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    'yaije1ai': {
      'ru': '85',
      'en': '85',
    },
    'l8cojskx': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    '5028ptn4': {
      'ru':
          'Для развития скорости с помощью упражнения \"лягушка\" встань в исходную позицию, ноги на ширине плеч. Сделай глубокое приседание и  резкий прыжок вперед, вытягивая руки и распрямляясь в воздухе, приезмляясь обратно в исходное положение, и сразу же оттолкнись от земли, продолжая выполнение упражнения. Старайся, чтобы прыжок был как можно более дальним, чтобы развивать скоростные качества и мощность ног.',
      'en':
          'To develop speed using the frog exercise, stand in the starting position with your feet shoulder-width apart. Do a deep squat and a sharp jump forward, stretching your arms and straightening in the air, landing back to the starting position, and immediately push off the ground, continuing the exercise. Try to make the jump as far as possible in order to develop speed and leg power.',
    },
    'ls2l0hg5': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'fvp21e9l': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'lgdj1ue0': {
      'ru': 'Home',
      'en': '',
    },
  },
  // vynoslivost_byke
  {
    'tq8squlk': {
      'ru': 'Велосипед (горка)',
      'en': 'Bicycle (slide)',
    },
    'o972r20x': {
      'ru': '70',
      'en': '70',
    },
    's731zsyu': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'air7s4fe': {
      'ru': '85',
      'en': '85',
    },
    '271d5nzo': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'gjaybl5b': {
      'ru': '85',
      'en': '85',
    },
    'rgmfh2kk': {
      'ru': 'Выдержка',
      'en': 'Excerpt',
    },
    'u470h3p3': {
      'ru':
          'Для развития выносливости с помощью тренажера велосипеда, установи уровень сопротивления в соответствии с твоим уровнем подготовки. Садись на велосипед, удерживая руки на руле и ноги на педалях. Начните крутить педали в комфортным темпе, затем постепенно увеличивайте скорость и интенсивность тренировки, чтобы поддерживать выносливость на протяжении упражнения.',
      'en':
          'To build endurance with a bike trainer, set the resistance level to suit your fitness level. Sit in the seat with your hands on the steering wheel and feet on the pedals. Start pedaling at a comfortable pace, then gradually increase the speed and intensity of your workout to maintain your endurance throughout the exercise.',
    },
    'dbfymqf8': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'y1cu7bvp': {
      'ru': 'Выдержка',
      'en': 'Endurance',
    },
    '8pxnqdni': {
      'ru': 'Home',
      'en': '',
    },
  },
  // vynoslivost_circles
  {
    'p2op3z3h': {
      'ru': 'Круги на полной скорости',
      'en': '',
    },
    '2rabaqfx': {
      'ru': '90',
      'en': '90',
    },
    'b6lhz42v': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    '2o6bv17e': {
      'ru': '65',
      'en': '65',
    },
    '0gkib8t6': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'w585rbew': {
      'ru': '85',
      'en': '85',
    },
    'gyomqlaa': {
      'ru': 'Выдержка',
      'en': 'Excerpt',
    },
    'zg3ktvwu': {
      'ru':
          'Пробегай 200-300-400 метров на скорости близкой к максимальной для данного растояния, рассчитывая силы так, чтобы провести максимальное ускорение на финишном отрезке круга. Повторяй бег, с перерывом между подходами ~ 2 минут. Регулируй количество кругов, постепенно увеличивая их (но нет смысла делать больше 12)',
      'en':
          'Run 200-300-400 meters at a speed close to the maximum for a given distance, calculating your forces so as to carry out maximum acceleration at the finishing segment of the circle. Repeat the run, with a break between sets of ~ 2 minutes. Adjust the number of circles, gradually increasing them (but there is no point in doing more than 12)',
    },
    'j09wvd0k': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '68r1ozsa': {
      'ru': 'Выдержка',
      'en': 'Endurance',
    },
    'r9f8hlel': {
      'ru': 'Home',
      'en': '',
    },
  },
  // vynoslivost_m_football
  {
    '7r46gkv3': {
      'ru': 'Мини-футбол',
      'en': 'Mini football',
    },
    'r4w6lpjo': {
      'ru': '90',
      'en': '90',
    },
    'nh4d9nrv': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'zlieqn7s': {
      'ru': '85',
      'en': '85',
    },
    '86p7syhg': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'qzqodepy': {
      'ru': '90',
      'en': '95',
    },
    'mcg47zsi': {
      'ru': 'Выдержка',
      'en': 'Excerpt',
    },
    '5a4fv2pt': {
      'ru':
          'Мини-футбол, или футзал, отлично способствует развитию выносливости. Благодаря меньшему расстоянию поля и увеличенной интенсивности игры, игроки часто вынуждены быстро перемещаться и выполнять частые рывки и остановки, что способствует улучшению кардио-сосудистой выносливости. Регулярная игра в мини-футбол способствует укреплению сердечно-сосудистой системы и улучшению общей физической выносливости.',
      'en':
          'Mini-football, or futsal, is great for developing endurance. Due to the shorter field distances and increased intensity of play, players are often forced to move quickly and perform frequent bursts and stops, which helps improve cardiovascular endurance. Regular play of mini-football helps strengthen the cardiovascular system and improve overall physical endurance.',
    },
    'hx44f4oa': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'mwwx69zg': {
      'ru': 'Выдержка',
      'en': 'Endurance',
    },
    'jpopzqbj': {
      'ru': 'Home',
      'en': '',
    },
  },
  // vynoslivost_skakalka_p_sprint
  {
    'hzdwew5n': {
      'ru': 'Скакалка + спринт',
      'en': 'Jump rope + sprint',
    },
    '46b95y8l': {
      'ru': '90',
      'en': '90',
    },
    'sl7rq6mt': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'e7jde8ry': {
      'ru': '85',
      'en': '85',
    },
    'mfqejzrx': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'ugcmimy4': {
      'ru': '80',
      'en': '80',
    },
    'vui3atqg': {
      'ru': 'Выдержка',
      'en': 'Excerpt',
    },
    'cj2xxnao': {
      'ru':
          'Для развития выносливости через упражнение на скакалке с последующим спринтом на 100 метров, начни с разминки, включая растяжку и небольшую беговую разминку. \nНачни выполнение упражнения с 2-3 минут прыжков на скакалке с умеренной интенсивностью. После этого сразу перейди к спринту на 100 метров, стараясь держать высокий темп и уделяя особое внимание технике бега. Повтори этот цикл 4-5 раз, обеспечивая эффективное развитие выносливости и улучшение физической подготовки.',
      'en':
          'To build endurance through a jump rope exercise followed by a 100-meter sprint, start with a warm-up, including stretching and a short running warm-up.\nStart the exercise with 2-3 minutes of jumping rope at moderate intensity. After this, immediately move on to the 100-meter sprint, trying to keep a high pace and paying special attention to running technique. Repeat this cycle 4-5 times, ensuring effective development of endurance and improved physical fitness.',
    },
    'j5vu44ud': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    's9tzmloa': {
      'ru': 'Выдержка',
      'en': 'Endurance',
    },
    'o8r9zocx': {
      'ru': 'Home',
      'en': '',
    },
  },
  // vynoslivost_tabata
  {
    'xw61ug1m': {
      'ru': 'Табата',
      'en': 'Tabata',
    },
    '7pl9kmbp': {
      'ru': '75',
      'en': '75',
    },
    '17o3mdsh': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'zmy2tebf': {
      'ru': '80',
      'en': '80',
    },
    '7lapvfqg': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'cqk5p0zk': {
      'ru': '95',
      'en': '95',
    },
    'cjznq1c9': {
      'ru': 'Выдержка',
      'en': 'Excerpt',
    },
    'pf9ygqi9': {
      'ru':
          'Табата - это метод высокоинтенсивной интервальной тренировки, который включает 20 секунд интенсивного выполнения упражнения, затем 10 секунд отдыха, и так далее восемь раз подряд, общая длительность - 4 минуты. Этот подход активизирует как аэробные, так и анаэробные системы энергопостачания, увеличивая кардио-сосудистную выносливость и выработку энергии. Регулярные тренировки по протоколу Табата могут улучшить работу сердца и легких, а также повысить общую физическую выносливость.',
      'en':
          'Tabata is a method of high-intensity interval training that involves 20 seconds of intense exercise, then 10 seconds of rest, and so on eight times in a row, for a total duration of 4 minutes. This approach activates both aerobic and anaerobic energy supply systems, increasing cardiovascular endurance and energy production. Regular training using the Tabata protocol can improve heart and lung function, as well as improve overall physical endurance.',
    },
    'mvzy9nh2': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'v04i14fz': {
      'ru': 'Выдержка',
      'en': 'Endurance',
    },
    '2j6k5505': {
      'ru': 'Home',
      'en': '',
    },
  },
  // vynoslivost_swimming
  {
    '2n349lbc': {
      'ru': 'Плавание',
      'en': 'Swimming',
    },
    'f2zt3z5l': {
      'ru': '80',
      'en': '90',
    },
    '7efoc4vv': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    '6wt143yr': {
      'ru': '85',
      'en': '85',
    },
    '5a2c3n7d': {
      'ru': 'Сила',
      'en': 'Force',
    },
    '0umvbc5m': {
      'ru': '90',
      'en': '95',
    },
    '8b3fzxqx': {
      'ru': 'Выдержка',
      'en': 'Excerpt',
    },
    'ye4ywfq9': {
      'ru':
          'Плавание - отличный способ для развития выносливости. Чтобы развивать выносливость с помощью плавания, тебе следует следовать некоторым основным принципам и выстраивать свою тренировочную программу:\n\n1. Регулярность:\n   - Плавание требует регулярных тренировок. Постарайся посещать бассейн несколько раз в неделю, чтобы поддерживать и улучшать свою выносливость.\n\n2. Увеличивай дистанцию:\n   - Начни с умеренных расстояний и постепенно увеличивай их с течением времени. Например, начни с 500 метров и постепенно увеличивай до 1 километра, 1,5 километра и так далее.\n   - Разнообразие дистанций поможет развивать как выносливость, так и силу.\n\n3. Тренировки с интервалами:\n   - Включай в тренировки упражнения с интервалами, где ты плаваешь на максимальной скорости в течение определенного времени, а затем отдыхаешь.\n   - Например, можно выполнить серии из 50-метровых участков на максимальной скорости, разделенных короткими перерывами.\n\n4. Долгие плавания:\n   - Регулярно уделяй внимание длинным плаваниям. Плыви на максимально длинную дистанцию, которую ты можешь осилить без перерывов.\n   - Это поможет развивать выносливость и улучшать твою способность долго плавать без устали.\n\n5. Подбери стиль:\n   - Разнообразие стилей плавания, таких как вольный стиль, баттерфляй, гребок на спине и брасс, поможет развивать разные группы мышц и улучшать выносливость.\n\n6. Работа с дыханием:\n   - Освой правильное дыхание при плавании. Это поможет увеличить твою выносливость, улучшив поступление кислорода в организм.\n\n7. Включай в тренировки технику:\n   - Работа по улучшению твоей техники плавания также поможет сэкономить энергию и увеличить выносливость. Работай над правильным движением рук и ног.\n\nСледуя этим рекомендациям и создавая сбалансированную программу тренировок, ты сможешь эффективно развивать выносливость с помощью плавания.',
      'en':
          'Swimming is a great way to develop endurance. To develop endurance through swimming, you should follow some basic principles and build your training program:\n\n1. Regularity:\n   - Swimming requires regular training. Try to go to the pool several times a week to maintain and improve your stamina.\n\n2. Increase the distance:\n   - Start with moderate distances and gradually increase them over time. For example, start with 500 meters and gradually increase to 1 kilometer, 1.5 kilometers and so on.\n   - A variety of distances will help develop both endurance and strength.\n\n3. Interval training:\n   - Incorporate interval exercises into your workouts, where you swim at maximum speed for a certain amount of time and then rest.\n   - For example, you can perform a series of 50-meter sections at maximum speed, separated by short breaks.\n\n4. Long voyages:\n   - Regularly pay attention to long swims. Swim the longest distance you can manage without taking breaks.\n   - This will help develop endurance and improve your ability to swim for a long time without getting tired.\n\n5. Choose a style:\n   - A variety of swimming styles, such as freestyle, butterfly, backstroke and breaststroke, will help develop different muscle groups and improve endurance.\n\n6. Breathwork:\n   - Master proper breathing when swimming. This will help increase your endurance by improving the supply of oxygen to the body.\n\n7. Include technique in your training:\n   - Working to improve your swimming technique will also help you save energy and increase your endurance. Work on the correct movement of your arms and legs.\n\nBy following these guidelines and creating a balanced training program, you can effectively build endurance through swimming.',
    },
    '0edqbmqk': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'sd1cjtzp': {
      'ru': 'Выдержка',
      'en': 'Endurance',
    },
    'ec56dnsh': {
      'ru': 'Home',
      'en': '',
    },
  },
  // moshnost_otzhim_v_pryzhke
  {
    'ck6di3zp': {
      'ru': 'Отжимания в прыжке',
      'en': 'Jump push-ups',
    },
    '606khham': {
      'ru': '75',
      'en': '75',
    },
    'kjqkztce': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'i3tkjz5y': {
      'ru': '80',
      'en': '80',
    },
    'g7rsokx6': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'inpeg6s7': {
      'ru': '80',
      'en': '80',
    },
    '4sw30dtx': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    't57825tp': {
      'ru':
          'Для развития мощности через отжимания в прыжке, начни выполнять отжимания расставив руки чуть шире плеч, во время подъема наверх оттолкнись руками чтобы успеть поменять стойку рук, приземляясь в упор руки вместе. Затем повтори отжимание и из упора руки вместе \"перескочи\" в широкий упор. Таким образом ты будешь прокачивать мышцы которые отвечают за мощность броска. ',
      'en':
          'To develop power through jumping push-ups, start doing push-ups with your hands slightly wider than shoulder-width apart, and as you rise up, push off with your hands so you have time to change your hand stance, landing with your hands together. Then repeat the push-up and “jump” from the support with your hands together to the wide support. This way you will pump up the muscles that are responsible for the power of the throw.',
    },
    'w4rdylo5': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'im3a4m9a': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    '1vhxznfx': {
      'ru': 'Home',
      'en': '',
    },
  },
  // moshnost_jump_from_sit
  {
    '6hkey3bb': {
      'ru': 'Выпрыгивания из низкого приседа',
      'en': 'Jumping out of a low squat',
    },
    'mfrm0gw4': {
      'ru': '70',
      'en': '70',
    },
    '103ze6ue': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '870p3c9k': {
      'ru': '75',
      'en': '75',
    },
    'sm47u6xy': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'erzli5q4': {
      'ru': '85',
      'en': '85',
    },
    'z1khorvv': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    'zx52xqzc': {
      'ru':
          'Для развития мощности с помощью упражнения \"выпрыгивание из низкого приседа\", начни с глубокого приседания. Затем резко выпрыгни вверх, вытягивая руки вверх и выпрямляя тело. Приземлись мягко, согнув ноги в низком приседе, и повторяй упражнение, фокусируясь на мощности взрыва и правильной технике выполнения.',
      'en':
          'To develop power with the low squat jump exercise, start with a deep squat. Then jump up sharply, stretching your arms up and straightening your body. Land softly with your legs bent in a low squat and repeat the exercise, focusing on the power of the explosion and proper technique.',
    },
    'f3dpvkda': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '5wi2phyd': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    '2bxw7qfn': {
      'ru': 'Home',
      'en': '',
    },
  },
  // moshnost_medicin_ball
  {
    'xaok1ye6': {
      'ru': 'Бросок медицин-болла',
      'en': 'Medicine Ball Throw',
    },
    'fd23iab8': {
      'ru': '75',
      'en': '75',
    },
    '9zj3rk6j': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '7kio5ehr': {
      'ru': '80',
      'en': '80',
    },
    'c08bp4z0': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'e3amd176': {
      'ru': '90',
      'en': '90',
    },
    's0k7xick': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    'ygdjd11t': {
      'ru':
          'Для развития мощности через упражнение броска медицинского мяча, начни стоя на устойчивой позиции с медицинским мячом у груди. Сделай короткий присед с акцентом на ноги, затем взрывно передай мяч силой рук и корпуса партнеру. Поддерживай хорошую биомеханику, обеспечивая максимальную мощность в броске и соблюдая безопасность в выполнении. Также можно выполнять бросок в статическом полуприседе только за счет силы рук и корпуса, что будет полезно при резких бросках в игре.\nПомимо броска партнеру, можно упражняться бросая мяч в стену или цель. Тренируйся, бросая мяч на разные дистанции.',
      'en':
          'To develop power through the medicine ball throwing exercise, start by standing in a stable position with the medicine ball at your chest. Do a short squat with emphasis on your legs, then explosively pass the ball with your arms and body to your partner. Maintain good biomechanics by ensuring maximum power in your throw and maintaining safe execution. You can also throw in a static half-squat using only the strength of your arms and core, which will be useful for sharp throws in the game.\nIn addition to throwing to a partner, you can practice throwing the ball at a wall or target. Practice throwing the ball at different distances.',
    },
    '7mby28rz': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '5idepe3i': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    'w5zc0udw': {
      'ru': 'Home',
      'en': '',
    },
  },
  // moshnost_jump_from_one_leg
  {
    'pqavcirz': {
      'ru': 'Выпрыгивания на одной ноге',
      'en': 'Jumping on one leg',
    },
    'mq285yd7': {
      'ru': '85',
      'en': '85',
    },
    '6ba73bv1': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'a73ukosm': {
      'ru': '75',
      'en': '75',
    },
    '5g6vx5oq': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'orw5joqz': {
      'ru': '85',
      'en': '85',
    },
    'y72jpns0': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    '7rio3zsy': {
      'ru':
          'Для развития мощности выпрыгивания с одной ноги, начни с положения выпад на одной ноге, согнутой в колене. Затем резко оттолкнись от пола, прыгая вверх и одновременно поднимая другую ногу к груди. Приземлись мягко в выпад на той же ноге, из которой выпрыгнул, и продолжай повторения, фокусируясь на силовой работе ноги и корпуса.',
      'en':
          'To develop the power of a single-leg jump, start in a lunge position with one leg bent at the knee. Then quickly push off the floor, jumping up and at the same time raising the other leg to your chest. Land softly into a lunge on the same leg you jumped from and continue the reps, focusing on building strength in your leg and core.',
    },
    'f2h9jjhk': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'wciwzzh4': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    'z0pssbr5': {
      'ru': 'Home',
      'en': '',
    },
  },
  // moshnost_paliometrica
  {
    '8eo7h8io': {
      'ru': 'Плиометрический бег',
      'en': 'Plyometric running',
    },
    '4ltte157': {
      'ru': '80',
      'en': '80',
    },
    'x1szmkzy': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'o9dzf45m': {
      'ru': '80',
      'en': '80',
    },
    'gpzw2b4u': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    'uodrjz6o': {
      'ru': '85',
      'en': '85',
    },
    't7kngoao': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'icllsrej': {
      'ru':
          'Для развития мощности через упражнение плиометрического бега, расставь 5 стоек в виде креста, на расстоянии 4-7 метров друг от друга. Начни от нижней стойки и беги к центральной, добежав коснись ее, и перестройся на боковой бег к крайней стойке, коснись ее и также быстро беги боковыми шагами к противоположной стойке, коснись ее и боковым бегом вернись к центральной стойке, коснувшись ее беги лицом к стойке на вершине, коснись ее и возвращайся к начальной стойке спиной вперед. Это упражнение развивает элемент резкой остановки и взрыва с места со сменой направления, что встречается в игре на протяжении каждой смены.',
      'en':
          'To develop power through the plyometric running exercise, arrange 5 racks in the form of a cross, at a distance of 4-7 meters from each other. Start from the bottom counter and run to the central one, when you reach it, touch it, and change to a side run to the outermost counter, touch it and also quickly run with side steps to the opposite counter, touch it and sideways run back to the central post, touching it, run facing the counter at the top, touch it and return to the starting stance backwards. This drill develops the element of stopping suddenly and bursting from a place with a change of direction, which occurs in the game throughout each shift.',
    },
    '3efqzlh5': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'du9e5jmk': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    '89tuvepq': {
      'ru': 'Home',
      'en': '',
    },
  },
  // moshnost_zhgut
  {
    '5pg3e84t': {
      'ru': 'Коньковый шаг со жгутами',
      'en': 'Skate step with harnesses',
    },
    'bzliyeoc': {
      'ru': '75',
      'en': '75',
    },
    's4sg95jy': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'wiil4bgd': {
      'ru': '90',
      'en': '90',
    },
    'tlqb7dxc': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    'gutv9sn6': {
      'ru': '85',
      'en': '85',
    },
    'mzxwq053': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    '8pn2xgcr': {
      'ru':
          'Упражнение со жгутами предоставляет отличный способ развивать мощность. Начни, закрепив жгуты или сопротивительные резинки на устойчивой точке за собой. При выполнении упражнения сфокусируйся на контролируемых прыжках в коньковом шаге в направлении сопротивления, а затем возвращайся к исходной позиции с активным преодолением силы жгутов. Увеличивай силу сопротивления по мере прогресса, чтобы стимулировать эффективное развитие мощности и силовых характеристик.',
      'en':
          'Cable exercises provide a great way to develop power. Start by securing the bands or resistance bands to a stable point behind you. When performing the exercise, focus on controlled jumps in a skating step in the direction of resistance, and then return to the starting position while actively overcoming the force of the bands. Increase resistance as you progress to promote efficient development of power and strength characteristics.',
    },
    'rdr3ekio': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'zjbhg2y7': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    '70m5owne': {
      'ru': 'Home',
      'en': '',
    },
  },
  // moshnost_zhim
  {
    'uq5lhin0': {
      'ru': 'Жим от груди \n(мощно)',
      'en': 'Chest press\n(powerful)',
    },
    '7g9lfdw6': {
      'ru': '70',
      'en': '70',
    },
    'fj0tb7v6': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '996kvefq': {
      'ru': '85',
      'en': '85',
    },
    '81kpbhkh': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'a8kie6kh': {
      'ru': '90',
      'en': '90',
    },
    '19bdp547': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    '9nd1kjn1': {
      'ru':
          'Для развития мощности через упражнение жима от груди (жим лежа), ляг на скамью, держа штангу на уровне верхней части груди и предплечий. Расположи руки чуть шире плеч, пальцы обхватывают штангу. Быстрым движением отжимай штангу вверх, распрямляя руки, и медленно вернись к исходному положению, уделяя внимание правильной технике, чтобы обеспечить безопасное и эффективное развитие мощности.',
      'en':
          'To develop power through the chest press exercise (bench press), lie on a bench holding the barbell level with your upper chest and forearms. Place your hands slightly wider than your shoulders, with your fingers wrapped around the barbell. Quickly press the barbell up, straightening your arms, and slowly return to the starting position, paying attention to proper technique to ensure safe and efficient power development.',
    },
    'wruy4u65': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'u19obajv': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    'tftlfalk': {
      'ru': 'Home',
      'en': '',
    },
  },
  // lovkst_kuvyrok
  {
    '3np3u4sa': {
      'ru': 'Кувырок',
      'en': 'Somersault',
    },
    'afyeua4a': {
      'ru': '90',
      'en': '90',
    },
    'bxrvvgpd': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '06oz7frc': {
      'ru': '80',
      'en': '80',
    },
    'wbcn19mw': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    'vqk2lyra': {
      'ru': '70',
      'en': '70',
    },
    'layiyvcy': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'gwm3bg5a': {
      'ru':
          'Для выполнения кувырка сначала начни с небольшого приседания и упрись руками в землю на ширине плеч. Оттолкнись вперед и немного вверх, одновременно наклоняя верхнюю часть тела вниз. В момент наивысшей точки прыжка, активно подними ноги и проведи оборот вокруг вертикальной оси, приземлившись на другой стороне в положении согнутых колен, и обхватив колени руками, для быстрого подъема.',
      'en':
          'To perform a somersault, first start with a slight squat and place your hands on the ground shoulder-width apart. Push forward and slightly upward while tilting your upper body downward. At the highest point of the jump, actively lift your legs and rotate around the vertical axis, landing on the other side with your knees bent and clasping your knees with your hands for a quick rise.',
    },
    '55hs00ip': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'cfdxi1fb': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'd8hevf3x': {
      'ru': 'Home',
      'en': '',
    },
  },
  // lovkost_step
  {
    'ojqmp0ay': {
      'ru': 'Лесенка',
      'en': 'Ladder',
    },
    'b0clt2bm': {
      'ru': '90',
      'en': '90',
    },
    'ff723j42': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '4s2t91cv': {
      'ru': '80',
      'en': '80',
    },
    '56qdymwm': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    'cbw3nis5': {
      'ru': '90',
      'en': '90',
    },
    'hno4btko': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'ar68ep51': {
      'ru':
          'Упражнение \"лесенка\" включает в себя последовательное поднимание и перемещение ног через ступени или платформы этого устройства. Начни, стоя перед лесенкой, и поочередно поднимай ноги, зашагивая на ступени  сверху вниз. Это упражнение развивает точность движений, равновесие и силу ног, а также помогает улучшить технику передвижения по различным поверхностям. Выбирай из множества упражнений на лесенке, и прокачивай свою ловкость и скорость.',
      'en':
          'The ladder exercise involves sequentially lifting and moving your legs through the steps or platforms of this device. Start by standing in front of the stairs and lift your legs one at a time, stepping up the steps from top to bottom. This exercise develops precision, balance and leg strength, and helps improve technique for moving on various surfaces. Choose from a variety of ladder exercises and improve your agility and speed.',
    },
    'gxu7enbs': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'ujri1ad9': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'fx6ectye': {
      'ru': 'Home',
      'en': '',
    },
  },
  // lovkost_legging
  {
    'aicwie5a': {
      'ru': 'Разножка',
      'en': 'Spreader',
    },
    'gtyvx9pw': {
      'ru': '80',
      'en': '80',
    },
    't3rscd40': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '2hxslv3v': {
      'ru': '75',
      'en': '75',
    },
    'sbv76pqa': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    '5r2o87ho': {
      'ru': '80',
      'en': '80',
    },
    'lmqhr4gu': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'z64egnck': {
      'ru':
          'Упражнение разножка направлено на развитие ловкости и координации. Для выполнения этого упражнения начни с выпада вперед на одну ногу, из этого положения выпрыгни вверх меняя переднюю и заднюю ноги, в \"шпагатном\" положении в воздухе. Призмелись в выпад на другой ноге, готовясь к следующему прыжку. Это упражнение эффективно развивает  гибкость и ловкость, требуемые для быстрого и точного выполнения движений.',
      'en':
          'The stretching exercise is aimed at developing dexterity and coordination. To perform this exercise, start with a forward lunge on one leg, and from this position jump up, alternating front and back legs, in a “split” position in the air. Land into a lunge on the other leg, preparing for the next jump. This exercise effectively develops the flexibility and dexterity required to perform movements quickly and accurately.',
    },
    'mwvemdif': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'gmhxn2gw': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '43b5g5db': {
      'ru': 'Home',
      'en': '',
    },
  },
  // lovkost_jump_on_side
  {
    'o6ld4qhv': {
      'ru': 'Боковые прыжки',
      'en': 'Side jumps',
    },
    'la2gdx7f': {
      'ru': '80',
      'en': '80',
    },
    'lc5mur89': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'fsmlwxae': {
      'ru': '75',
      'en': '75',
    },
    'ukhn29hn': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    'qlm88nar': {
      'ru': '85',
      'en': '85',
    },
    'nl2bz2uw': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'u27ac01u': {
      'ru':
          'Для развития баланса с помощью боковых прыжков встань расставив ноги на ширине плеч, и согнув их как в хоккейной посадке. Сделай резкий прыжок вбок, приземляясь на одной ноге, согнутой в колене, а другая нога будет вытянута вбок. Подтягивай вторую ногу перед следующим прыжком, уделяя внимание точности и контролю движений, чтобы развить баланс и координацию. Обрати внимание на то, чтобы при прыжке вбок, плечи двигались параллельно земле, не распыляй импульс на толчок вверх, только вбок.',
      'en':
          'To develop balance using lateral jumps, stand with your feet shoulder-width apart and bent in a hockey position. Take a sharp jump to the side, landing with one leg bent at the knee and the other leg extended to the side. Bring your other leg up before your next jump, focusing on precision and control to develop balance and coordination. Pay attention to the fact that when jumping sideways, your shoulders move parallel to the ground, do not spray the momentum into the upward push, only sideways.',
    },
    'vur2h47h': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'uaxlhu13': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'sgihcp39': {
      'ru': 'Home',
      'en': '',
    },
  },
  // lovkost_prygalka
  {
    'acl5hlol': {
      'ru': 'Прыгалка',
      'en': 'Jump',
    },
    'va478f3q': {
      'ru': '85',
      'en': '85',
    },
    '8os7pxyv': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'n4m67zun': {
      'ru': '75',
      'en': '75',
    },
    '2vkbv4bd': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    'dic05x9o': {
      'ru': '85',
      'en': '85',
    },
    '2q4e5044': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    '6q9znmy8': {
      'ru':
          'Для выполнения упражнения на скакалке, поставь ноги на ширине плеч. Руки со скаклкой должны быть прижаты к бокам тела. Начни медленно крутить скакалку через верхнюю часть тела и, как только она достигнет места, где она практически касается земли, начни прыгать, поднимая ноги через веревку и перепрыгивая через нее. Старайся держать кисти рук и запястья стабильными, двигая веревку скакалки только с помощью запястьев. Поддерживай ритм, выполняя упражнение с небольшой амплитудой прыжков, и помни о ровном дыхании.',
      'en':
          'To perform the jump rope exercise, place your feet shoulder-width apart. Hands with a rope should be pressed to the sides of the body. Start slowly swinging the rope across your upper body and once it reaches the point where it almost touches the ground, start jumping, lifting your legs over the rope and jumping over it. Try to keep your hands and wrists stable by moving the rope using only your wrists. Maintain the rhythm by performing the exercise with a small amplitude of jumps, and remember to breathe evenly.',
    },
    '8q1br4lg': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '9wdafdqo': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '2dx5yfba': {
      'ru': 'Home',
      'en': '',
    },
  },
  // lovkost_small_area
  {
    'yu2pxzwb': {
      'ru': 'Бег в ограниченном пространстве',
      'en': 'Running in confined spaces',
    },
    '0aldqbij': {
      'ru': '90',
      'en': '90',
    },
    '57bsigx7': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'bkgrybw6': {
      'ru': '80',
      'en': '80',
    },
    '8ve4xhu6': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    'pdekcpz7': {
      'ru': '80',
      'en': '80',
    },
    'zothd0hc': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'wsirogvu': {
      'ru':
          'Для развития баланса при беге в ограниченном пространстве стоит обращать внимание на технику и позицию тела. Сосредоточься на коротких, быстрых, контролируемых шагах, поддерживая прямую ось тела и легкий наклон вперед. Аккуратное использование рук для балансирования и изменения направления также поможет сохранить устойчивость в ограниченной зоне.',
      'en':
          'To develop balance when running in a confined space, you should pay attention to technique and body position. Focus on short, fast, controlled steps, maintaining a straight body axis and a slight forward lean. Careful use of your hands to balance and change direction will also help maintain stability in a confined area.',
    },
    'ifun2hbd': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'kgyx655y': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'zfdq4qk5': {
      'ru': 'Home',
      'en': '',
    },
  },
  // lovkost_tennisball
  {
    'y7ge2f25': {
      'ru': 'Бросок теннисного мяча',
      'en': 'Tennis ball throw',
    },
    'lh7kh15d': {
      'ru': '80',
      'en': '80',
    },
    'papzq9pt': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'qmkogyzw': {
      'ru': '75',
      'en': '75',
    },
    '6ugo2nca': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    'xo0fbbjm': {
      'ru': '85',
      'en': '85',
    },
    'gbju5ym6': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    '9e1tfb1g': {
      'ru':
          'Встань в хоккейную стойку напротив стены, в 2-4 метрах от нее, с теннисным мячом в руке.\n\nФокус на центре тяжести: При выполнении броска теннисного мячика об стену сосредоточься на поддержании стабильности центра тяжести тела. Распредели вес равномерно между ногами, сохраняя прямую ось тела, что позволит легче контролировать баланс во время броска и возвращения мяча.\n\nАктивное восстановление позиции: Сразу же после броска следи за полетом мяча и готовься к его возвращению. После броска быстро восстанови равновесие, вернув тело в исходное положение и готовясь к адаптации к приходящему мячу. Это упражнение развивает способность быстро переходить из одной позиции в другую, что способствует улучшению баланса и реакции.',
      'en':
          'Stand in a hockey stance against a wall, 2-4 meters away from it, with a tennis ball in your hand.\n\nFocus on the center of gravity: When throwing a tennis ball against a wall, focus on maintaining a stable center of gravity of the body. Distribute your weight evenly between your legs while maintaining a straight axis of your body, which will make it easier to control your balance when throwing and returning the ball.\n\nActive recovery: Immediately after the throw, watch the flight of the ball and prepare for its return. After the throw, quickly regain your balance by returning your body to the starting position and preparing to adapt to the incoming ball. This exercise develops the ability to quickly move from one position to another, which improves balance and reaction.',
    },
    '4x867yvi': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'dct2cpz8': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'ty0d7rdb': {
      'ru': 'Home',
      'en': '',
    },
  },
  // force_bicepcs
  {
    'eld5din1': {
      'ru': 'Жим на бицепс',
      'en': 'Biceps press',
    },
    '7soqrq8y': {
      'ru': '65',
      'en': '65',
    },
    'z283kemf': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'rs0b3pob': {
      'ru': '85',
      'en': '85',
    },
    '4jfxp8x1': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'cbo7asds': {
      'ru': '60',
      'en': '60',
    },
    'g6zdvi4u': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    'h90q0gyv': {
      'ru':
          'Для развития силы с помощью упражнения \"жим гантели на бицепс\" начни, сидя на скамье с поддержкой спины, либо стоя в хоккейной посадке с прямой спиной, с гантелями в руках, ладонями обращенными вперед. Медленно сгибай руки в локтях, поднимая гантели к плечам, при этом локти должны оставаться прижатыми к бокам тела. Затем контролируя движение, медленно опускай гантели обратно вниз. Повторяй упражнение, увеличивая вес гантелей или количество повторений, чтобы постепенно укрепить бицепсы и развить силу в руках.',
      'en':
          'To develop strength with the dumbbell biceps press exercise, start by sitting on a bench with your back supported, or standing in a hockey position with your back straight, holding dumbbells in your hands, palms facing forward. Slowly bend your elbows, lifting the dumbbells towards your shoulders, while keeping your elbows pressed to the sides of your body. Then, while controlling the movement, slowly lower the dumbbells back down. Repeat the exercise, increasing the weight of the dumbbells or the number of repetitions to gradually strengthen your biceps and develop strength in your arms.',
    },
    'uq4ytvxz': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'wkl1gyuf': {
      'ru': 'Сила',
      'en': 'Force',
    },
    't119uhzc': {
      'ru': 'Home',
      'en': '',
    },
  },
  // force_brusya
  {
    'np1gigzp': {
      'ru': 'Отжимания на брусьях',
      'en': 'Dips',
    },
    '3i8laksd': {
      'ru': '70',
      'en': '70',
    },
    'nr89j7wn': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '4j66yxw3': {
      'ru': '90',
      'en': '90',
    },
    'c55sdvmp': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'scya1yyk': {
      'ru': '75',
      'en': '75',
    },
    'blc6nzr8': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    'tatg4ahj': {
      'ru':
          'Для развития силы с помощью отжиманий на брусьях, займи позицию на тренажере и начни сгибать руки, до того момента, пока плечи не будут на уровне локтей, затем отжимайся вверх, выпрямляя руки. Поддерживай прямую линию тела, напрягая ягодичные и корпусные мышцы для стабильности, чтобы постепенно увеличить силу верхней части тела.',
      'en':
          'To develop strength with dips, take a position on the machine and begin to bend your arms until your shoulders are level with your elbows, then push up, straightening your arms. Maintain a straight body line by squeezing your glutes and core for stability to gradually increase upper body strength.',
    },
    'semgs6r1': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'su67nll7': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'lj9o4wc9': {
      'ru': 'Home',
      'en': '',
    },
  },
  // force_plank
  {
    '6dmy3vfe': {
      'ru': 'Планка',
      'en': 'Plank',
    },
    'hevxg34p': {
      'ru': '40',
      'en': '40',
    },
    'rteewqdc': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'jqqlav9x': {
      'ru': '85',
      'en': '85',
    },
    'vubmn7fy': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'whyr1330': {
      'ru': '85',
      'en': '85',
    },
    'wjiudjkk': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    'ez9c8si0': {
      'ru':
          'Для развития силы с помощью упражнения \"планка\" начни, в упоре на предплечьях и пальцах ног. Важно создать прямую линию от головы до пяток, активируя ягодичные и корпусные мышцы для поддержания стабильной позиции. Удерживай эту позицию, контролируя дыхание, и старайся увеличивать время удержания планки с каждой тренировкой, чтобы укрепить ядро и верхнюю часть тела.',
      'en':
          'To develop strength with the plank exercise, start by resting on your forearms and toes. It is important to create a straight line from head to heels, activating your glutes and core to maintain a stable position. Hold this position while controlling your breathing, and try to increase the time you hold the plank with each workout to strengthen your core and upper body.',
    },
    'm1ll7htu': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'o7aiqt2x': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'mim9e3ym': {
      'ru': 'Home',
      'en': '',
    },
  },
  // force_turnik
  {
    'cze4dt48': {
      'ru': 'Подтягивания на турнике',
      'en': 'Pull-ups on the horizontal bar',
    },
    'raik7mvz': {
      'ru': '75',
      'en': '75',
    },
    '0ypke7k5': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '73wyz052': {
      'ru': '90',
      'en': '90',
    },
    'z4n3frlz': {
      'ru': 'Сила',
      'en': 'Force',
    },
    '9rmmheih': {
      'ru': '70',
      'en': '70',
    },
    '3re8kbb5': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    'ilp02try': {
      'ru':
          'Для развития силы с помощью упражнения \"подтягивания\" начни, вися на турнике или перекладине, с выбранным хватом на прямых руках. Согни руки в локтях, активируя задействованные мышцы, и подними тело вверх до того момента, когда подбородок будет выше уровня перекладины. Затем медленно опустись вниз, контролируя движение, и повтори упражнение, увеличивая количество подтягиваний, чтобы постепенно укрепить мышцы спины, плеч и бицепсов.',
      'en':
          'To develop strength with the pull-up exercise, start by hanging from a pull-up bar or pull-up bar with your chosen straight-arm grip. Bend your elbows, activating the muscles involved, and lift your body up until your chin is above the level of the bar. Then slowly lower yourself down, controlling the movement, and repeat the exercise, increasing the number of pull-ups to gradually strengthen the muscles of your back, shoulders and biceps.',
    },
    '6yi760m9': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'xhrfly2y': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'pnlf9usf': {
      'ru': 'Home',
      'en': '',
    },
  },
  // force_sit
  {
    'sa1cf7q0': {
      'ru': 'Приседания',
      'en': 'Squats',
    },
    'hbmfcrac': {
      'ru': '60',
      'en': '60',
    },
    'l4qd57pf': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '39srwdck': {
      'ru': '85',
      'en': '85',
    },
    'r3ze4mr5': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'ex944k9x': {
      'ru': '70',
      'en': '70',
    },
    'jopvrxxo': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    'xrtfui6q': {
      'ru':
          'Для развития силы с помощью упражнения приседания начни, стоя на прямых ногах на ширине плеч. Медленно согни колени и опустись вниз, сохраняя прямую спину и вытянутую грудь. Поднимись обратно вверх, отталкиваясь пятками и ягодичными мышцами, чтобы вернуться в исходное положение. Повторяй это упражнение, увеличивая вес или повторения, чтобы постепенно укрепить мышцы ног и корпуса.',
      'en':
          'To develop strength with the squat exercise, start by standing with your legs straight and shoulder-width apart. Slowly bend your knees and lower yourself down, keeping your back straight and chest extended. Push back up, pushing through your heels and glutes to return to the starting position. Repeat this exercise with increasing weight or repetitions to gradually strengthen your leg and core muscles.',
    },
    'i0yw0wro': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '9zxnmugh': {
      'ru': 'Сила',
      'en': 'Force',
    },
    '7wjdsq9p': {
      'ru': 'Home',
      'en': '',
    },
  },
  // force_tyaga
  {
    '8meaiyg6': {
      'ru': 'Тяга в наклоне',
      'en': 'Bent-over row',
    },
    'nw4qz2uf': {
      'ru': '70',
      'en': '70',
    },
    'ztrdq8xy': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '6rnx1rd8': {
      'ru': '85',
      'en': '85',
    },
    'gwcih82p': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'yl7anuz8': {
      'ru': '70',
      'en': '70',
    },
    'y4csf5tq': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    'hskwrqcz': {
      'ru':
          'Для развития силы с помощью упражнения \"тяга в наклоне\" возьми гриф с отягощением и встань перед ним, ноги на ширине плеч. Наклонись вперед в бедрах, держа спину прямой и плоской. Возьми штангу и сгибая руки, тяни ее к нижней части живота, активируя верхние спинные мышцы, затем плавно опусти штангу обратно. Повторяй упражнение, контролируя движения и увеличивая вес, чтобы постепенно укрепить мышцы спины и бицепсы.',
      'en':
          'To develop strength with the Bent Over Row exercise, grab a bar with a weight and stand in front of it with your feet shoulder-width apart. Lean forward at the hips, keeping your back straight and flat. Take the barbell and bend your arms, pull it towards your lower abdomen, activating your upper back muscles, then smoothly lower the barbell back down. Repeat the exercise with controlled movements and increasing weight to gradually strengthen your back muscles and biceps.',
    },
    '2cf1dgcv': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'v5cylihz': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'zq4lvhfb': {
      'ru': 'Home',
      'en': '',
    },
  },
  // force_otzhim_pauk
  {
    '241vh6j5': {
      'ru': 'Отжимания - паук',
      'en': 'Push-ups - spider',
    },
    'r3t3pk85': {
      'ru': '75',
      'en': '75',
    },
    'naccch8d': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'l3i9p3uk': {
      'ru': '80',
      'en': '80',
    },
    'r9f6sctf': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'd8vxsil0': {
      'ru': '75',
      'en': '75',
    },
    'd1t08fjn': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    '7buckojv': {
      'ru':
          'Для развития силы с помощью упражнения \"отжимания - паук\", займи позицию упор лежа и добавь к своим обычным глубоким отжиманиям подтягивание одноименного колена к локтю в момент спуска, и верни ногу обратно в упор, на подъеме. Затем повтори отжимание и подтяни другое колено к локтю находящемуся на его стороне. ',
      'en':
          'To develop strength with the spider push-up exercise, take a prone position and add to your regular deep push-ups by pulling your knee to your elbow as you descend, and return your leg back to the push-up position on the ascent. Then repeat the push-up and bring the other knee towards the elbow on its side.',
    },
    'eab6xdui': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'r5d5svg8': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'zihm1r3u': {
      'ru': 'Home',
      'en': '',
    },
  },
  // balance_millenium
  {
    '8bkal4a7': {
      'ru': 'Мостик',
      'en': 'Bridge',
    },
    'yb9a72ai': {
      'ru': '60',
      'en': '60',
    },
    'bvgiyrpv': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'p3mrfl4h': {
      'ru': '65',
      'en': '65',
    },
    '41p6egol': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'e3k5r5to': {
      'ru': '75',
      'en': '75',
    },
    '9bj632ts': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    'nehdin44': {
      'ru':
          'Для развития баланса выполни упражнение \"мостик\", начиная с положения лежа на спине с подогнутыми ногами и плечами на полу. Затем подними таз и лопатки вверх, создавая прямую линию от плеч до колен, опираясь на ладони и подошвы ног. Старайся поддерживать равновесие и сильное напряжение пресса для эффективного развития баланса.',
      'en':
          'To develop balance, perform the bridge exercise, starting by lying on your back with your legs bent and your shoulders on the floor. Then lift your pelvis and shoulder blades up, creating a straight line from your shoulders to your knees, resting on your palms and soles of your feet. Try to maintain balance and strong abdominal tension to effectively develop balance.',
    },
    'xoeekq2n': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '6e7slx83': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'qdwu4pba': {
      'ru': 'Home',
      'en': '',
    },
  },
  // balance_prised_on_podushka
  {
    '7dkmj74p': {
      'ru': 'Приседания на платформе',
      'en': 'Platform squats',
    },
    'cgpuoc58': {
      'ru': '70',
      'en': '70',
    },
    'hbb3zeen': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'icxhbjcq': {
      'ru': '75',
      'en': '75',
    },
    'g6zwvliq': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'k1lbgmj0': {
      'ru': '85',
      'en': '85',
    },
    'x8kje5l2': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    'z78ovoh7': {
      'ru':
          'Приседания на неустойчивой платформе - отличное упражнение для развития баланса, координации и силы ног.\n\n1. Выбери неустойчивую платформу:\n   - Это может быть босу-подушка (полусфера с плоской стороной внизу), скейтборд, или что-то подобное.\n   - Убедись, что платформа установлена на ровной поверхности и надежно фиксирована.\n\n2. Правильная постановка ног:\n   - Встань на платформу, удостоверься, что вес равномерно распределен между обеими ногами.\n   - Разведи ноги на ширину плеч или немного шире для лучшей устойчивости.\n\n3. Согни колени:\n   - Начни движение, сгибая колени и опуская бедра вниз, как при обычном приседании.\n   - Сохраняй спину прямой и не опускай голову.\n\n4. Медленно приседай:\n   - Постепенно опускайся вниз, пока бедра не станут параллельными полу или насколько это возможно с учетом твоей силы и баланса.\n   - При этом платформа будет немного колебаться, что создаст дополнительный вызов для баланса.\n\n5. Поднимись обратно:\n   - Медленно поднимайся обратно в стартовое положение, выталкивая себя через пятки и используя мышцы ног.\n   - Сфокусируйся на том, чтобы сохранить равновесие на неустойчивой платформе.\n\n6. Повтори упражнение:\n   - Выполни заданное количество повторений (например, 10-15 раз) или установи определенное время для выполнения упражнения (например, 30 секунд).\n   - Постепенно увеличивай количество повторений и/или время, по мере улучшения баланса и силы.\n   - Сосредотачивайся на технике и балансе, а не на скорости выполнения упражнения.\n\nПостоянная практика приседаний на неустойчивой платформе поможет улучшить твой баланс, координацию и силу ног.',
      'en':
          'Squats on an unstable platform are a great exercise for developing balance, coordination and leg strength.\n\n1. Choose an unstable platform:\n   - It could be a bosu pillow (a hemisphere with a flat side at the bottom), a skateboard, or something similar.\n   - Make sure that the platform is installed on a level surface and securely fixed.\n\n2. Correct foot placement:\n   - Stand on the platform, make sure that the weight is evenly distributed between both legs.\n   - Spread your feet shoulder-width apart or slightly wider for better stability.\n\n3. Bend your knees:\n   - Start the movement by bending your knees and lowering your hips down, as in a regular squat.\n   - Keep your back straight and don\'t lower your head.\n\n4. Squat slowly:\n   - Gradually lower yourself down until your thighs are parallel to the floor, or as close as possible to your strength and balance.\n   - This will cause the platform to wobble slightly, creating an additional challenge for balance.\n\n5. Climb back:\n   - Slowly rise back to the starting position, pushing yourself through your heels and using your leg muscles.\n   - Focus on maintaining your balance on the unstable platform.\n\n6. Repeat the exercise:\n   - Perform a specified number of repetitions (for example, 10-15 times) or set a specific time for performing the exercise (for example, 30 seconds).\n   - Gradually increase the number of repetitions and/or time as your balance and strength improve.\n   - Focus on technique and balance, not on the speed of the exercise.\n\nConsistently practicing squats on an unstable platform will help improve your balance, coordination and leg strength.',
    },
    'jk2etuae': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'ht4j2mv9': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'gc6wvlc5': {
      'ru': 'Home',
      'en': '',
    },
  },
  // balance_supermen
  {
    'rvmltzob': {
      'ru': 'Супермен',
      'en': 'Superman',
    },
    'hldop9gx': {
      'ru': '70',
      'en': '70',
    },
    '2ru3tppq': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '05hyxv55': {
      'ru': '65',
      'en': '65',
    },
    'r0l8alhq': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'ca07wtzc': {
      'ru': '80',
      'en': '80',
    },
    'juloiwoa': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    'jto6cg53': {
      'ru':
          'Для развития баланса с помощью упражнения Супермен, встань в упор на четвереньки и поочередно вытягивай в разные стороны разноменные руку и ногу (правую руку вперед - левую ногу назад и наоборот). Старайся зафиксироваться в вытянутом положении на 2-3 секунды и продолжай упражнение.',
      'en':
          'To develop balance using the Superman exercise, stand on all fours and alternately stretch your opposite arm and leg in different directions (right arm forward, left leg back and vice versa). Try to hold in an extended position for 2-3 seconds and continue the exercise.',
    },
    'm10cu792': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '7r32cwgr': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'ymfimmug': {
      'ru': 'Home',
      'en': '',
    },
  },
  // balance_skruchivanya_v_upore
  {
    '8mlq71mh': {
      'ru': 'Скручивания в упоре',
      'en': 'Crunches',
    },
    'jqk51com': {
      'ru': '80',
      'en': '80',
    },
    'bx04i1ys': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'toboz6lx': {
      'ru': '65',
      'en': '65',
    },
    '0wn35t7b': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'ukbadhqk': {
      'ru': '70',
      'en': '70',
    },
    '2slhu9nx': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    '9v665bs3': {
      'ru':
          'Займи позицию в упоре лежа и выполняй скручивания таким образом, чтобы попеременно то левая то правая нога касалась локтя противоположной руки - левое колено правой руки, а правое колено - левой. Сохраняй баланс за счет упора на руки и одну ногу, держа корпус прямо, не поднимая зад вверх, и не проваливая вниз живот. ',
      'en':
          'Take a position in a lying position and perform twists in such a way that alternately your left or right leg touches the elbow of the opposite hand - the left knee of the right hand, and the right knee of the left. Maintain balance by supporting yourself on your arms and one leg, keeping your body straight, without lifting your butt up or dropping your stomach down.',
    },
    '60js6mcm': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'pd7u04i6': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    '02n69oja': {
      'ru': 'Home',
      'en': '',
    },
  },
  // balance_jump_on_stepup
  {
    '0pj0vmyh': {
      'ru': 'Прыжки на лестнице',
      'en': 'Jumping on the stairs',
    },
    '6cy7k9he': {
      'ru': '70',
      'en': '70',
    },
    'tljet4an': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'hot808x8': {
      'ru': '75',
      'en': '75',
    },
    'gcgn4b0j': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'ce2dy72o': {
      'ru': '70',
      'en': '70',
    },
    '73z92c8r': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    'gdxh6mc6': {
      'ru':
          'Для развития баланса начни с медленных и контролируемых движений, поднимаясь по ступенькам лестницы с одной ноги на другую, как при катании на коньках; уделяй внимание точности и плавности движений, стараясь поддерживать равновесие на каждом шаге; постепенно увеличивай интенсивность, прыгая чередующимися ногами, чтобы стимулировать равномерное развитие баланса и координации. Помни, что систематические тренировки на лестнице способствуют улучшению стабильности и уверенности на льду.',
      'en':
          'To develop balance, start with slow and controlled movements, climbing stairs from one foot to the other, as if skating; pay attention to precision and smoothness of movements, trying to maintain balance at every step; Gradually increase the intensity by jumping with alternating legs to encourage even development of balance and coordination. Remember that consistent training on the ladder will improve your stability and confidence on the ice.',
    },
    'rb9l38pj': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'rmm20r5z': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'ggxw28jt': {
      'ru': 'Home',
      'en': '',
    },
  },
  // balance_one_leg_sit
  {
    '1cnoemyy': {
      'ru': 'Приседания на одной ноге',
      'en': 'Single leg squats',
    },
    'v6jqb9oz': {
      'ru': '75',
      'en': '75',
    },
    'th7xsqan': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '7od25n8k': {
      'ru': '85',
      'en': '85',
    },
    'mn3pp6vk': {
      'ru': 'Сила',
      'en': 'Force',
    },
    '2icqm9y2': {
      'ru': '85',
      'en': '85',
    },
    'tve833na': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    'sjqcqqk1': {
      'ru':
          'Для развития баланса выполни упражнение приседания на одной ноге. Встань на одну ногу, и медленно опускайся вниз, сгибая ногу в колене и стремясь сохранить равновесие за счет упора на пятку и вытягивания вперед второй ноги, находящейся на весу. Затем медленно вернись в исходное положение. Повтори упражнение на другой ноге, обращая особое внимание на контроль и координацию движений для эффективного развития баланса и устойчивости.',
      'en':
          'To develop balance, perform a one-leg squat exercise. Stand on one leg and slowly lower yourself down, bending your leg at the knee and trying to maintain balance by resting on your heel and stretching your second leg forward, which is suspended. Then slowly return to the starting position. Repeat the exercise on the other leg, paying particular attention to control and coordination of movements to effectively develop balance and stability.',
    },
    'f3wxbmc1': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'b2ur0j4r': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'icyrk06g': {
      'ru': 'Home',
      'en': '',
    },
  },
  // balance_bird
  {
    'mgjk4lkv': {
      'ru': 'Ласточка с утяжелением',
      'en': 'Swallow with weights',
    },
    'c90fmuvt': {
      'ru': '75',
      'en': '75',
    },
    'l9rxsg9v': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    'e15sp6zd': {
      'ru': '70',
      'en': '70',
    },
    '4sy6e2p6': {
      'ru': 'Сила',
      'en': 'Force',
    },
    'c8lp67vk': {
      'ru': '80',
      'en': '80',
    },
    'jut3tszs': {
      'ru': 'Равновесие',
      'en': 'Equilibrium',
    },
    '6krmjw8l': {
      'ru':
          'Для выполнения упражнения \"ласточка\" и развития баланса, встань ровно, на одной ноге Подними вторую ногу назад и вверх, параллельно земле, в то время как верхняя часть тела наклоняется вперед, вслед за небольшим утяжелением. Удерживай позицию на одной ноге, и тело параллельно с землей, поддерживая баланс и контролируя дыхание, затем вернись в исходное положение - ровно на одной ноге. Поддерживай ритм, выполняя упражнение с небольшой амплитудой, и помни о ровном дыхании. После того как научишься делать упражнение на ровной поверхности, усложни с помощью балансировочной платформы.',
      'en':
          'To perform the swallow exercise and develop balance, stand straight on one leg. Raise the other leg back and up, parallel to the ground, while the upper body leans forward, following a small weight. Maintain the position on one leg, with your body parallel to the ground, maintaining balance and controlling your breathing, then return to the starting position - exactly on one leg. Maintain the rhythm by performing the exercise with a small amplitude, and remember to breathe evenly. After you learn how to do the exercise on a flat surface, make it more difficult using a balancing platform.',
    },
    'szqoc12q': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '5o0udje3': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'v62pgdh5': {
      'ru': 'Home',
      'en': '',
    },
  },
  // ice_stick_tech
  {
    'r09b9vni': {
      'ru': 'Новичок',
      'en': 'Beginner',
    },
    '8qdklt1d': {
      'ru': 'Любитель',
      'en': 'Amateur',
    },
    '7wqoarma': {
      'ru': 'Профи',
      'en': 'Pro',
    },
    'urtw29d6': {
      'ru': 'Широкий перебор',
      'en': 'Wide dribble',
    },
    'zvs54jp2': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    'lc47teze': {
      'ru': '4.5',
      'en': '4.5',
    },
    'toshmodu': {
      'ru': 'Ведение (удоб.)',
      'en': 'Forehand',
    },
    'nkrjp8vu': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    'a4pprn7l': {
      'ru': '4.5',
      'en': '4.5',
    },
    'g95d1fz4': {
      'ru': 'Ведение (неудоб.)',
      'en': 'Backhand',
    },
    '7x2f1uxk': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    'zq0qr3nr': {
      'ru': '4.5',
      'en': '4.5',
    },
    '2q3a3zn8': {
      'ru': 'Восьмерка',
      'en': 'Eight',
    },
    'vmfwbykr': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'chqj8f7v': {
      'ru': '4.5',
      'en': '4.5',
    },
    'y5s5znbx': {
      'ru': 'Убор под себя',
      'en': 'Underself',
    },
    '9a5n8gcp': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'zm0umrs9': {
      'ru': '4.7',
      'en': '4.7',
    },
    'i55lmohh': {
      'ru': 'Новичок',
      'en': 'Beginner',
    },
    'gohey5ps': {
      'ru': 'Любитель',
      'en': 'Amateur',
    },
    'caqiun1t': {
      'ru': 'Профи',
      'en': 'Pro',
    },
    '7uumu6pb': {
      'ru': 'Быстрый дриблинг',
      'en': 'Fast dribble',
    },
    'c243cgah': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'lhcj556i': {
      'ru': '4.6',
      'en': '4.6',
    },
    'ihgv1x7i': {
      'ru': 'Двойной убор',
      'en': 'Twice underself',
    },
    '1veq0tuw': {
      'ru': '+10 очков',
      'en': '+10 points',
    },
    'cxh3dwil': {
      'ru': '4.7',
      'en': '4.7',
    },
    'ypwfg82g': {
      'ru': 'Линия из шайб',
      'en': 'Puckline',
    },
    'thtlrhbo': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'kw64tsjo': {
      'ru': '4.9',
      'en': '4.9',
    },
    'ng3zdjyo': {
      'ru': 'Подкидка',
      'en': 'Transfer',
    },
    'l8c8islv': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    '1leopmg9': {
      'ru': '4.7',
      'en': '4.7',
    },
    'tgbryqtw': {
      'ru': 'Клюшка - Конек',
      'en': 'Stick-Skate',
    },
    'ujoo6b22': {
      'ru': '+15 очков',
      'en': '+15 points',
    },
    '583242xs': {
      'ru': '4.5',
      'en': '4.5',
    },
    'ipw36wio': {
      'ru': 'Новичок',
      'en': 'Beginner',
    },
    'x9owlu4p': {
      'ru': 'Любитель',
      'en': 'Amateur',
    },
    'm3a50dd9': {
      'ru': 'Профи',
      'en': 'Pro',
    },
    'tqcs22eh': {
      'ru': 'Линия одной рукой',
      'en': 'One hand line',
    },
    'pswprmcp': {
      'ru': '+25 очков',
      'en': '+25 points',
    },
    '8x6d35vh': {
      'ru': '4.9',
      'en': '4.9',
    },
    'maue1b4r': {
      'ru': 'Тетрис',
      'en': 'Tetris',
    },
    'ozsd25zc': {
      'ru': '+30 очков',
      'en': '+30 points',
    },
    'gu1oew8a': {
      'ru': '5.0',
      'en': '5.0',
    },
    'wkxfgim5': {
      'ru': 'Дриблинг',
      'en': 'Dribbling',
    },
    'lsouie1r': {
      'ru': 'Home',
      'en': '',
    },
  },
  // stick_eight
  {
    'cgpjib81': {
      'ru': 'Восьмерка',
      'en': 'Eight',
    },
    'f9ifsh6o': {
      'ru': '95',
      'en': '95',
    },
    'go4z8hc4': {
      'ru': 'Важность',
      'en': 'Importance',
    },
    'zsqgmdir': {
      'ru': '30',
      'en': '30',
    },
    'mgiccufd': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'r2bog7l6': {
      'ru': '25',
      'en': '25',
    },
    '9x4x78ta': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    '1q3e3jiv': {
      'ru':
          'Расставь две шайбы перед собой, на расстоянии позволяющем производить убор под себя на вытянутых руках. Старайся не производить лишних переборов, и не смотреть на шайбу, обводя стойки в широкой амплитуде.',
      'en':
          'Place two washers in front of you, at a distance that allows you to clean under yourself with outstretched arms. Try not to make unnecessary moves and not look at the puck while circling the posts in a wide amplitude.',
    },
    'bropfgax': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'dislnuac': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'lmtjbjm6': {
      'ru': 'Дриблинг',
      'en': 'Dribbling',
    },
    'glpvc5l8': {
      'ru': 'Home',
      'en': '',
    },
  },
  // stick_weight_perebor
  {
    'msrogxdk': {
      'ru': 'Перебор в широкой\nамплитуде',
      'en': 'Bust in the wide\namplitude',
    },
    'qvj8f1be': {
      'ru': '100',
      'en': '100',
    },
    '9doh4iex': {
      'ru': 'Важность',
      'en': 'Importance',
    },
    '10nrmocd': {
      'ru': '40',
      'en': '40',
    },
    'nyc5fkgq': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'i4nh2fd3': {
      'ru': '30',
      'en': '30',
    },
    'xccwb45u': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'szi7967a': {
      'ru':
          'Расставь две шайбы перед собой, на расстоянии 2-4 метра, и начинай перебор таким образом, чтобы крюк клюшки уходил максимально далеко в сторону от опорных ног, не теряя контроля над шайбой. Следи за тем, чтобы рука двигалась свободно, вес тела переносился вслед за шайбой, голова не была опущена, и шайба переносилась максимально близко к конькам.',
      'en':
          'Place two pucks in front of you, at a distance of 2-4 meters, and start playing in such a way that the blade of the stick goes as far away from your supporting legs as possible, without losing control of the puck. Make sure that your arm moves freely, your body weight follows the puck, your head is not lowered, and the puck is carried as close to your skates as possible.',
    },
    'uq64ilwl': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '6a8uhqkj': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '788zmbq7': {
      'ru': 'Дриблинг',
      'en': 'Dribbling',
    },
    'xq9lg6lq': {
      'ru': 'Home',
      'en': '',
    },
  },
  // stick_underself
  {
    '1lua3df8': {
      'ru': 'Убор под себя',
      'en': 'Underself',
    },
    'wko85531': {
      'ru': '100',
      'en': '100',
    },
    'hbc6t6xy': {
      'ru': 'Важность',
      'en': 'Importance',
    },
    '51rnvw17': {
      'ru': '60',
      'en': '60',
    },
    'bpwoj6ha': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'ozxitbwh': {
      'ru': '45',
      'en': '45',
    },
    '2v7rw9b8': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'jrvcvvvo': {
      'ru':
          'Расставь шайбы в линию, и начни обыгрыш двигаясь ровно по прямой (линия должна идти между коньков), сделай ложное движение влево, переложив вес тела в этом направлении, заведя свою шайбу за препятствие, после чего удобной стороной крюка подверни ее таким образом, чтобы шайба проходила максимально близко к твоим конькам и убери как можно дальше на неудобную сторону, без потери контроля над шайбой. Следи за тем, чтобы нижняя рука свободно двигалась, а не была прикована к трубе клюшки. ',
      'en':
          'Place the pucks in a line and start playing by moving exactly in a straight line (the line should go between the skates), make a false movement to the left, shifting your body weight in this direction, placing your puck behind the obstacle, then use the convenient side of the hook to turn it so that the puck passed as close to your skates as possible and move it as far as possible to the uncomfortable side without losing control of the puck. Make sure your bottom arm is free to move and not tied to the shaft of the club.',
    },
    'rby1bu2f': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '6bavyajj': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '3gcdkpbu': {
      'ru': 'Дриблинг',
      'en': 'Dribbling',
    },
    'u97x7qk7': {
      'ru': 'Home',
      'en': '',
    },
  },
  // stick_forehand
  {
    'g3e3bmi1': {
      'ru': 'Ведение на удобной',
      'en': 'Forehand dribbling',
    },
    'jt425io9': {
      'ru': '100',
      'en': '100',
    },
    'j9ja1bwc': {
      'ru': 'Важность',
      'en': 'Importance',
    },
    'vwesdlb9': {
      'ru': '40',
      'en': '40',
    },
    'f6x2icek': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    '24bulopm': {
      'ru': '30',
      'en': '30',
    },
    '833x3gpi': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    '6pkzlkbj': {
      'ru':
          'Расположи препятствия в выбранном порядке (змейкой, лабиринтом или хаотично) и веди шайбу исключительно удобной стороной клюшки обыгрывая на своем пути все встречные препятствия за счет координированных движений клюшки и коньков. Старайся смотреть не вниз на шайбу а немного выше, на 45 градусов,  чтобы видеть переферийным зрением общую обстановку на льду, и прогнозировать свое правильное поведение.',
      'en':
          'Arrange the obstacles in the chosen order (snake, labyrinth or chaotically) and move the puck exclusively with the comfortable side of the stick, beating all the oncoming obstacles along the way through coordinated movements of the stick and skates. Try to look not down at the puck, but a little higher, at 45 degrees, in order to see the general situation on the ice with your peripheral vision and predict your correct behavior.',
    },
    'wbr0tfgp': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '38ul3dri': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '83091l7s': {
      'ru': 'Дриблинг',
      'en': 'Dribbling',
    },
    'kvrocveu': {
      'ru': 'Home',
      'en': '',
    },
  },
  // stick_backhand
  {
    'gqgy83pd': {
      'ru': 'Ведение на неудобной',
      'en': 'Backhand dribble',
    },
    'bzzyne2b': {
      'ru': '100',
      'en': '100',
    },
    '4g5v63h0': {
      'ru': 'Важность',
      'en': 'Importance',
    },
    'os2o73u7': {
      'ru': '40',
      'en': '40',
    },
    'p6f02fch': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'fu0g8peo': {
      'ru': '45',
      'en': '45',
    },
    'ijmpqvuc': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'q0crx4t0': {
      'ru':
          'Расположи препятствия в выбранном порядке (змейкой, лабиринтом или хаотично) и веди шайбу исключительно неудобной стороной клюшки обыгрывая на своем пути все встречные препятствия за счет координированных движений клюшки и коньков. Старайся смотреть не вниз на шайбу а немного выше, на 45 градусов,  чтобы видеть переферийным зрением общую обстановку на льду, и прогнозировать свое правильное поведение.',
      'en':
          'Arrange the obstacles in the chosen order (snake, labyrinth or chaotically) and move the puck exclusively with the awkward side of the stick, beating all the oncoming obstacles on your way through coordinated movements of the stick and skates. Try to look not down at the puck, but a little higher, at 45 degrees, in order to see the general situation on the ice with your peripheral vision and predict your correct behavior.',
    },
    'nc3lzess': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'k3sc18q0': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '6o7l5wqi': {
      'ru': 'Дриблинг',
      'en': 'Dribbling',
    },
    'k9ju6bot': {
      'ru': 'Home',
      'en': '',
    },
  },
  // stick_fast_dribble
  {
    'x2soan0v': {
      'ru': 'Быстрый дриблинг',
      'en': 'Fast dribbling',
    },
    '29yupt3w': {
      'ru': '85',
      'en': '85',
    },
    'j954r2bh': {
      'ru': 'Важность',
      'en': 'Importance',
    },
    'et8s0u5t': {
      'ru': '50',
      'en': '50',
    },
    '16cuil6o': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'goh4usam': {
      'ru': '40',
      'en': '40',
    },
    'algmsivd': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'z238hbv1': {
      'ru':
          'Встань в хоккейную стойку, контролируя шайбу перед собой, и начинай короткие переборы постепенно вращая туловище по часовой стрелке до упора назад, после чего также постепенно вращая туловище и ускоряя скорость перебора вращайся в обратную, до упора, сторону. Старайся не смотреть на шайбу, держа голову поднятой, осматривая окружающую обстановку.',
      'en':
          'Stand in a hockey stance, controlling the puck in front of you, and begin short passes, gradually rotating your torso clockwise all the way back, after which you also gradually rotate your torso and accelerate the speed of the transfer, rotating in the opposite direction until it stops. Try not to look at the puck, keeping your head up as you scan your surroundings.',
    },
    'jyo6ywld': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'tflysqqc': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'w329rz7v': {
      'ru': 'Дриблинг',
      'en': 'Dribbling',
    },
    'gy6a5sjk': {
      'ru': 'Home',
      'en': '',
    },
  },
  // stick_twice_underself
  {
    'g1f8jyeo': {
      'ru': 'Двойной убор под себя',
      'en': 'Twice underself',
    },
    'j2izusb3': {
      'ru': '65',
      'en': '65',
    },
    '1eiqsgi8': {
      'ru': 'Важность',
      'en': 'Importance',
    },
    '3bluym6u': {
      'ru': '85',
      'en': '85',
    },
    'mf5qyws0': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'lyve0kct': {
      'ru': '80',
      'en': '80',
    },
    'ttx5di27': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'dzdg238w': {
      'ru':
          'Расставь линию из шайб и начинай обыгрыш каждой из них коротким элементом убора под себя. Доведя убор до точки напротив шайбы-стойки, резко подхвати шайбу неудобной стороной крюка продвигая ее далее по траектории, за свой ближний конек, выполнив тем самым убор под себя с обманным начальным маневром. ',
      'en':
          'Arrange a line of pucks and start beating each of them with a short piece of equipment for yourself. Having brought the tackle to the point opposite the puck-rack, sharply pick up the puck with the inconvenient side of the hook, moving it further along the trajectory, behind your near skate, thereby completing the tackle under yourself with a deceptive initial maneuver.',
    },
    'nvq2rr21': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'p1n99ckz': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '3kzwosr7': {
      'ru': 'Дриблинг',
      'en': 'Dribbling',
    },
    'zoxxb31i': {
      'ru': 'Home',
      'en': '',
    },
  },
  // stick_speed_puckline
  {
    'mhgdmly2': {
      'ru': 'Линия шайб на скорости',
      'en': 'Speed puckline',
    },
    '7120annd': {
      'ru': '80',
      'en': '80',
    },
    'dowgrrcx': {
      'ru': 'Важность',
      'en': 'Importance',
    },
    '6l9ibrf6': {
      'ru': '85',
      'en': '85',
    },
    'nh2i5udy': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    '9b3k0bqu': {
      'ru': '80',
      'en': '80',
    },
    'mbkksztn': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    '3si2xyii': {
      'ru':
          'Расставь линию из шайб, расстояние между ними около 40 см. Кати вперед по прямой оставляя шайбы между ног, и быстро перебирая шайбу с одной стороны на другую перед шайбой-препятствием. ',
      'en':
          'Place a line of washers, the distance between them is about 40 cm. Roll forward in a straight line, leaving the washers between your legs, and quickly moving the puck from one side to the other in front of the obstacle puck.',
    },
    'l20s9mzb': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'g27jifge': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'z12o2rdj': {
      'ru': 'Дриблинг',
      'en': 'Dribbling',
    },
    'jke563b2': {
      'ru': 'Home',
      'en': '',
    },
  },
  // stick_flypuck
  {
    'v9qiw4qt': {
      'ru': 'Подкидка через клюшку',
      'en': 'Throwing over the stick',
    },
    'olbfrps9': {
      'ru': '80',
      'en': '80',
    },
    'ziy8jd4z': {
      'ru': 'Важность',
      'en': 'Importance',
    },
    'l5o5xj73': {
      'ru': '75',
      'en': '75',
    },
    'gep37soj': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'nnb8vdft': {
      'ru': '65',
      'en': '65',
    },
    '809rj139': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'aegf13j9': {
      'ru':
          'Положи напротив себя клюшку либо палку. Встань прямо перед ней и подсеки шайбу таким образом, чтобы она перелетела лежащее препятствие , а ты обработал ее в моменте приземления. Практикуйся как  с удобной, так  и с неудобной руки.',
      'en':
          'Place a club or stick in front of you. Stand right in front of her and hook the puck so that it flies over the obstacle, and you handle it at the moment of landing. Practice with both a comfortable and uncomfortable hand.',
    },
    'tvpteakl': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '9mh6ka07': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'vcue1eiv': {
      'ru': 'Дриблинг',
      'en': 'Dribbling',
    },
    'gyc50nhl': {
      'ru': 'Home',
      'en': '',
    },
  },
  // stick_underself_outself
  {
    'c63pf9st': {
      'ru': 'Убор под себя -\nот себя',
      'en': 'Underself - outself',
    },
    'a9zelhgt': {
      'ru': '100',
      'en': '100',
    },
    '6lx426bc': {
      'ru': 'Важность',
      'en': 'Importance',
    },
    'qjtxjgzv': {
      'ru': '65',
      'en': '65',
    },
    'egygd3pc': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'qn2762bw': {
      'ru': '65',
      'en': '65',
    },
    'si15iyz4': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    '9p5dnwpp': {
      'ru':
          'Расставь линию шайб  и обыгрывай препятствия следующим образом - сделай ложный убор на удобную, перенеся вес тела на ногу, и начни выполнять элемент убор под себя. Доведя шайбу до своих коньков и линии препятствий, вместо убора на неудобную, сделай резкое возвратное движение, выталкивая себя коньками в обратном направлении, контролируя шайбу удобной стороной клюшки.',
      'en':
          'Arrange a line of pucks and beat the obstacles in the following way - make a false pull-up on a comfortable one, transferring your body weight to your leg, and start performing the pull-up element for yourself. Having brought the puck to your skates and the obstacle line, instead of putting it on the inconvenient one, make a sharp return movement, pushing yourself with your skates in the opposite direction, controlling the puck with the comfortable side of the stick.',
    },
    '7rhif9aa': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'wr78i4i4': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '4jg0juhb': {
      'ru': 'Дриблинг',
      'en': 'Dribbling',
    },
    '8ez8hisq': {
      'ru': 'Home',
      'en': '',
    },
  },
  // stick_oneHand_line
  {
    '5mm6dz0i': {
      'ru': 'Линия шайб одной рукой',
      'en': 'One-hand line',
    },
    'ww8oogr5': {
      'ru': '80',
      'en': '80',
    },
    '79yv82ol': {
      'ru': 'Важность',
      'en': 'Importance',
    },
    'aeu3qo9u': {
      'ru': '90',
      'en': '90',
    },
    '0t0c4e0y': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'uzgatisb': {
      'ru': '85',
      'en': '85',
    },
    'e0rch4x5': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'jsx331dy': {
      'ru':
          'Выполняй те же упражнения, что и в комплексе для двух рук, производя обводки одной рукой, сначала удобной, затем неудобной.',
      'en':
          'Perform the same exercises as in the complex for two hands, making strokes with one hand, first comfortable, then uncomfortable.',
    },
    'g4137zzq': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    't9e4fxkz': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'gp9b1dq5': {
      'ru': 'Дриблинг',
      'en': 'Dribbling',
    },
    'nyb5g1gg': {
      'ru': 'Home',
      'en': '',
    },
  },
  // stick_tetris
  {
    '2l6icpqo': {
      'ru': 'Тетрис',
      'en': 'Tetris',
    },
    '4bpf4nw1': {
      'ru': '80',
      'en': '80',
    },
    'loeeagtv': {
      'ru': 'Важность',
      'en': 'Importance',
    },
    '1ei98eah': {
      'ru': '85',
      'en': '85',
    },
    '31p2pgrs': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'pww8vmkk': {
      'ru': '75',
      'en': '75',
    },
    'sdi8z2dq': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'o25hxfzk': {
      'ru':
          'Возьми одну шайбу и выставь линию из шайб. Сделай убор на широкую и приставь шайбу к первой в линии так, чтобы твоя изначальная шайба оказалась немного в стороне, взятой шайбой сделай убор в сторону и приставь ко второй шайбе в линии оставив первую в стороне, продолжай до конца выстраивая фигуру змейку ( чем шире - тем лучше ). Дойдя до конца повтори все в обратном порядке, спиной вперед - верни последнюю шайбу к предпоследней, и так далее, постарайся, чтобы в конце осталась идеально ровная линия.',
      'en':
          'Take one washer and make a line of washers. Make a wide sweep and place the puck against the first one in the line so that your original puck is a little to the side, with the taken puck make a sweep to the side and place it against the second puck in the line, leaving the first one aside, continue to build up the snake figure to the end (the wider - all the better ). Having reached the end, repeat everything in the reverse order, backwards - return the last puck to the penultimate one, and so on, try to leave a perfectly straight line at the end.',
    },
    'q2x46wrz': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '8qvky5q6': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'f3bc8t6r': {
      'ru': 'Дриблинг',
      'en': 'Dribbling',
    },
    'hlzqa6kh': {
      'ru': 'Home',
      'en': '',
    },
  },
  // stick_twice_lie
  {
    'irhprllj': {
      'ru': 'Двойной обман',
      'en': 'Double fake',
    },
    '78w5g8hs': {
      'ru': '80',
      'en': '80',
    },
    'penvl2u6': {
      'ru': 'Важность',
      'en': 'Importance',
    },
    '73wxq0x9': {
      'ru': '65',
      'en': '65',
    },
    'xn1wnhb2': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'v0i84set': {
      'ru': '60',
      'en': '60',
    },
    'g7tsl9ju': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'ix5nuyk7': {
      'ru':
          'Расставь линию из шайб, и тренируй убор под себя, с последующим убором в обратную сторону с неудобной на удобную. Обрати внимание на перенос тела с ноги на ногу, вслед за движением клюшки.',
      'en':
          'Arrange a line of washers, and train the cleaning to suit you, followed by cleaning in the opposite direction from uncomfortable to comfortable. Pay attention to the movement of the body from foot to foot, following the movement of the club.',
    },
    'vzsb339b': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'czoabfgo': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '97u8nfql': {
      'ru': 'Дриблинг',
      'en': 'Dribbling',
    },
    'nzppoffj': {
      'ru': 'Home',
      'en': '',
    },
  },
  // shootout_datsuyk
  {
    '2wmu3dxk': {
      'ru': 'Буллит Дацюка',
      'en': 'Datsyuk\'s Shootout',
    },
    'c1ytdzi7': {
      'ru': '85',
      'en': '85',
    },
    'jyt8yutb': {
      'ru': 'Эффект',
      'en': 'Effect',
    },
    'zfa3qsfu': {
      'ru': '90',
      'en': '90',
    },
    'uoqdr9ul': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'ds5yd32b': {
      'ru': '60',
      'en': '60',
    },
    'hhagoqvv': {
      'ru': 'Шанс',
      'en': 'Chance',
    },
    'k26imgwh': {
      'ru':
          'Для успешного выполнения буллита нужно сблизиться с вратарем на выбранной скорости, катясь чуть правее центра, смещаясь налево таким образом, что при начале маневра игрок оказывается прямо напротив вратаря, оставив пространство для маневра. Приблизившись - совершить ложный показ броска в левый угол, вратарь должен поверить и дернутся в левую от бьющего сторону, после чего резко и плавно убрать шайбу под себя на удобную совершив резкое перестроение ног в противоположное направление, и забросить шайбу в пустые ворота.',
      'en':
          'To successfully perform a shootout, you need to close in on the goalkeeper at the chosen speed, skating slightly to the right of center, moving to the left so that when the maneuver begins, the player ends up directly in front of the goalkeeper, leaving room for maneuver. When approaching - make a false display of a throw to the left corner, the goalkeeper must believe and jerk to the left of the kicker, then sharply and smoothly remove the puck under himself to a comfortable position, making a sharp adjustment of his legs in the opposite direction, and throw the puck into the empty net.',
    },
    'ux9ehpam': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'd34ls4ri': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'kaq2j9pa': {
      'ru': 'Буллиты',
      'en': 'Shootouts',
    },
    '5dws9bhi': {
      'ru': 'Home',
      'en': '',
    },
  },
  // shootout_zaripov
  {
    '9trk7f32': {
      'ru': 'Буллит Зарипова',
      'en': 'Zaripov\'s shootout',
    },
    'lp32n1o9': {
      'ru': '65',
      'en': '65',
    },
    '5xszf66r': {
      'ru': 'Эффект',
      'en': 'Effect',
    },
    'bs8vk1ky': {
      'ru': '70',
      'en': '70',
    },
    'lfkfpqwu': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    '5qzkehnd': {
      'ru': '85',
      'en': '85',
    },
    'w59t53y5': {
      'ru': 'Шанс',
      'en': 'Chance',
    },
    'ioqfmljt': {
      'ru':
          'Для успешного выполнения буллита нужно сблизиться с вратарем на выбранной скорости с левой стороны площадки (для леворукого хоккеиста) практически не оставив пространства для маневра. Приблизившись - совершить ложный показ броска, вратарь должен поверить и остановиться - после чего произвести бросок между опорной ногой и клюшкой если видно, что вратарь не ожидает этого; если ожидает, то прокатиться параллельно воротам и совершить бросок в треугольник между щитками и блином (в подмышку); либо резко убрать под себя и завести шайбу с неудобной руки в дальний угол ворот. Выбирать варинат реализации нужно оценивая позицию вратаря и общую сложившуюся ситуацию.',
      'en':
          'To successfully execute a shootout, you need to approach the goalkeeper at a selected speed from the left side of the ice (for a left-handed hockey player), leaving virtually no room for maneuver. When approaching - make a false display of a throw, the goalkeeper must believe and stop - then make a throw between the supporting leg and the stick if it is clear that the goalkeeper is not expecting this; if he expects, then skate parallel to the goal and make a throw into the triangle between the pads and the pancake (in the armpit); or sharply move the puck under you and move the puck from your awkward hand into the far corner of the goal. You need to choose an implementation option by assessing the goalkeeper’s position and the overall current situation.',
    },
    'rnzfjtej': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'jcmm759g': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'cbozocnd': {
      'ru': 'Буллиты',
      'en': 'Shootouts',
    },
    'wrfkyv44': {
      'ru': 'Home',
      'en': '',
    },
  },
  // shootout_backhand
  {
    'fdhdpavi': {
      'ru': 'Буллит c неудобной',
      'en': 'Backhand shootout',
    },
    '7ujk8drw': {
      'ru': '65',
      'en': '65',
    },
    'rbwwagsx': {
      'ru': 'Эффект',
      'en': 'Effect',
    },
    'ep7ocz7b': {
      'ru': '65',
      'en': '65',
    },
    'x73llbzu': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'vxwmnil1': {
      'ru': '70',
      'en': '70',
    },
    'xoranezt': {
      'ru': 'Шанс',
      'en': 'Chance',
    },
    '9nvk1t07': {
      'ru':
          'Для успешного выполнения буллита нужно сблизиться с вратарем на выбранной скорости  и направлении, оставив небольшое пространство для маневра. Приблизившись - совершить ложный показ броска, вратарь должен поверить и остановиться, после чего резко убрать шайбу под себя на неудобную (из упражнения восьмерка) и в зависимости от ситуации либо перекинуть щиток вратаря, либо завести шайбу в пустой угол ворот.',
      'en':
          'To successfully execute a shootout, you need to close with the goalkeeper at the chosen speed and direction, leaving a little room for maneuver. When approaching - make a false display of a throw, the goalkeeper must believe and stop, after which he sharply removes the puck under himself on an inconvenient one (from exercise eight) and, depending on the situation, either throws the goalkeeper\'s pad over or takes the puck into an empty corner of the goal.',
    },
    'vb2e5fzy': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '9f756lrd': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '4gkh0k9b': {
      'ru': 'Буллиты',
      'en': 'Shootouts',
    },
    'cvglprt4': {
      'ru': 'Home',
      'en': '',
    },
  },
  // shootouts
  {
    '09kyn7o6': {
      'ru': 'Буллит с неудобной',
      'en': 'Shootout backhand',
    },
    'ohlw03ud': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'o6iyuu6n': {
      'ru': '4.6',
      'en': '4.4',
    },
    'bv501lq4': {
      'ru': 'Буллит в домик',
      'en': 'Shootout in the lodge',
    },
    'knylipc4': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    '5upmpuz3': {
      'ru': '4.6',
      'en': '4.4',
    },
    '82pheksp': {
      'ru': 'Буллит броском',
      'en': 'QuickShoot',
    },
    'whwst534': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'w831hte3': {
      'ru': '4.5',
      'en': '4.4',
    },
    'pb4abe0r': {
      'ru': 'Буллит одной рукой',
      'en': 'One hand shootout',
    },
    'q24e6jd2': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'z94zx9ap': {
      'ru': '4.7',
      'en': '4.4',
    },
    'cj2zwbce': {
      'ru': 'Буллит Дацюка',
      'en': 'Shootout Datsyuk',
    },
    'ttegkj8u': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    'wtc7wkbq': {
      'ru': '4.9',
      'en': '4.4',
    },
    'iwx7db04': {
      'ru': 'Буллит Зарипова',
      'en': 'Shootout Zaripov',
    },
    '1ak9ivil': {
      'ru': '+20 очков',
      'en': '+20 points',
    },
    '8fhvpkzs': {
      'ru': '4.9',
      'en': '4.4',
    },
    'enlc1c8n': {
      'ru': 'Буллиты',
      'en': 'Shootouts',
    },
    'w2ufuhjn': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // shootout_quickShot
  {
    'l9azj5il': {
      'ru': 'Буллит Резким броском',
      'en': 'QuickShot shootout',
    },
    '09jpjj15': {
      'ru': '65',
      'en': '65',
    },
    'h15rok6k': {
      'ru': 'Эффект',
      'en': 'Effect',
    },
    'ie9ok5ug': {
      'ru': '65',
      'en': '65',
    },
    '4uc4a970': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'ovep4a5r': {
      'ru': '80',
      'en': '80',
    },
    'hz9x4u6d': {
      'ru': 'Шанс',
      'en': 'Chance',
    },
    'kttrjv12': {
      'ru':
          'Для успешного выполнения буллита нужно сблизиться с вратарем на выбранной скорости оставив небольшое пространство для маневра. Приблизившись - совершить резкий и неожиданный бросок в открытое место (на неудобной высоте над щитком, либо в верхний угол ворот). Вратарь должен ожидать от игрока обыгрыша, или дальнейшего сближения, что игрок и должен обманчиво показывать траекторией и скоростью своего движения.',
      'en':
          'To successfully complete a shootout, you need to get close to the goalkeeper at the selected speed, leaving a little room for maneuver. When approaching, make a sharp and unexpected throw into an open place (at an awkward height above the shield, or into the upper corner of the goal). The goalkeeper must expect the player to beat, or further approach, which the player must deceptively show with the trajectory and speed of his movement.',
    },
    'iuf2hj0p': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'jlt65rio': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'm8ppub3j': {
      'ru': 'Буллиты',
      'en': 'Shootouts',
    },
    'de0n8fi1': {
      'ru': 'Home',
      'en': '',
    },
  },
  // shootout_in_house
  {
    '0aavd1it': {
      'ru': 'Буллит в домик',
      'en': 'Shootout in the house',
    },
    'lp2g8j1u': {
      'ru': '60',
      'en': '60',
    },
    'mn26ugeo': {
      'ru': 'Эффект',
      'en': 'Effect',
    },
    '68bqy41u': {
      'ru': '60',
      'en': '60',
    },
    'x9y6o0k2': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'av77yl7f': {
      'ru': '70',
      'en': '70',
    },
    'v9vhxjtm': {
      'ru': 'Шанс',
      'en': 'Chance',
    },
    '9dz5hfpm': {
      'ru':
          'Для успешного выполнения буллита нужно сблизиться с вратарем на выбранной скорости. Приблизившись - совершить резкий бросок под опорную ногу вратаря в треугольник между крюком его клюшки и опорной ногой. Если все исполнить четко, то вратарь не успеет сесть, и шайба окажется в воротах.',
      'en':
          'To successfully complete a shootout, you need to get close to the goalkeeper at the selected speed. When approaching, make a sharp throw under the goalkeeper\'s supporting leg into the triangle between the hook of his stick and the supporting leg. If everything is done accurately, the goalkeeper will not have time to sit down, and the puck will end up in the goal.',
    },
    'fg9394gu': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    't1f5nczn': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'ccoe03hz': {
      'ru': 'Буллиты',
      'en': 'Shootouts',
    },
    '3l0k76qp': {
      'ru': 'Home',
      'en': '',
    },
  },
  // shootout_oneHand
  {
    'w1rtx06l': {
      'ru': 'Буллит одной рукой',
      'en': 'One hand shootout',
    },
    'a8jgt5na': {
      'ru': '85',
      'en': '85',
    },
    'k7es98yi': {
      'ru': 'Эффект',
      'en': 'Effect',
    },
    '370bvcuz': {
      'ru': '80',
      'en': '80',
    },
    'xt62e7g4': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'y3wniamb': {
      'ru': '65',
      'en': '65',
    },
    '9nl13qb8': {
      'ru': 'Шанс',
      'en': 'Chance',
    },
    '92tt033t': {
      'ru':
          'Для успешного выполнения буллита нужно заехать с правой (для леворукого хоккеиста) стороны, на скорости выше средней, всем видом показывая, что будет выполнен бросок в дальний угол, и двигаясь параллельно воротам в фазе сближения с вратарем произвести ложный бросок, презжая линию центра ворот, после чего резко убрать шайбу под себя на широкую руку, оставив клюшку в одной руке, и завести шайбу в открывшыйся пустой угол. Вратарь должен уеххать вслед за игроком, надеясь успеть перестроиться под  бросок в дальний угол.',
      'en':
          'To successfully perform a shootout, you need to drive in from the right (for a left-handed hockey player) side, at a speed above average, showing with all appearance that a throw will be made to the far corner, and moving parallel to the goal in the phase of approaching the goalkeeper, make a false throw, passing the line of the center of the goal, after which, sharply remove the puck under you with a wide hand, leaving the stick in one hand, and bring the puck into the opened empty corner. The goalkeeper must leave after the player, hoping to have time to adjust for the throw into the far corner.',
    },
    '42y9xfv0': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'xg7wjyd5': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'nrp6nrnq': {
      'ru': 'Буллиты',
      'en': 'Shootouts',
    },
    'ncagh7cn': {
      'ru': 'Home',
      'en': '',
    },
  },
  // edges_complexOne
  {
    'lphzu1d2': {
      'ru': 'Комплекс - Подрезания + Улитка',
      'en': 'Complex - Trimming + Snail',
    },
    '45qg4ouv': {
      'ru': '90',
      'en': '90',
    },
    '9aw9r2kh': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'cikquy5s': {
      'ru': '85',
      'en': '85',
    },
    '3v2hmgc6': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'wsg44nmg': {
      'ru': '85',
      'en': '85',
    },
    'h1lgvft0': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    '86l3u0cl': {
      'ru':
          'Расставь стойки по прямой, с расстоянием 2-3 метра друг от друга. Начни двигаться немного сбоку к первой стойке и выполни на ней подрезание и убор под себя, после чего сделай скрестный шаг укрывая шайбу корпусом (в игре именно так и будет против соперника), затем подъезжая ко второй стойке сделай ложный показ с убором под себя на неудобную и выполни улитку. После этого двигайся к третьей стойке и сделай на ней подрезание, и так на протяжении всей линии. Обрати внимание на то, что после подрезания нужно сильно оттолкнуться дальней ногой и перекинуть ее через сделавшую подрезание в скрестный шаг, чтобы после резкой смены направления задать начальную скорость. И чем сильнее будет толчок, тем выше скорость, и тем легче будет освободить для себя свободное пространство на поле, чтобы принять хорошее решение. ',
      'en':
          'Place the racks in a straight line, with a distance of 2-3 meters from each other. Start moving a little from the side to the first post and make a cut on it and tuck yourself in, then take a cross step covering the puck with your body (in the game this is exactly how it will happen against an opponent), then approaching the second post make a false show and tuck yourself into an inconvenient one. and do the snail. After that, move to the third post and make a cut on it, and so on throughout the entire line. Pay attention to the fact that after cutting, you need to push off strongly with the far leg and throw it over the one who made the cut into a cross step, so that after a sharp change in direction you set the initial speed. And the stronger the push, the higher the speed, and the easier it will be to free up space on the field for yourself to make a good decision.',
    },
    'j5d88k2w': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'e9evtasn': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '80zfd9vo': {
      'ru': 'Грани',
      'en': 'Edges',
    },
    '38muun8f': {
      'ru': 'Home',
      'en': '',
    },
  },
  // edges_SlalomOneLeg
  {
    '5087czno': {
      'ru': 'Слалом на одной ноге',
      'en': 'One leg slalom',
    },
    '1lu4tss7': {
      'ru': '90',
      'en': '90',
    },
    'exdwq8hd': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'd6i6f48p': {
      'ru': '90',
      'en': '90',
    },
    'akgc3gju': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'uyqxaug7': {
      'ru': '90',
      'en': '90',
    },
    '2v93s1in': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'j4nkux13': {
      'ru':
          'Слалом на одной ноге отличается от обычного слалома тем, что все управление скоростью и направлением производится за счет зигзагообразных толчков на одной ноге, вторая же нога остается на весу и отвечает за равновесие. Тебе нужно постоянно сгибать и разгибать ногу, чередуя толчок внешней гранью конька и толчок внутренней гранью, рисуя букву \"S\". Это упражнение позволит тебе отлично прочувствовать управление гранями конька, что впоследствии поможет делать более резкие и неожиданные движения в игре.',
      'en':
          'One-leg slalom differs from regular slalom in that all control of speed and direction is done through zigzag pushes on one leg, while the other leg remains suspended and is responsible for balance. You need to constantly bend and straighten your leg, alternating between pushing with the outer edge of the skate and pushing with the inner edge, drawing the letter “S”. This exercise will allow you to get a great feel for controlling the edges of the skate, which will subsequently help you make sharper and more unexpected movements in the game.',
    },
    '4s8xldvr': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    's3rjbw4n': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '29k7o6q7': {
      'ru': 'Грани',
      'en': 'Edges',
    },
    'cay6vvnu': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Virazhy_complexOne
  {
    'pc0tzy3i': {
      'ru': 'Комплекс - Переход на спину + вираж + ложная улитка',
      'en': 'Complex - Transition to back + turn + false snail',
    },
    'k7hrv69l': {
      'ru': '85',
      'en': '85',
    },
    'neob8o0f': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    '6cb7jpiu': {
      'ru': '85',
      'en': '85',
    },
    'z5g4hvwb': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'gfz4gz6q': {
      'ru': '80',
      'en': '80',
    },
    '52ptcup3': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'mvgvbmyz': {
      'ru':
          'Расставь стойки в виде треугольника, где вершина находится сбоку, а два основания находятся от тебя по прямой. На первой стойке выполни переход на спину и объехав ее по кругу спиной, двигайся к боковой стойке и выполни на ней вираж - переход на лицо, выезжая в сторону третьей стойки. Подъедь к третьей стойке с внешней стороны и заложи корпус для виража вовнутрь, после чего выполни подрезание и вираж в обратную сторону, объезжая треугольник скрестными шагами.',
      'en':
          'Arrange the racks in the form of a triangle, where the top is on the side and the two bases are in a straight line from you. At the first stand, perform a transition to your back and, having driven around it in a circle with your back, move to the side stand and perform a turn on it - transition to your face, moving towards the third stand. Approach the third post from the outside and lay the body for the turn inward, then cut and turn in the opposite direction, going around the triangle with cross steps.',
    },
    'iv6gh5p1': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'q8vc0cgg': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '1fwrhl4x': {
      'ru': 'Виражи',
      'en': 'Turns',
    },
    'we3midze': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Ships_Triangle
  {
    'pr39wz87': {
      'ru': 'Кораблики в треугольнике 1',
      'en': 'Ships in triangle 1',
    },
    '47rnjtyw': {
      'ru': '85',
      'en': '85',
    },
    'iof0ncer': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'qlfcv0vc': {
      'ru': '80',
      'en': '80',
    },
    'lyk22i07': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'cqi6k67u': {
      'ru': '85',
      'en': '85',
    },
    'hi84bvbn': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    '1mukn0pe': {
      'ru':
          'Расставь три стойки в виде равнобедренного треугольника, расстояние между стойками 2-3 метра, и начинай двигаться от вершины к одной из точек оснавания контролируя шайбу. Подъехав изнутри сделай вираж в кораблике одновременно убирая шайбу ближе к конькам сохраняя контроль, после чего объехай стойку вершины и повтори тоже самое на другой стойке основания с другой стороны, и снова через вершину едь к первой стойке основания, закольцовывая упражнение. Постарайся не опускать голову под ноги, а смотреть по сторонам во время выполнения упражнения, это поможет лучше оценивать и контролировать игровые ситуации.',
      'en':
          'Arrange three racks in the form of an isosceles triangle, the distance between the racks is 2-3 meters, and start moving from the top to one of the base points, controlling the puck. Having approached from the inside, make a turn in a boat at the same time removing the puck closer to the skates while maintaining control, then go around the apex post and repeat the same thing on the other base post on the other side, and again go through the top to the first base post, looping the exercise. Try not to put your head under your feet, but look around while performing the exercise, this will help you better assess and control game situations.',
    },
    'nmgpms1n': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    '8hqkvpqk': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '2cychwj2': {
      'ru': 'Кораблики',
      'en': 'Ships',
    },
    'npj13zu0': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Ships_TriangleTwo
  {
    '3pw6b67d': {
      'ru': 'Кораблики в треугольнике 2',
      'en': 'Ships in triangle 2',
    },
    '2pghqote': {
      'ru': '85',
      'en': '85',
    },
    '3jzjv16y': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'z22w7wvo': {
      'ru': '80',
      'en': '80',
    },
    '3fje3dzq': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'ptfzb8yt': {
      'ru': '85',
      'en': '85',
    },
    's4vehwlm': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'af3qp2qh': {
      'ru':
          'Расставь три стойки в виде равнобедренного треугольника, расстояние между стойками 2-3 метра, и начинай двигатьсяв кораблике от одной из точек оснавания к вершине, контролируя шайбу. Подъехав изнутри, сделай улитку в кораблике, одновременно убирая шайбу ближе к конькам, сохраняя контроль. После чего кати на одну из стоек основания и сделай вираж в кораблике с внешней стороны треугольника продолжая движение ко второй стойке основания, и выполни на ней вираж в кораблике изнутри, чтобы траектория построилась снова к стойке вершины. Постарайся не опускать голову под ноги, а смотреть по сторонам, это поможет лучше оценивать и контролировать игровые ситуации.',
      'en':
          'Arrange three racks in the form of an isosceles triangle, the distance between the racks is 2-3 meters, and start moving in the boat from one of the base points to the top, controlling the puck. Approaching from the inside, make a snail in a boat, while simultaneously moving the puck closer to the skates, maintaining control. Then roll onto one of the base posts and make a boat turn from the outside of the triangle, continuing to move to the second base post, and make a boat turn on it from the inside so that the trajectory is built again to the apex post. Try not to put your head under your feet, but look around, this will help you better assess and control game situations.',
    },
    'md3lh6rs': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'qbd5ebf3': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    '69aakq6u': {
      'ru': 'Кораблики',
      'en': 'Ships',
    },
    '57hjel34': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Ships_Christ
  {
    'oxiqi8ku': {
      'ru': 'Кораблики в кресте',
      'en': 'Ships in the cross',
    },
    'ry02tcdt': {
      'ru': '75',
      'en': '75',
    },
    'vstuil35': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    'bo077tmo': {
      'ru': '80',
      'en': '80',
    },
    'cwzzynae': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'xnipklse': {
      'ru': '85',
      'en': '85',
    },
    't4lg7nmj': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'u65hz44k': {
      'ru':
          'Расставь пять стоек в форме креста, в 2-3 метрах друг от друга. Начинай с нижней точки и двигайся к центру, на центральной точке сделай вираж на кораблике к правой точке, доехав до правой точки, вернись корабликом к центральной и поверни направо к верхней точке, от нее заверни к центральной, от центральной, снова направо к левой стойке, снова к центральной точке, и последним на подходе виражом в кораблике вернись к изначальной точке. Чередуй кораблики на стойках - с левой и правой стороны, и старайся выполнять все упражнение в посадке, не выпрямляясь и исключительно в корабликах, никаких лишних шагов.',
      'en':
          'Arrange five racks in the shape of a cross, 2-3 meters from each other. Start from the bottom point and move towards the center, at the central point make a turn on the boat to the right point, having reached the right point, return by boat to the central one and turn right to the top point, from there turn to the central one, from the central one, right again to the left post , again to the central point, and with the last turn on the approach in the boat, return to the original point. Alternate the boats on the racks - on the left and right sides, and try to perform the entire exercise in landing, without straightening up and exclusively in the boats, no extra steps.',
    },
    'v54kfhx5': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'edhsiwsh': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'zx38t8r2': {
      'ru': 'Кораблики',
      'en': 'Ships',
    },
    'arwj0dza': {
      'ru': 'Home',
      'en': '',
    },
  },
  // progress
  {
    '4qo8w7hl': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'cu1tvcyy': {
      'ru': 'Достижения',
      'en': 'Achievements',
    },
    'jz880luv': {
      'ru': 'All-Star Account',
      'en': 'All-Star Account',
    },
    'ucbp0boh': {
      'ru': 'Зарегистрируйся в приложении ',
      'en': 'Register in the application',
    },
    'w5g0116s': {
      'ru': 'Часть команды',
      'en': 'Part of the team',
    },
    'uhvkvwnk': {
      'ru': 'Успешно пройди блок упражнений на технику рук',
      'en': 'Successfully complete a block of hand technique exercises',
    },
    'h0gi2hte': {
      'ru': 'Руки Мидаса',
      'en': 'Hands of Midas',
    },
    '9yt1bkn7': {
      'ru': 'Успешно пройди блок упражнений на технику бросков',
      'en': 'Successfully complete a block of shoot technique exercises',
    },
    'riq1k5dp': {
      'ru': 'Снайпер',
      'en': 'Sniper',
    },
    '2s86bjar': {
      'ru': 'Успешно пройди блок упражнений на технику катания',
      'en': 'Successfully complete a block of skate technique exercises',
    },
    'az2rwn4z': {
      'ru': 'Катающийся',
      'en': 'Skater',
    },
    'ojfxmszm': {
      'ru': 'Успешно пройди блок упражнений на технику буллитов',
      'en': 'Successfully complete a block of shootout technique exercises',
    },
    '9cl02g0n': {
      'ru': 'Буллитёр',
      'en': 'Maestro',
    },
    'os695e59': {
      'ru': 'Прочитай все лекции о здоровье',
      'en': 'Read all health lectures',
    },
    'nq1vsbl9': {
      'ru': 'Бык',
      'en': 'Bull',
    },
    '3nrnm31x': {
      'ru': 'Успешно пройди блок упражнений на развитие силы',
      'en': 'Successfully complete a block of exercises to up your strength',
    },
    'ym7c8wlk': {
      'ru': 'Сильный',
      'en': 'Strong',
    },
    '3e6a9owv': {
      'ru': 'Успешно пройди блок упражнений на развитие баланса',
      'en': 'Successfully complete a block of exercises to up your balance',
    },
    '5ck7eje3': {
      'ru': 'Устойчивый',
      'en': 'Stable',
    },
    '348sm8fr': {
      'ru': 'Успешно пройди блок упражнений на развитие ловкости',
      'en': 'Successfully complete a block of agility exercises',
    },
    'ng3qdcbe': {
      'ru': 'Ловкий',
      'en': 'Nimble',
    },
    'ild3bcwm': {
      'ru': 'Успешно пройди блок упражнений на развитие выносливости',
      'en': 'Successfully complete a block of exercises to up your endurance',
    },
    '25ih25aq': {
      'ru': 'Выносливый',
      'en': 'Hardy',
    },
    'tvkbmnct': {
      'ru': 'Успешно пройди блок упражнений на развитие мощности',
      'en': 'Successfully complete a block of power development exercises',
    },
    'ohlryghd': {
      'ru': 'Мощный',
      'en': 'Powerful',
    },
    '3xn3ru9g': {
      'ru': 'Успешно пройди блок упражнений на развитие скорости',
      'en': 'Successfully complete a block of speed development exercises',
    },
    'bekmlos6': {
      'ru': 'Скоростной',
      'en': 'Fastest',
    },
    'i0vj34wd': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // speed_halfJump
  {
    '1asccyar': {
      'ru': 'Прыжки в полуприседе',
      'en': 'Half squat jumps',
    },
    'wltmjj5p': {
      'ru': '75',
      'en': '75',
    },
    'miikgtf5': {
      'ru': 'Ловкость',
      'en': 'Dexterity',
    },
    '1f0zj4jz': {
      'ru': '75',
      'en': '75',
    },
    '155xbwzg': {
      'ru': 'Мощность',
      'en': 'Power',
    },
    '83gaap8y': {
      'ru': '80',
      'en': '80',
    },
    '9ycyulpm': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'bvr33imm': {
      'ru':
          'Для развития силы с помощью упражнения прыжки в полуприседе, сядь в хоккейную стойку, ноги вместе и выпрыгни вверх из этого положения, в воздухе расставь ноги и приземлись уже в широкий полуприсед, из которого сразу же выпрыгни, сводя в воздухе ноги и приземляясь в полуприсед ноги вместе. Продолжай выполнение упражнения чередуя полуприсед со сведенными и широко расставленными ногами, развивая толчковую мощность, необходимую для быстрого перемещения на льду.',
      'en':
          'To develop strength using the half-squat jumping exercise, sit in a hockey stance with your feet together and jump up from this position, spread your legs in the air and land in a wide half-squat, from which you immediately jump, bringing your legs together in the air and landing in a half-squat with your legs together. Continue the exercise by alternating a half-squat with your legs together and with your legs wide apart, developing the pushing power necessary to move quickly on the ice.',
    },
    '934t7rl6': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'oa8joca5': {
      'ru': 'Скорость',
      'en': 'Speed',
    },
    'g7qnx9jd': {
      'ru': 'Home',
      'en': '',
    },
  },
  // shooting_FromMyselfOutself
  {
    '6qvsa7i0': {
      'ru': 'Бросок после ложного убора под себя',
      'en': 'Shoot after fake underself',
    },
    '72xtai5v': {
      'ru': '90',
      'en': '90',
    },
    '7fcm7jmx': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'ztlia96n': {
      'ru': '75',
      'en': '75',
    },
    'mtpzwzhb': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    '4cvrpnxw': {
      'ru': '80',
      'en': '80',
    },
    'iokhik0u': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'zwwmtd8x': {
      'ru':
          'Установи на своем пути к воротам препятствие.  Сделай ложный убор шайбы под себя обыгрывая препятствие и быстрым движением шайбы от себя, вернись в обратное положение освободив себе пространство, после чего прицельного брось по воротам. Это особенно полезно при выходах 1 на 1 с защитником. Когда только он отделяет тебя от очной встречи с вратарем.',
      'en':
          'Place an obstacle on your way to the gate. Make a false move of the puck under yourself, beating the obstacle and quickly moving the puck away from you, return to the opposite position, freeing up space for yourself, and then shoot at the goal. This is especially useful in 1v1 situations with a defender. When only he separates you from a face-to-face meeting with the goalkeeper.',
    },
    'fqwnj796': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'wk7pxknf': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'o1votnp7': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'a3gk00in': {
      'ru': 'Home',
      'en': '',
    },
  },
  // shooting_FromOneLegOnPlatormSide
  {
    'zsri0mfz': {
      'ru': 'Бросок с одной ноги, вторая - сбоку на платформе',
      'en': 'Shoot from one leg, the other - from the side on the platform',
    },
    'mjesbsa1': {
      'ru': '70',
      'en': '70',
    },
    '355ksego': {
      'ru': 'Техника',
      'en': 'Technique',
    },
    'zj45yehw': {
      'ru': '75',
      'en': '75',
    },
    'y023lldh': {
      'ru': 'Бросок',
      'en': 'Shooting',
    },
    'ztyfly8p': {
      'ru': '70',
      'en': '70',
    },
    'qc8vli10': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'w5932084': {
      'ru':
          'Для этого упражнения требуется вспомогательная платформа, по примеру скамейки. Установи согнутую в колене ногу на платформу, закрепившись в статическом положении второй ногой. Совершай броски из этого положения, стараясь не совершать разворотов туловища, и не нарушая баланса.',
      'en':
          'This exercise requires a support platform, similar to a bench. Place your leg bent at the knee on the platform, securing yourself in a static position with your other leg. Make throws from this position, trying not to turn your body, and without breaking your balance.',
    },
    'muiarjeb': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'pxzmcwul': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'yt33q561': {
      'ru': 'Броски',
      'en': 'Shooting',
    },
    'rb0yuexb': {
      'ru': 'Home',
      'en': '',
    },
  },
  // BTOF_onBack
  {
    'qgqxtz6h': {
      'ru': 'Переход на спину',
      'en': 'Switch to back',
    },
    '6kkgficv': {
      'ru': '80',
      'en': '80',
    },
    'uqnmsl4r': {
      'ru': 'Баланс',
      'en': 'Balance',
    },
    's3v7b5y0': {
      'ru': '80',
      'en': '80',
    },
    'rgeuefrb': {
      'ru': 'Катание',
      'en': 'Skating',
    },
    'g10yxnjs': {
      'ru': '75',
      'en': '75',
    },
    'ghzqv14f': {
      'ru': 'Сложность',
      'en': 'Complexity',
    },
    'e6p2r03l': {
      'ru':
          'Для выполнения этого элемента, поставь две стойки на расстоянии 4-5 метров друг от друга, начинай катить от одной стойки к другой с небольшого подката из выбранной стороны. Приблизившись к стойке, сделай вираж и когда твои ноги окажутся на одной линии с центром стойки, резко поверни их в обратную от виража сторону, перейдя на катание спиной вперед продолжай движение в заданном направлении. После перехода на спину, сделай два шага назад и через половину улитки выполни разворот на лицо, двигаясь в сторону второй стойки, повтори тоже самое на второй стойке, закатываясь с другой стороны. \n\nОбрати внимание чтобы при переходах - плечи оставались в одной плоскости, не подскакивая вверх-вниз, регулируй этот момент за счет посадки и техники катания.',
      'en':
          'To perform this element, place two racks at a distance of 4-5 meters from each other, start rolling from one rack to the other with a small roll from the selected side. Approaching the stand, make a turn and when your legs are in line with the center of the stand, sharply turn them in the opposite direction from the turn, switching to skating backwards and continue moving in the given direction. After switching to your back, take two steps back and through half a snail, perform a turn on your face, moving towards the second stand, repeat the same on the second stand, rolling up on the other side.\n\nPay attention that during transitions, your shoulders remain in the same plane, without jumping up and down, regulate this moment through your landing and skating technique.',
    },
    '7tdxv7z0': {
      'ru': 'Прогресс',
      'en': 'Progress',
    },
    'u8viunoc': {
      'ru': 'Записать',
      'en': 'Confirm',
    },
    'evi9xcr3': {
      'ru': 'Грани',
      'en': 'Edges',
    },
    '3o3t804i': {
      'ru': 'Home',
      'en': '',
    },
  },
  // changeProfile
  {
    'i6akb7yf': {
      'ru': '#',
      'en': '#',
    },
    '2i1yh4vt': {
      'ru': '',
      'en': '#',
    },
    'pyngadkb': {
      'ru': 'Будь Лучшим !',
      'en': 'Be the best !',
    },
    'gp1vvjo8': {
      'ru': 'имя',
      'en': 'Name',
    },
    'ed7xtb0w': {
      'ru': 'текущая команда',
      'en': 'current team',
    },
    '44c5mlfd': {
      'ru': 'Сохранить',
      'en': 'Save',
    },
    'iw1wn7s8': {
      'ru': 'Be Pro',
      'en': 'Be Pro',
    },
    '7jlj1kbe': {
      'ru': 'Home',
      'en': 'Home',
    },
  },
  // HomePage
  {
    '3o95m598': {
      'ru': 'bais.lisbreu@gmail.com',
      'en': 'bais.lisbreu@gmail.com',
    },
    '8b7ew0z5': {
      'ru': 'Home',
      'en': '',
    },
  },
  // Action2SheetSimple
  {
    'yvt7zby0': {
      'ru': 'Русский',
      'en': 'Russian',
    },
    'b6j6il89': {
      'ru': 'Английский',
      'en': 'English',
    },
  },
  // Miscellaneous
  {
    '2daqgh7v': {
      'ru': '',
      'en': '',
    },
    'aothebft': {
      'ru': '',
      'en': '',
    },
    '7r0cznzu': {
      'ru': '',
      'en': '',
    },
    'qt77jgzf': {
      'ru': '',
      'en': '',
    },
    'jepd6td7': {
      'ru': '',
      'en': '',
    },
    '3nx252aa': {
      'ru': '',
      'en': '',
    },
    'wmaquzjz': {
      'ru': '',
      'en': '',
    },
    'sk5fzmo2': {
      'ru': '',
      'en': '',
    },
    'pfx8xc6y': {
      'ru': '',
      'en': '',
    },
    '8q2gckal': {
      'ru': '',
      'en': '',
    },
    '8lak4xj6': {
      'ru': '',
      'en': '',
    },
    'ie3h958v': {
      'ru': '',
      'en': '',
    },
    'lcgkg2cm': {
      'ru': '',
      'en': '',
    },
    'emiqg01e': {
      'ru': '',
      'en': '',
    },
    'qxjw2egl': {
      'ru': '',
      'en': '',
    },
    '8vancrfq': {
      'ru': '',
      'en': '',
    },
    '19fqfdof': {
      'ru': '',
      'en': '',
    },
    'n1noqb7v': {
      'ru': '',
      'en': '',
    },
    '6diofpmq': {
      'ru': '',
      'en': '',
    },
    'tarykhyv': {
      'ru': '',
      'en': '',
    },
    'xmaqikoy': {
      'ru': '',
      'en': '',
    },
    '6eoep6ad': {
      'ru': '',
      'en': '',
    },
    'fpncdfz0': {
      'ru': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
