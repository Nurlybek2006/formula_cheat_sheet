import 'package:flutter/widgets.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
        AppLocalizations(const Locale('kk'));
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    delegate,
  ];

  static const List<Locale> supportedLocales = [
    Locale('kk'),
    Locale('ru'),
    Locale('en'),
  ];

  String _t(String key) =>
      _strings[locale.languageCode]?[key] ??
      _strings['kk']![key] ??
      key;

  // ── App ──────────────────────────────────────────────────────────────────
  String get appName => _t('appName');

  // ── Navigation ───────────────────────────────────────────────────────────
  String get navHome => _t('navHome');
  String get navSubjects => _t('navSubjects');
  String get navFavorites => _t('navFavorites');
  String get navQuiz => _t('navQuiz');
  String get navSettings => _t('navSettings');

  // ── Home screen ──────────────────────────────────────────────────────────
  String get formulaOfDay => _t('formulaOfDay');
  String get recentFormulas => _t('recentFormulas');
  String get noRecentFormulas => _t('noRecentFormulas');
  String get seeAll => _t('seeAll');

  // ── Subjects ─────────────────────────────────────────────────────────────
  String get mathematics => _t('mathematics');
  String get physics => _t('physics');
  String get computerScience => _t('computerScience');
  String get selectSubject => _t('selectSubject');

  // ── Topics ───────────────────────────────────────────────────────────────
  String get topicsTitle => _t('topicsTitle');
  String get formulasTitle => _t('formulasTitle');

  // ── Formula list ─────────────────────────────────────────────────────────
  String get searchHint => _t('searchHint');
  String get filterTitle => _t('filterTitle');
  String get clearFilter => _t('clearFilter');
  String get allSubjects => _t('allSubjects');
  String get allTopics => _t('allTopics');
  String get difficulty => _t('difficulty');
  String get difficultyAll => _t('difficultyAll');
  String get easy => _t('easy');
  String get medium => _t('medium');
  String get hard => _t('hard');
  String get noFormulas => _t('noFormulas');
  String formulaCount(int n) => '$n ${_t('formulaWord')}';

  // ── Formula detail ───────────────────────────────────────────────────────
  String get explanation => _t('explanation');
  String get variablesDictionary => _t('variablesDictionary');
  String get exampleTitle => _t('exampleTitle');
  String get solutionSteps => _t('solutionSteps');
  String get addFavorite => _t('addFavorite');
  String get removeFavorite => _t('removeFavorite');
  String get shareFormula => _t('shareFormula');
  String get views => _t('views');

  // ── Favorites ────────────────────────────────────────────────────────────
  String get noFavorites => _t('noFavorites');
  String get noFavoritesDesc => _t('noFavoritesDesc');

  // ── Quiz ─────────────────────────────────────────────────────────────────
  String get quizTitle => _t('quizTitle');
  String get mode1Title => _t('mode1Title');
  String get mode2Title => _t('mode2Title');
  String get mode1Desc => _t('mode1Desc');
  String get mode2Desc => _t('mode2Desc');
  String get startQuiz => _t('startQuiz');
  String get nextQuestion => _t('nextQuestion');
  String get correctAnswer => _t('correctAnswer');
  String get wrongAnswer => _t('wrongAnswer');
  String get quizResults => _t('quizResults');
  String get correctAnswers => _t('correctAnswers');
  String get wrongAnswers => _t('wrongAnswers');
  String get retry => _t('retry');
  String get finish => _t('finish');
  String get quizComplete => _t('quizComplete');
  String get yourScore => _t('yourScore');
  String get questionLabel => _t('questionLabel');
  String get ofLabel => _t('ofLabel');
  String get selectAnswer => _t('selectAnswer');

  // ── Search ───────────────────────────────────────────────────────────────
  String get searchTitle => _t('searchTitle');
  String get noResults => _t('noResults');
  String get noResultsDesc => _t('noResultsDesc');

  // ── Settings ─────────────────────────────────────────────────────────────
  String get settingsTitle => _t('settingsTitle');
  String get themeSection => _t('themeSection');
  String get darkMode => _t('darkMode');
  String get lightMode => _t('lightMode');
  String get systemTheme => _t('systemTheme');
  String get languageSection => _t('languageSection');
  String get kazakh => _t('kazakh');
  String get russian => _t('russian');
  String get english => _t('english');
  String get notificationsSection => _t('notificationsSection');
  String get notificationsEnabled => _t('notificationsEnabled');
  String get notificationTime => _t('notificationTime');
  String get appInfoSection => _t('appInfoSection');
  String get version => _t('version');

  // ── Difficulty labels ────────────────────────────────────────────────────
  String difficultyLabel(int d) {
    switch (d) {
      case 1:
        return easy;
      case 2:
        return medium;
      case 3:
        return hard;
      default:
        return '';
    }
  }

  // =========================================================================
  //  String tables
  // =========================================================================
  static const Map<String, Map<String, String>> _strings = {
    // ── Kazakh ──────────────────────────────────────────────────────────────
    'kk': {
      'appName': 'Формулалар анықтамалығы',
      'navHome': 'Басты бет',
      'navSubjects': 'Пәндер',
      'navFavorites': 'Таңдаулылар',
      'navQuiz': 'Сынақ',
      'navSettings': 'Параметрлер',
      'formulaOfDay': 'Күннің формуласы',
      'recentFormulas': 'Соңғы қаралған',
      'noRecentFormulas': 'Әлі ешқандай формула қаралмаған',
      'seeAll': 'Барлығын көру',
      'mathematics': 'Математика',
      'physics': 'Физика',
      'computerScience': 'Информатика',
      'selectSubject': 'Пәнді таңда',
      'topicsTitle': 'Тақырыптар',
      'formulasTitle': 'Формулалар',
      'searchHint': 'Формулаларды іздеу...',
      'filterTitle': 'Сүзгі',
      'clearFilter': 'Сүзгіні тазалау',
      'allSubjects': 'Барлық пәндер',
      'allTopics': 'Барлық тақырыптар',
      'difficulty': 'Қиындық деңгейі',
      'difficultyAll': 'Барлық деңгейлер',
      'easy': 'Оңай',
      'medium': 'Орташа',
      'hard': 'Қиын',
      'noFormulas': 'Формулалар табылмады',
      'formulaWord': 'формула',
      'explanation': 'Түсінік',
      'variablesDictionary': 'Айнымалылар сөздігі',
      'exampleTitle': 'Мысал',
      'solutionSteps': 'Шешімі',
      'addFavorite': 'Таңдаулыларға қосу',
      'removeFavorite': 'Таңдаулылардан алып тастау',
      'shareFormula': 'Бөлісу',
      'views': 'қаралым',
      'noFavorites': 'Таңдаулы формулалар жоқ',
      'noFavoritesDesc':
          'Формулаларды жұлдызша белгісін басу арқылы таңдаулыларға қосыңыз',
      'quizTitle': 'Сынақ',
      'mode1Title': '1-режим: Атауы → Формула',
      'mode2Title': '2-режим: Формула → Атауы',
      'mode1Desc':
          'Формуланың атауы берілген — дұрыс формуланы дұрыс жауапты таңда',
      'mode2Desc':
          'Формула берілген — ол не үшін қолданылатынын дұрыс жауапты таңда',
      'startQuiz': 'Сынақты бастау',
      'nextQuestion': 'Келесі сұрақ',
      'correctAnswer': 'Дұрыс!',
      'wrongAnswer': 'Дұрыс емес!',
      'quizResults': 'Сынақ нәтижесі',
      'correctAnswers': 'Дұрыс жауаптар',
      'wrongAnswers': 'Қате жауаптар',
      'retry': 'Қайтадан',
      'finish': 'Аяқтау',
      'quizComplete': 'Сынақ аяқталды!',
      'yourScore': 'Сіздің нәтижеңіз',
      'questionLabel': 'Сұрақ',
      'ofLabel': '-дан',
      'selectAnswer': 'Жауапты таңда',
      'searchTitle': 'Іздеу',
      'noResults': 'Ештеңе табылмады',
      'noResultsDesc': 'Басқа кілт сөзбен қайталап көріңіз',
      'settingsTitle': 'Параметрлер',
      'themeSection': 'Тема',
      'darkMode': 'Күңгірт тема',
      'lightMode': 'Ашық тема',
      'systemTheme': 'Жүйелік тема',
      'languageSection': 'Тіл',
      'kazakh': 'Қазақша',
      'russian': 'Орысша',
      'english': 'Ағылшынша',
      'notificationsSection': 'Хабарландырулар',
      'notificationsEnabled': 'Күннің формуласы',
      'notificationTime': 'Хабарландыру уақыты',
      'appInfoSection': 'Қолданба туралы',
      'version': 'Нұсқа: 1.0.0',
    },
    // ── Russian ──────────────────────────────────────────────────────────────
    'ru': {
      'appName': 'Шпаргалка формул',
      'navHome': 'Главная',
      'navSubjects': 'Предметы',
      'navFavorites': 'Избранное',
      'navQuiz': 'Тест',
      'navSettings': 'Настройки',
      'formulaOfDay': 'Формула дня',
      'recentFormulas': 'Недавно просмотренные',
      'noRecentFormulas': 'Ни одной формулы ещё не просмотрено',
      'seeAll': 'Смотреть все',
      'mathematics': 'Математика',
      'physics': 'Физика',
      'computerScience': 'Информатика',
      'selectSubject': 'Выбрать предмет',
      'topicsTitle': 'Темы',
      'formulasTitle': 'Формулы',
      'searchHint': 'Поиск формул...',
      'filterTitle': 'Фильтр',
      'clearFilter': 'Сбросить фильтр',
      'allSubjects': 'Все предметы',
      'allTopics': 'Все темы',
      'difficulty': 'Сложность',
      'difficultyAll': 'Все уровни',
      'easy': 'Лёгко',
      'medium': 'Средне',
      'hard': 'Сложно',
      'noFormulas': 'Формулы не найдены',
      'formulaWord': 'формула',
      'explanation': 'Объяснение',
      'variablesDictionary': 'Словарь переменных',
      'exampleTitle': 'Пример',
      'solutionSteps': 'Решение',
      'addFavorite': 'Добавить в избранное',
      'removeFavorite': 'Убрать из избранного',
      'shareFormula': 'Поделиться',
      'views': 'просмотров',
      'noFavorites': 'Нет избранных формул',
      'noFavoritesDesc':
          'Добавляйте формулы в избранное, нажав на звёздочку',
      'quizTitle': 'Тест',
      'mode1Title': 'Режим 1: Название → Формула',
      'mode2Title': 'Режим 2: Формула → Название',
      'mode1Desc':
          'Дано название формулы — выберите правильную формулу',
      'mode2Desc':
          'Дана формула — выберите правильное название',
      'startQuiz': 'Начать тест',
      'nextQuestion': 'Следующий вопрос',
      'correctAnswer': 'Правильно!',
      'wrongAnswer': 'Неправильно!',
      'quizResults': 'Результаты теста',
      'correctAnswers': 'Правильные ответы',
      'wrongAnswers': 'Ошибки',
      'retry': 'Повторить',
      'finish': 'Завершить',
      'quizComplete': 'Тест завершён!',
      'yourScore': 'Ваш результат',
      'questionLabel': 'Вопрос',
      'ofLabel': 'из',
      'selectAnswer': 'Выберите ответ',
      'searchTitle': 'Поиск',
      'noResults': 'Ничего не найдено',
      'noResultsDesc': 'Попробуйте другое ключевое слово',
      'settingsTitle': 'Настройки',
      'themeSection': 'Тема',
      'darkMode': 'Тёмная тема',
      'lightMode': 'Светлая тема',
      'systemTheme': 'Системная тема',
      'languageSection': 'Язык',
      'kazakh': 'Казахский',
      'russian': 'Русский',
      'english': 'Английский',
      'notificationsSection': 'Уведомления',
      'notificationsEnabled': 'Формула дня',
      'notificationTime': 'Время уведомления',
      'appInfoSection': 'О приложении',
      'version': 'Версия: 1.0.0',
    },
    // ── English ──────────────────────────────────────────────────────────────
    'en': {
      'appName': 'Formula Cheat Sheet',
      'navHome': 'Home',
      'navSubjects': 'Subjects',
      'navFavorites': 'Favorites',
      'navQuiz': 'Quiz',
      'navSettings': 'Settings',
      'formulaOfDay': 'Formula of the Day',
      'recentFormulas': 'Recently Viewed',
      'noRecentFormulas': 'No formulas viewed yet',
      'seeAll': 'See All',
      'mathematics': 'Mathematics',
      'physics': 'Physics',
      'computerScience': 'Computer Science',
      'selectSubject': 'Select Subject',
      'topicsTitle': 'Topics',
      'formulasTitle': 'Formulas',
      'searchHint': 'Search formulas...',
      'filterTitle': 'Filter',
      'clearFilter': 'Clear Filter',
      'allSubjects': 'All Subjects',
      'allTopics': 'All Topics',
      'difficulty': 'Difficulty',
      'difficultyAll': 'All Levels',
      'easy': 'Easy',
      'medium': 'Medium',
      'hard': 'Hard',
      'noFormulas': 'No formulas found',
      'formulaWord': 'formulas',
      'explanation': 'Explanation',
      'variablesDictionary': 'Variables Dictionary',
      'exampleTitle': 'Example',
      'solutionSteps': 'Solution',
      'addFavorite': 'Add to Favorites',
      'removeFavorite': 'Remove from Favorites',
      'shareFormula': 'Share',
      'views': 'views',
      'noFavorites': 'No favorite formulas',
      'noFavoritesDesc': 'Add formulas to favorites by tapping the star icon',
      'quizTitle': 'Quiz',
      'mode1Title': 'Mode 1: Name → Formula',
      'mode2Title': 'Mode 2: Formula → Name',
      'mode1Desc': 'Given the formula name — select the correct formula',
      'mode2Desc': 'Given the formula — select what it is used for',
      'startQuiz': 'Start Quiz',
      'nextQuestion': 'Next Question',
      'correctAnswer': 'Correct!',
      'wrongAnswer': 'Incorrect!',
      'quizResults': 'Quiz Results',
      'correctAnswers': 'Correct Answers',
      'wrongAnswers': 'Wrong Answers',
      'retry': 'Retry',
      'finish': 'Finish',
      'quizComplete': 'Quiz Complete!',
      'yourScore': 'Your Score',
      'questionLabel': 'Question',
      'ofLabel': 'of',
      'selectAnswer': 'Select an answer',
      'searchTitle': 'Search',
      'noResults': 'Nothing found',
      'noResultsDesc': 'Try a different keyword',
      'settingsTitle': 'Settings',
      'themeSection': 'Theme',
      'darkMode': 'Dark Mode',
      'lightMode': 'Light Mode',
      'systemTheme': 'System Theme',
      'languageSection': 'Language',
      'kazakh': 'Kazakh',
      'russian': 'Russian',
      'english': 'English',
      'notificationsSection': 'Notifications',
      'notificationsEnabled': 'Formula of the Day',
      'notificationTime': 'Notification Time',
      'appInfoSection': 'About',
      'version': 'Version: 1.0.0',
    },
  };
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['kk', 'ru', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async =>
      AppLocalizations(locale);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
