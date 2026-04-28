import '../models/subject_model.dart';
import '../models/topic_model.dart';
import '../models/formula_model.dart';

// ============================================================
//  SUBJECTS
// ============================================================
final List<SubjectModel> kSubjects = [
  SubjectModel(
      id: 'math',
      nameKk: 'Математика',
      nameRu: 'Математика',
      nameEn: 'Mathematics',
      icon: 'math',
      order: 1),
  SubjectModel(
      id: 'physics',
      nameKk: 'Физика',
      nameRu: 'Физика',
      nameEn: 'Physics',
      icon: 'physics',
      order: 2),
  SubjectModel(
      id: 'cs',
      nameKk: 'Информатика',
      nameRu: 'Информатика',
      nameEn: 'Computer Science',
      icon: 'cs',
      order: 3),
];

// ============================================================
//  TOPICS
// ============================================================
final List<TopicModel> kTopics = [
  // Math
  TopicModel(
      id: 'algebra',
      subjectId: 'math',
      nameKk: 'Алгебра',
      nameRu: 'Алгебра',
      nameEn: 'Algebra',
      descriptionKk: 'Теңдеулер, прогрессиялар және алгебралық тепе-теңдіктер'),
  TopicModel(
      id: 'geometry',
      subjectId: 'math',
      nameKk: 'Геометрия',
      nameRu: 'Геометрия',
      nameEn: 'Geometry',
      descriptionKk: 'Фигуралардың аудандары, периметрлері және теоремалары'),
  TopicModel(
      id: 'trigonometry',
      subjectId: 'math',
      nameKk: 'Тригонометрия',
      nameRu: 'Тригонометрия',
      nameEn: 'Trigonometry',
      descriptionKk: 'Синус, косинус, тангенс және олардың формулалары'),
  TopicModel(
      id: 'calculus',
      subjectId: 'math',
      nameKk: 'Математикалық анализ',
      nameRu: 'Математический анализ',
      nameEn: 'Calculus',
      descriptionKk: 'Туындылар, интегралдар және шектер'),
  // Physics
  TopicModel(
      id: 'mechanics',
      subjectId: 'physics',
      nameKk: 'Механика',
      nameRu: 'Механика',
      nameEn: 'Mechanics',
      descriptionKk: 'Кинематика, динамика және энергия'),
  TopicModel(
      id: 'thermodynamics',
      subjectId: 'physics',
      nameKk: 'Термодинамика',
      nameRu: 'Термодинамика',
      nameEn: 'Thermodynamics',
      descriptionKk: 'Газ заңдары және жылу процестері'),
  TopicModel(
      id: 'electricity',
      subjectId: 'physics',
      nameKk: 'Электр',
      nameRu: 'Электричество',
      nameEn: 'Electricity',
      descriptionKk: 'Ток, кернеу, кедергі және электр өрісі'),
  TopicModel(
      id: 'optics',
      subjectId: 'physics',
      nameKk: 'Оптика',
      nameRu: 'Оптика',
      nameEn: 'Optics',
      descriptionKk: 'Жарық, жарықтың сынуы және толқын оптикасы'),
  // CS
  TopicModel(
      id: 'data_structures',
      subjectId: 'cs',
      nameKk: 'Деректер құрылымдары',
      nameRu: 'Структуры данных',
      nameEn: 'Data Structures',
      descriptionKk: 'Массивтер, ағаштар, хеш-кестелер'),
  TopicModel(
      id: 'algorithms',
      subjectId: 'cs',
      nameKk: 'Алгоритмдер',
      nameRu: 'Алгоритмы',
      nameEn: 'Algorithms',
      descriptionKk: 'Іздеу, сұрыптау және бөліп-бақылау'),
  TopicModel(
      id: 'complexity',
      subjectId: 'cs',
      nameKk: 'Алгоритм күрделілігі',
      nameRu: 'Сложность алгоритмов',
      nameEn: 'Algorithm Complexity',
      descriptionKk: 'Big O нотациясы және уақыт/кеңістік күрделілігі'),
  TopicModel(
      id: 'number_systems',
      subjectId: 'cs',
      nameKk: 'Санау жүйелері',
      nameRu: 'Системы счисления',
      nameEn: 'Number Systems',
      descriptionKk: 'Екілік, сегіздік, он алтылық санау жүйелері'),
  TopicModel(
      id: 'boolean_algebra',
      subjectId: 'cs',
      nameKk: 'Логикалық алгебра',
      nameRu: 'Логическая алгебра',
      nameEn: 'Boolean Algebra',
      descriptionKk: 'Де Морган теоремалары, AND/OR/NOT/XOR амалдары'),
  TopicModel(
      id: 'info_theory',
      subjectId: 'cs',
      nameKk: 'Ақпарат теориясы',
      nameRu: 'Теория информации',
      nameEn: 'Information Theory',
      descriptionKk: 'Шеннон энтропиясы және ақпарат мөлшері'),
  TopicModel(
      id: 'graph_theory',
      subjectId: 'cs',
      nameKk: 'Граф теориясы',
      nameRu: 'Теория графов',
      nameEn: 'Graph Theory',
      descriptionKk: 'Граф алгоритмдері: BFS, DFS, Дейкстра'),
  TopicModel(
      id: 'recursion',
      subjectId: 'cs',
      nameKk: 'Рекурсия',
      nameRu: 'Рекурсия',
      nameEn: 'Recursion',
      descriptionKk: 'Рекурсивті функциялар және рекуррентті қатынастар'),
  TopicModel(
      id: 'sorting',
      subjectId: 'cs',
      nameKk: 'Сұрыптау алгоритмдері',
      nameRu: 'Алгоритмы сортировки',
      nameEn: 'Sorting Algorithms',
      descriptionKk: 'Сұрыптаудың күрделілігі және жұмыс принципі'),
];

// ============================================================
//  FORMULAS  (45 formulas)
// ============================================================
final List<FormulaModel> kFormulas = [
  // ── ALGEBRA ─────────────────────────────────────────────────────────────
  FormulaModel(
    id: 'f_quad',
    subjectId: 'math',
    topicId: 'algebra',
    titleKk: 'Квадрат теңдеу формуласы',
    titleRu: 'Формула квадратного уравнения',
    titleEn: 'Quadratic Formula',
    formulaLatex: r'x = \dfrac{-b \pm \sqrt{b^2 - 4ac}}{2a}',
    descriptionKk:
        'ax² + bx + c = 0 түріндегі квадрат теңдеудің екі түбірін табу формуласы. '
        'Дискриминант D = b² − 4ac: D > 0 болса екі нақты түбір, D = 0 болса бір түбір, D < 0 болса нақты түбір жоқ.',
    descriptionRu:
        'Формула нахождения корней квадратного уравнения ax² + bx + c = 0.',
    variablesKk: {
      'a': 'x²-нің коэффициенті (a ≠ 0)',
      'b': 'x-тің коэффициенті',
      'c': 'бос мүше',
      'x': 'теңдеудің түбірі',
    },
    exampleKk: 'x² − 5x + 6 = 0 теңдеуін шешіңіз.',
    exampleSolutionKk:
        'a = 1, b = −5, c = 6\n'
        'D = (−5)² − 4·1·6 = 25 − 24 = 1\n'
        '√D = 1\n'
        'x₁ = (5 + 1) / 2 = 3\n'
        'x₂ = (5 − 1) / 2 = 2\n'
        'Жауап: x₁ = 3, x₂ = 2',
    difficulty: 2,
  ),
  FormulaModel(
    id: 'f_arith_n',
    subjectId: 'math',
    topicId: 'algebra',
    titleKk: 'Арифметикалық прогрессия: n-ші мүше',
    titleRu: 'n-й член арифметической прогрессии',
    titleEn: 'Arithmetic Sequence: nth Term',
    formulaLatex: r'a_n = a_1 + (n-1)d',
    descriptionKk:
        'Арифметикалық прогрессияның кез-келген мүшесін табу формуласы. '
        'Айырма d тұрақты: d = aₙ − aₙ₋₁.',
    descriptionRu: 'Формула n-го члена арифметической прогрессии.',
    variablesKk: {
      'aₙ': 'n-ші мүше',
      'a₁': 'бірінші мүше',
      'n': 'реттік нөмір',
      'd': 'прогрессия айырмасы',
    },
    exampleKk: 'a₁ = 3, d = 4 болса, a₅-ті табыңыз.',
    exampleSolutionKk:
        'a₅ = 3 + (5−1)·4 = 3 + 16 = 19\nЖауап: a₅ = 19',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_arith_sum',
    subjectId: 'math',
    topicId: 'algebra',
    titleKk: 'Арифметикалық прогрессия қосындысы',
    titleRu: 'Сумма арифметической прогрессии',
    titleEn: 'Sum of Arithmetic Sequence',
    formulaLatex: r'S_n = \dfrac{n(a_1 + a_n)}{2}',
    descriptionKk:
        'Арифметикалық прогрессияның алғашқы n мүшесінің қосындысын табу формуласы.',
    descriptionRu: 'Сумма первых n членов арифметической прогрессии.',
    variablesKk: {
      'Sₙ': 'n мүшенің қосындысы',
      'n': 'мүшелер саны',
      'a₁': 'бірінші мүше',
      'aₙ': 'n-ші мүше',
    },
    exampleKk: '1-ден 100-ге дейінгі натурал сандардың қосындысын табыңыз.',
    exampleSolutionKk:
        'a₁ = 1, a₁₀₀ = 100, n = 100\nS₁₀₀ = 100·(1+100)/2 = 5050\nЖауап: 5050',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_geom_n',
    subjectId: 'math',
    topicId: 'algebra',
    titleKk: 'Геометриялық прогрессия: n-ші мүше',
    titleRu: 'n-й член геометрической прогрессии',
    titleEn: 'Geometric Sequence: nth Term',
    formulaLatex: r'a_n = a_1 \cdot r^{n-1}',
    descriptionKk:
        'Геометриялық прогрессияның кез-келген мүшесін табу формуласы. '
        'Қатынас r тұрақты: r = aₙ / aₙ₋₁.',
    descriptionRu: 'Формула n-го члена геометрической прогрессии.',
    variablesKk: {
      'aₙ': 'n-ші мүше',
      'a₁': 'бірінші мүше',
      'r': 'прогрессия қатынасы',
      'n': 'реттік нөмір',
    },
    exampleKk: 'a₁ = 2, r = 3 болса, a₄-ті табыңыз.',
    exampleSolutionKk: 'a₄ = 2·3³ = 2·27 = 54\nЖауап: a₄ = 54',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_geom_sum',
    subjectId: 'math',
    topicId: 'algebra',
    titleKk: 'Геометриялық прогрессия қосындысы',
    titleRu: 'Сумма геометрической прогрессии',
    titleEn: 'Sum of Geometric Sequence',
    formulaLatex: r'S_n = \dfrac{a_1(r^n - 1)}{r - 1},\quad r \neq 1',
    descriptionKk:
        'Геометриялық прогрессияның алғашқы n мүшесінің қосындысы (r ≠ 1 кезінде).',
    descriptionRu: 'Сумма первых n членов геометрической прогрессии.',
    variablesKk: {
      'Sₙ': 'n мүшенің қосындысы',
      'a₁': 'бірінші мүше',
      'r': 'прогрессия қатынасы',
      'n': 'мүшелер саны',
    },
    exampleKk: 'a₁ = 1, r = 2, n = 5 болса, S₅-ті табыңыз.',
    exampleSolutionKk:
        'S₅ = 1·(2⁵−1)/(2−1) = (32−1)/1 = 31\nЖауап: S₅ = 31',
    difficulty: 2,
  ),

  // ── GEOMETRY ────────────────────────────────────────────────────────────
  FormulaModel(
    id: 'f_pyth',
    subjectId: 'math',
    topicId: 'geometry',
    titleKk: 'Пифагор теоремасы',
    titleRu: 'Теорема Пифагора',
    titleEn: 'Pythagorean Theorem',
    formulaLatex: r'a^2 + b^2 = c^2',
    descriptionKk:
        'Тік бұрышты үшбұрышта гипотенузаның квадраты екі катеттің квадраттарының қосындысына тең.',
    descriptionRu:
        'В прямоугольном треугольнике квадрат гипотенузы равен сумме квадратов катетов.',
    variablesKk: {
      'a, b': 'катеттер (тік бұрышты жақтар)',
      'c': 'гипотенуза (тік бұрышқа қарсы жақ)',
    },
    exampleKk: 'Катеттері 3 және 4 болса, гипотенузаны табыңыз.',
    exampleSolutionKk: 'c² = 3² + 4² = 9 + 16 = 25\nc = 5\nЖауап: c = 5',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_circle_area',
    subjectId: 'math',
    topicId: 'geometry',
    titleKk: 'Шеңбер ауданы',
    titleRu: 'Площадь круга',
    titleEn: 'Area of a Circle',
    formulaLatex: r'S = \pi r^2',
    descriptionKk: 'Радиусы r болатын шеңбердің ауданын есептеу формуласы.',
    descriptionRu: 'Формула площади круга с радиусом r.',
    variablesKk: {
      'S': 'шеңбер ауданы',
      'π': 'пи саны ≈ 3.14159',
      'r': 'шеңбер радиусы',
    },
    exampleKk: 'Радиусы 5 см болатын шеңбердің ауданын табыңыз.',
    exampleSolutionKk: 'S = π·5² = 25π ≈ 78.54 см²\nЖауап: S ≈ 78.54 см²',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_circle_c',
    subjectId: 'math',
    topicId: 'geometry',
    titleKk: 'Шеңбер ұзындығы',
    titleRu: 'Длина окружности',
    titleEn: 'Circumference of a Circle',
    formulaLatex: r'C = 2\pi r',
    descriptionKk: 'Радиусы r болатын шеңбердің ұзындығы (периметрі).',
    descriptionRu: 'Длина окружности с радиусом r.',
    variablesKk: {
      'C': 'шеңбердің ұзындығы',
      'π': 'пи саны ≈ 3.14159',
      'r': 'шеңбер радиусы',
    },
    exampleKk: 'Радиусы 7 м болатын шеңбердің ұзындығын табыңыз.',
    exampleSolutionKk: 'C = 2·π·7 = 14π ≈ 43.98 м\nЖауап: C ≈ 43.98 м',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_heron',
    subjectId: 'math',
    topicId: 'geometry',
    titleKk: 'Герон формуласы',
    titleRu: 'Формула Герона',
    titleEn: "Heron's Formula",
    formulaLatex: r'S = \sqrt{p(p-a)(p-b)(p-c)},\quad p = \frac{a+b+c}{2}',
    descriptionKk:
        'Үш жағының ұзындығы белгілі үшбұрыштың ауданын табатын формула. '
        'p — жартылай периметр.',
    descriptionRu:
        'Площадь треугольника через три стороны. p — полупериметр.',
    variablesKk: {
      'S': 'үшбұрыш ауданы',
      'a, b, c': 'үшбұрыштың жақтары',
      'p': 'жартылай периметр',
    },
    exampleKk: 'Жақтары 3, 4, 5 болатын үшбұрыштың ауданын табыңыз.',
    exampleSolutionKk:
        'p = (3+4+5)/2 = 6\nS = √(6·3·2·1) = √36 = 6\nЖауап: S = 6',
    difficulty: 2,
  ),

  // ── TRIGONOMETRY ─────────────────────────────────────────────────────────
  FormulaModel(
    id: 'f_trig_basic',
    subjectId: 'math',
    topicId: 'trigonometry',
    titleKk: 'Негізгі тригонометриялық тепе-теңдік',
    titleRu: 'Основное тригонометрическое тождество',
    titleEn: 'Pythagorean Identity',
    formulaLatex: r'\sin^2\alpha + \cos^2\alpha = 1',
    descriptionKk:
        'Кез-келген α бұрышы үшін синустың квадраты мен косинустың квадратының қосындысы 1-ге тең.',
    descriptionRu:
        'Для любого угла α сумма квадратов синуса и косинуса равна 1.',
    variablesKk: {
      'α': 'кез-келген бұрыш',
      'sin α': 'синус α',
      'cos α': 'косинус α',
    },
    exampleKk: 'sin α = 0.6 болса, cos α-ны табыңыз.',
    exampleSolutionKk:
        'cos²α = 1 − sin²α = 1 − 0.36 = 0.64\ncos α = 0.8\nЖауап: cos α = 0.8',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_sin_add',
    subjectId: 'math',
    topicId: 'trigonometry',
    titleKk: 'Синустың қосу формуласы',
    titleRu: 'Формула сложения синусов',
    titleEn: 'Sine Addition Formula',
    formulaLatex:
        r'\sin(\alpha + \beta) = \sin\alpha\cos\beta + \cos\alpha\sin\beta',
    descriptionKk:
        'Екі бұрыштың қосындысының синусын есептеуге арналған формула.',
    descriptionRu: 'Синус суммы двух углов.',
    variablesKk: {
      'α, β': 'кез-келген бұрыштар',
    },
    exampleKk: 'sin(75°) = sin(45° + 30°) деп есептеңіз.',
    exampleSolutionKk:
        'sin75° = sin45°·cos30° + cos45°·sin30°\n'
        '= (√2/2)·(√3/2) + (√2/2)·(1/2)\n'
        '= √6/4 + √2/4 = (√6+√2)/4\nЖауап: (√6+√2)/4',
    difficulty: 2,
  ),
  FormulaModel(
    id: 'f_cos_add',
    subjectId: 'math',
    topicId: 'trigonometry',
    titleKk: 'Косинустың қосу формуласы',
    titleRu: 'Формула сложения косинусов',
    titleEn: 'Cosine Addition Formula',
    formulaLatex:
        r'\cos(\alpha + \beta) = \cos\alpha\cos\beta - \sin\alpha\sin\beta',
    descriptionKk:
        'Екі бұрыштың қосындысының косинусын есептеуге арналған формула.',
    descriptionRu: 'Косинус суммы двух углов.',
    variablesKk: {
      'α, β': 'кез-келген бұрыштар',
    },
    exampleKk: 'cos(90°) = cos(60° + 30°) деп тексеріңіз.',
    exampleSolutionKk:
        'cos90° = cos60°·cos30° − sin60°·sin30°\n'
        '= (1/2)·(√3/2) − (√3/2)·(1/2)\n'
        '= √3/4 − √3/4 = 0 ✓',
    difficulty: 2,
  ),
  FormulaModel(
    id: 'f_cos_law',
    subjectId: 'math',
    topicId: 'trigonometry',
    titleKk: 'Косинустар теоремасы',
    titleRu: 'Теорема косинусов',
    titleEn: 'Law of Cosines',
    formulaLatex: r'c^2 = a^2 + b^2 - 2ab\cos C',
    descriptionKk:
        'Үшбұрыштың жақтары мен бұрышы арасындағы байланыс. '
        'Пифагор теоремасының жалпы жағдайы (C = 90° болса Пифагор теоремасы шығады).',
    descriptionRu:
        'Обобщение теоремы Пифагора на произвольный треугольник.',
    variablesKk: {
      'a, b, c': 'үшбұрыш жақтары',
      'C': 'c жаққа қарама-қарсы бұрыш',
    },
    exampleKk: 'a=5, b=7, C=60° болса, c-ны табыңыз.',
    exampleSolutionKk:
        'c² = 25 + 49 − 2·5·7·cos60°\n= 74 − 70·0.5 = 74 − 35 = 39\nc = √39 ≈ 6.24\nЖауап: c ≈ 6.24',
    difficulty: 2,
  ),

  // ── CALCULUS ─────────────────────────────────────────────────────────────
  FormulaModel(
    id: 'f_power_deriv',
    subjectId: 'math',
    topicId: 'calculus',
    titleKk: 'Дәреже функциясының туындысы',
    titleRu: 'Производная степенной функции',
    titleEn: 'Power Rule (Derivative)',
    formulaLatex: r'\frac{d}{dx}(x^n) = nx^{n-1}',
    descriptionKk: 'Дәреже функциясының туындысын табу ережесі.',
    descriptionRu: 'Правило дифференцирования степенной функции.',
    variablesKk: {
      'x': 'айнымалы',
      'n': 'дәрежесі (нақты сан)',
    },
    exampleKk: 'f(x) = x³ болса, f\'(x)-ті табыңыз.',
    exampleSolutionKk: 'f\'(x) = 3x^(3−1) = 3x²\nЖауап: f\'(x) = 3x²',
    difficulty: 2,
  ),
  FormulaModel(
    id: 'f_power_int',
    subjectId: 'math',
    topicId: 'calculus',
    titleKk: 'Дәреже функциясының интегралы',
    titleRu: 'Интеграл степенной функции',
    titleEn: 'Power Rule (Integral)',
    formulaLatex: r'\int x^n\,dx = \frac{x^{n+1}}{n+1} + C,\quad n \neq -1',
    descriptionKk:
        'Дәреже функциясының антитуындысын табу ережесі. C — интегралдау тұрақтысы.',
    descriptionRu:
        'Антипроизводная степенной функции. C — константа интегрирования.',
    variablesKk: {
      'x': 'айнымалы',
      'n': 'дәрежесі (n ≠ −1)',
      'C': 'интегралдау тұрақтысы',
    },
    exampleKk: '∫x⁴ dx-ті есептеңіз.',
    exampleSolutionKk: '∫x⁴ dx = x⁵/5 + C\nЖауап: x⁵/5 + C',
    difficulty: 2,
  ),
  FormulaModel(
    id: 'f_chain',
    subjectId: 'math',
    topicId: 'calculus',
    titleKk: 'Күрделі функция туындысы (тізбек ережесі)',
    titleRu: 'Производная сложной функции (правило цепочки)',
    titleEn: 'Chain Rule',
    formulaLatex: r'[f(g(x))]' + "'" + r' = f'+"'"+ r'(g(x))\cdot g'+"'"+ r'(x)',
    descriptionKk:
        'Күрделі функцияның туындысын табу үшін сыртқы функцияның туындысын ішкіге көбейту керек.',
    descriptionRu:
        'Производная сложной функции: производная внешней умножается на производную внутренней.',
    variablesKk: {
      'f': 'сыртқы функция',
      'g': 'ішкі функция',
      'x': 'айнымалы',
    },
    exampleKk: 'h(x) = (2x+1)⁵ болса, h\'(x)-ті табыңыз.',
    exampleSolutionKk:
        'h\'(x) = 5(2x+1)⁴ · (2x+1)\' = 5(2x+1)⁴ · 2 = 10(2x+1)⁴\nЖауап: 10(2x+1)⁴',
    difficulty: 3,
  ),

  // ── MECHANICS ───────────────────────────────────────────────────────────
  FormulaModel(
    id: 'f_newton2',
    subjectId: 'physics',
    topicId: 'mechanics',
    titleKk: 'Ньютонның II заңы',
    titleRu: 'Второй закон Ньютона',
    titleEn: "Newton's Second Law",
    formulaLatex: r'F = ma',
    descriptionKk:
        'Денеге түсірілген күш оның массасы мен үдеуінің көбейтіндісіне тең.',
    descriptionRu:
        'Сила, действующая на тело, равна произведению массы на ускорение.',
    variablesKk: {
      'F': 'күш (Ньютон, Н)',
      'm': 'масса (кг)',
      'a': 'үдеу (м/с²)',
    },
    exampleKk: '10 кг массалы денеге 30 Н күш түсірілсе, үдеуін табыңыз.',
    exampleSolutionKk: 'a = F/m = 30/10 = 3 м/с²\nЖауап: a = 3 м/с²',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_ekin',
    subjectId: 'physics',
    topicId: 'mechanics',
    titleKk: 'Кинетикалық энергия',
    titleRu: 'Кинетическая энергия',
    titleEn: 'Kinetic Energy',
    formulaLatex: r'E_k = \dfrac{mv^2}{2}',
    descriptionKk: 'Қозғалыстағы денеге тән кинетикалық энергия формуласы.',
    descriptionRu: 'Кинетическая энергия движущегося тела.',
    variablesKk: {
      'Eₖ': 'кинетикалық энергия (Дж)',
      'm': 'масса (кг)',
      'v': 'жылдамдық (м/с)',
    },
    exampleKk: '2 кг масса, v = 10 м/с болса, Eₖ-ны табыңыз.',
    exampleSolutionKk: 'Eₖ = 2·100/2 = 100 Дж\nЖауап: Eₖ = 100 Дж',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_epot',
    subjectId: 'physics',
    topicId: 'mechanics',
    titleKk: 'Потенциалдық энергия',
    titleRu: 'Потенциальная энергия',
    titleEn: 'Gravitational Potential Energy',
    formulaLatex: r'E_p = mgh',
    descriptionKk:
        'Жердің тартылыс өрісіндегі денеге тән потенциалдық энергия. '
        'h — жер бетінен биіктік.',
    descriptionRu: 'Потенциальная энергия тела в поле тяготения Земли.',
    variablesKk: {
      'Eₚ': 'потенциалдық энергия (Дж)',
      'm': 'масса (кг)',
      'g': 'еркін түсу үдеуі ≈ 9.8 м/с²',
      'h': 'биіктік (м)',
    },
    exampleKk: '5 кг дене 10 м биіктікте. Eₚ = ?',
    exampleSolutionKk: 'Eₚ = 5·9.8·10 = 490 Дж\nЖауап: Eₚ = 490 Дж',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_velocity',
    subjectId: 'physics',
    topicId: 'mechanics',
    titleKk: 'Бірқалыпты үдемелі қозғалыс жылдамдығы',
    titleRu: 'Скорость равноускоренного движения',
    titleEn: 'Velocity (uniform acceleration)',
    formulaLatex: r'v = v_0 + at',
    descriptionKk:
        'Бірқалыпты үдемелі қозғалыста t уақыттан кейінгі жылдамдық.',
    descriptionRu:
        'Скорость тела при равноускоренном движении через время t.',
    variablesKk: {
      'v': 'ағымдағы жылдамдық (м/с)',
      'v₀': 'бастапқы жылдамдық (м/с)',
      'a': 'үдеу (м/с²)',
      't': 'уақыт (с)',
    },
    exampleKk: 'v₀ = 5 м/с, a = 2 м/с², t = 3 с болса, v = ?',
    exampleSolutionKk: 'v = 5 + 2·3 = 11 м/с\nЖауап: v = 11 м/с',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_displacement',
    subjectId: 'physics',
    topicId: 'mechanics',
    titleKk: 'Орын ауысу формуласы',
    titleRu: 'Формула перемещения',
    titleEn: 'Displacement Formula',
    formulaLatex: r's = v_0 t + \dfrac{at^2}{2}',
    descriptionKk:
        'Бірқалыпты үдемелі қозғалыста t уақытта жүрілген жол (орын ауысу).',
    descriptionRu: 'Путь при равноускоренном движении за время t.',
    variablesKk: {
      's': 'орын ауысу (м)',
      'v₀': 'бастапқы жылдамдық (м/с)',
      'a': 'үдеу (м/с²)',
      't': 'уақыт (с)',
    },
    exampleKk: 'v₀ = 0, a = 4 м/с², t = 3 с болса, s = ?',
    exampleSolutionKk: 's = 0 + 4·9/2 = 18 м\nЖауап: s = 18 м',
    difficulty: 2,
  ),

  // ── THERMODYNAMICS ───────────────────────────────────────────────────────
  FormulaModel(
    id: 'f_ideal_gas',
    subjectId: 'physics',
    topicId: 'thermodynamics',
    titleKk: 'Мүлтіксіз газ күй теңдеуі',
    titleRu: 'Уравнение состояния идеального газа',
    titleEn: 'Ideal Gas Law',
    formulaLatex: r'PV = nRT',
    descriptionKk:
        'Мүлтіксіз газдың қысымы, көлемі, мөлшері және температурасы арасындағы байланыс.',
    descriptionRu:
        'Связь давления, объёма, количества вещества и температуры идеального газа.',
    variablesKk: {
      'P': 'қысым (Па)',
      'V': 'көлем (м³)',
      'n': 'зат мөлшері (моль)',
      'R': 'универсал газ тұрақтысы = 8.314 Дж/(моль·К)',
      'T': 'абсолюттік температура (К)',
    },
    exampleKk: '1 моль газ T=300 К, P=101325 Па болса, V = ?',
    exampleSolutionKk:
        'V = nRT/P = 1·8.314·300/101325 ≈ 0.0246 м³\nЖауап: V ≈ 24.6 л',
    difficulty: 2,
  ),
  FormulaModel(
    id: 'f_first_thermo',
    subjectId: 'physics',
    topicId: 'thermodynamics',
    titleKk: 'Термодинамиканың I заңы',
    titleRu: 'Первое начало термодинамики',
    titleEn: 'First Law of Thermodynamics',
    formulaLatex: r'\Delta U = Q - W',
    descriptionKk:
        'Жүйенің ішкі энергиясының өзгерісі жүйеге берілген жылу мен жүйенің жасаған жұмысының айырымына тең.',
    descriptionRu:
        'Изменение внутренней энергии системы равно теплоте минус работа системы.',
    variablesKk: {
      'ΔU': 'ішкі энергияның өзгерісі (Дж)',
      'Q': 'жүйеге берілген жылу (Дж)',
      'W': 'жүйенің жасаған жұмысы (Дж)',
    },
    exampleKk: 'Q = 500 Дж берілсе, жүйе W = 200 Дж жұмыс жасаса, ΔU = ?',
    exampleSolutionKk: 'ΔU = 500 − 200 = 300 Дж\nЖауап: ΔU = 300 Дж',
    difficulty: 2,
  ),

  // ── ELECTRICITY ──────────────────────────────────────────────────────────
  FormulaModel(
    id: 'f_ohm',
    subjectId: 'physics',
    topicId: 'electricity',
    titleKk: 'Ом заңы',
    titleRu: 'Закон Ома',
    titleEn: "Ohm's Law",
    formulaLatex: r'U = IR',
    descriptionKk:
        'Өткізгіштегі кернеу токтың күші мен кедергінің көбейтіндісіне тең.',
    descriptionRu:
        'Напряжение на участке цепи равно произведению тока на сопротивление.',
    variablesKk: {
      'U': 'кернеу (Вольт, В)',
      'I': 'ток күші (Ампер, А)',
      'R': 'кедергі (Ом, Ω)',
    },
    exampleKk: 'R = 10 Ω, I = 2 А болса, U = ?',
    exampleSolutionKk: 'U = 2·10 = 20 В\nЖауап: U = 20 В',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_power_elec',
    subjectId: 'physics',
    topicId: 'electricity',
    titleKk: 'Электр қуаты',
    titleRu: 'Электрическая мощность',
    titleEn: 'Electrical Power',
    formulaLatex: r'P = UI = I^2R = \dfrac{U^2}{R}',
    descriptionKk:
        'Электр тізбегінде бөлінетін қуатты есептеу формулалары.',
    descriptionRu: 'Формулы для расчёта электрической мощности.',
    variablesKk: {
      'P': 'қуат (Ватт, Вт)',
      'U': 'кернеу (В)',
      'I': 'ток күші (А)',
      'R': 'кедергі (Ω)',
    },
    exampleKk: 'U = 220 В, R = 100 Ω болса, P = ?',
    exampleSolutionKk: 'P = U²/R = 220²/100 = 48400/100 = 484 Вт\nЖауап: P = 484 Вт',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_coulomb',
    subjectId: 'physics',
    topicId: 'electricity',
    titleKk: 'Кулон заңы',
    titleRu: 'Закон Кулона',
    titleEn: "Coulomb's Law",
    formulaLatex: r'F = k\dfrac{q_1 q_2}{r^2}',
    descriptionKk:
        'Екі нүктелік зарядтың өзара әрекеттесу күші олардың зарядтарының көбейтіндісіне пропорционал және ара қашықтықтың квадратына кері пропорционал.',
    descriptionRu:
        'Сила взаимодействия двух точечных зарядов.',
    variablesKk: {
      'F': 'өзара әрекеттесу күші (Н)',
      'k': 'Кулон тұрақтысы ≈ 9·10⁹ Н·м²/Кл²',
      'q₁, q₂': 'зарядтар (Кулон, Кл)',
      'r': 'зарядтар арасындағы қашықтық (м)',
    },
    exampleKk: 'q₁=q₂=1 мкКл, r=0.1 м болса, F = ?',
    exampleSolutionKk:
        'F = 9·10⁹·(10⁻⁶)²/(0.1)² = 9·10⁹·10⁻¹²/0.01 = 0.9 Н\nЖауап: F = 0.9 Н',
    difficulty: 2,
  ),

  // ── OPTICS ──────────────────────────────────────────────────────────────
  FormulaModel(
    id: 'f_snell',
    subjectId: 'physics',
    topicId: 'optics',
    titleKk: 'Снелл заңы (жарықтың сынуы)',
    titleRu: 'Закон Снеллиуса (преломление)',
    titleEn: "Snell's Law",
    formulaLatex: r'n_1 \sin\theta_1 = n_2 \sin\theta_2',
    descriptionKk:
        'Жарық сәулесі екі орта шекарасында сынғанда өту бұрыштары мен сыну көрсеткіштерінің арасындағы байланыс.',
    descriptionRu:
        'Закон преломления света на границе двух сред.',
    variablesKk: {
      'n₁, n₂': 'бірінші және екінші ортаның сыну көрсеткіші',
      'θ₁': 'түсу бұрышы',
      'θ₂': 'сыну бұрышы',
    },
    exampleKk: 'n₁=1 (ауа), θ₁=30°, n₂=1.5 (шыны) болса, θ₂ = ?',
    exampleSolutionKk:
        'sin θ₂ = n₁·sin θ₁/n₂ = 1·0.5/1.5 ≈ 0.333\nθ₂ ≈ 19.5°\nЖауап: θ₂ ≈ 19.5°',
    difficulty: 2,
  ),
  FormulaModel(
    id: 'f_wave',
    subjectId: 'physics',
    topicId: 'optics',
    titleKk: 'Толқын жылдамдығы',
    titleRu: 'Скорость волны',
    titleEn: 'Wave Speed',
    formulaLatex: r'v = \lambda f',
    descriptionKk:
        'Толқынның таралу жылдамдығы толқын ұзындығы мен жиіліктің көбейтіндісіне тең.',
    descriptionRu:
        'Скорость распространения волны равна произведению длины волны на частоту.',
    variablesKk: {
      'v': 'толқын жылдамдығы (м/с)',
      'λ': 'толқын ұзындығы (м)',
      'f': 'жиілік (Гц)',
    },
    exampleKk: 'λ = 0.5 м, f = 680 Гц болса, v = ?',
    exampleSolutionKk: 'v = 0.5·680 = 340 м/с (дыбыс жылдамдығы)\nЖауап: v = 340 м/с',
    difficulty: 1,
  ),

  // ── DATA STRUCTURES ──────────────────────────────────────────────────────
  FormulaModel(
    id: 'f_array_access',
    subjectId: 'cs',
    topicId: 'data_structures',
    titleKk: 'Массивке кіру уақыты',
    titleRu: 'Время доступа к массиву',
    titleEn: 'Array Access Time',
    formulaLatex: r'T_{access} = O(1)',
    descriptionKk:
        'Массивтің кез-келген элементіне индекс арқылы тұрақты уақытта (O(1)) кіруге болады.',
    descriptionRu:
        'Доступ к любому элементу массива по индексу выполняется за константное время.',
    variablesKk: {
      'O(1)': 'тұрақты уақыт — операция элементтер санына байланысты емес',
    },
    exampleKk: 'arr[5] элементіне қатынас. Массив өлшемі маңызды ма?',
    exampleSolutionKk:
        'Жоқ. Компьютер arr[5] адресін тікелей есептейді:\n'
        'адрес = базалық_адрес + 5 × (элемент_өлшемі)\n'
        'Демек, O(1) — тұрақты уақыт.',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_bst_search',
    subjectId: 'cs',
    topicId: 'data_structures',
    titleKk: 'Екілік іздеу ағашы: іздеу',
    titleRu: 'Бинарное дерево поиска: поиск',
    titleEn: 'Binary Search Tree: Search',
    formulaLatex: r'T_{BST} = O(\log n)\ \text{(орта)}',
    descriptionKk:
        'Теңгерімделген екілік іздеу ағашында элемент іздеу орта есеппен O(log n) уақыт алады. '
        'Ең жаман жағдайда (тізімге айналса) — O(n).',
    descriptionRu:
        'Поиск в сбалансированном BST занимает O(log n) в среднем случае.',
    variablesKk: {
      'n': 'ағаштағы түйіндер саны',
      'O(log n)': 'логарифмдік уақыт',
    },
    exampleKk: '1000 элементті BST-де іздеу неше қадам алады?',
    exampleSolutionKk:
        'log₂(1000) ≈ 10 қадам\nТеңгерімделген ағаш үшін ~10 салыстыру жеткілікті.',
    difficulty: 2,
  ),
  FormulaModel(
    id: 'f_hash_lookup',
    subjectId: 'cs',
    topicId: 'data_structures',
    titleKk: 'Хеш-кесте: іздеу',
    titleRu: 'Хеш-таблица: поиск',
    titleEn: 'Hash Table: Lookup',
    formulaLatex: r'T_{hash} = O(1)\ \text{(орта)}',
    descriptionKk:
        'Жақсы таралған хеш-кестеде кілт бойынша іздеу орта есеппен O(1) уақыт алады. '
        'Ең жаман жағдайда (барлық коллизия) — O(n).',
    descriptionRu:
        'Поиск по ключу в хеш-таблице в среднем выполняется за O(1).',
    variablesKk: {
      'O(1)': 'тұрақты орта уақыт',
      'n': 'элементтер саны',
    },
    exampleKk:
        'Сөздік (dictionary) деректер құрылымы кілт бойынша іздеуде неге тез?',
    exampleSolutionKk:
        'Кілттен хеш-код есептеліп, тікелей жасуша адресіне баруға болады. '
        'Демек, іздеу массив өлшеміне тәуелді емес — O(1).',
    difficulty: 2,
  ),

  // ── ALGORITHMS ──────────────────────────────────────────────────────────
  FormulaModel(
    id: 'f_binary_search',
    subjectId: 'cs',
    topicId: 'algorithms',
    titleKk: 'Екілік іздеу',
    titleRu: 'Бинарный поиск',
    titleEn: 'Binary Search',
    formulaLatex: r'T(n) = O(\log n)',
    descriptionKk:
        'Сұрыпталған массивте элемент іздеу алгоритмі. '
        'Әр қадамда іздеу аймағы жартылай қысқарады.',
    descriptionRu:
        'Алгоритм поиска в отсортированном массиве, делящий область поиска пополам.',
    variablesKk: {
      'n': 'массив өлшемі',
      'O(log n)': 'алгоритм күрделілігі',
    },
    exampleKk: '1..100 аралығында 73 санды екілік іздеумен табыңыз.',
    exampleSolutionKk:
        '1-іздеу: орта = 50. 73 > 50 → жоғары жарты\n'
        '2-іздеу: орта = 75. 73 < 75 → төменгі жарты\n'
        '3-іздеу: орта = 62. 73 > 62 → жоғары жарты\n'
        '4-іздеу: орта = 68. 73 > 68 → ...\n'
        'Жалпы ≈ 7 қадам (log₂100 ≈ 6.6)',
    difficulty: 2,
  ),
  FormulaModel(
    id: 'f_merge_sort',
    subjectId: 'cs',
    topicId: 'algorithms',
    titleKk: 'Біріктіру сұрыптауы (рекуррентті қатынас)',
    titleRu: 'Сортировка слиянием (рекуррентное соотношение)',
    titleEn: 'Merge Sort Recurrence',
    formulaLatex: r'T(n) = 2T\!\left(\dfrac{n}{2}\right) + O(n)',
    descriptionKk:
        'Массивті екіге бөліп, рекурсивті сұрыптап, біріктіреді. '
        'Шешімі: T(n) = O(n log n).',
    descriptionRu:
        'Рекуррентное соотношение для сортировки слиянием. Решение: O(n log n).',
    variablesKk: {
      'T(n)': 'n элементті сұрыптау уақыты',
      '2T(n/2)': 'екі жарты массивке рекурсивті шақыру',
      'O(n)': 'біріктіру операциясының уақыты',
    },
    exampleKk: 'Master теоремасымен T(n) = 2T(n/2) + O(n)-ді шешіңіз.',
    exampleSolutionKk:
        'a=2, b=2, f(n)=O(n)\nnˡᵒᵍᵦᵃ = nˡᵒᵍ²² = n¹ = O(n)\n'
        'f(n) = Θ(n) = Θ(nˡᵒᵍᵦᵃ) → 2-жағдай\nT(n) = O(n log n)',
    difficulty: 3,
  ),

  // ── COMPLEXITY ──────────────────────────────────────────────────────────
  FormulaModel(
    id: 'f_o1',
    subjectId: 'cs',
    topicId: 'complexity',
    titleKk: 'O(1) — тұрақты уақыт',
    titleRu: 'O(1) — константное время',
    titleEn: 'O(1) — Constant Time',
    formulaLatex: r'T(n) = O(1)',
    descriptionKk:
        'Операцияның орындалу уақыты кіріс өлшеміне тәуелді емес. '
        'Мысалдар: массивке индекс бойынша кіру, хеш-кестеге қосу.',
    descriptionRu:
        'Время выполнения не зависит от размера входных данных.',
    variablesKk: {
      'n': 'кіріс өлшемі',
      'O(1)': 'тұрақты — тәуелсіз деген мағынада',
    },
    exampleKk: 'Массивтің бірінші элементін алу: arr[0]. Неше операция?',
    exampleSolutionKk:
        'Бір операция — тікелей адрес арқылы. n өсуімен өзгермейді. → O(1)',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_on',
    subjectId: 'cs',
    topicId: 'complexity',
    titleKk: 'O(n) — сызықтық уақыт',
    titleRu: 'O(n) — линейное время',
    titleEn: 'O(n) — Linear Time',
    formulaLatex: r'T(n) = O(n)',
    descriptionKk:
        'Операция санасы кіріс өлшеміне пропорционал. '
        'Мысалдар: массивті толық аралау, сызықтық іздеу.',
    descriptionRu: 'Время выполнения линейно зависит от размера входных данных.',
    variablesKk: {
      'n': 'кіріс өлшемі',
    },
    exampleKk: 'n элементті массивтен максимумды табу неше операция алады?',
    exampleSolutionKk:
        'Барлық n элементке 1 рет қаралады. → O(n) сызықтық уақыт.',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_on2',
    subjectId: 'cs',
    topicId: 'complexity',
    titleKk: 'O(n²) — квадраттық уақыт',
    titleRu: 'O(n²) — квадратичное время',
    titleEn: 'O(n²) — Quadratic Time',
    formulaLatex: r'T(n) = O(n^2)',
    descriptionKk:
        'Екі кірістірілген цикл болғанда пайда болатын күрделілік. '
        'Мысалдар: Bubble sort, Selection sort, матрица көбейтімі (наив).',
    descriptionRu:
        'Возникает при двух вложенных циклах. Пример: пузырьковая сортировка.',
    variablesKk: {
      'n': 'кіріс өлшемі',
    },
    exampleKk: 'Bubble sort n=1000 элементте неше салыстыру жасайды?',
    exampleSolutionKk:
        'Ең жаман жағдайда: n(n−1)/2 = 1000·999/2 = 499500\n→ O(n²)',
    difficulty: 2,
  ),

  // ── NUMBER SYSTEMS ───────────────────────────────────────────────────────
  FormulaModel(
    id: 'f_bin2dec',
    subjectId: 'cs',
    topicId: 'number_systems',
    titleKk: 'Екілік санды ондыққа ауыстыру',
    titleRu: 'Перевод двоичного числа в десятичное',
    titleEn: 'Binary to Decimal Conversion',
    formulaLatex: r'N_{10} = \sum_{i=0}^{n-1} d_i \cdot 2^i',
    descriptionKk:
        'Екілік санның (2 негіздегі) ондық жүйеге ауысу формуласы. '
        'Санның оң жақ цифрының дәрежесі 0-дан басталады.',
    descriptionRu:
        'Перевод числа из двоичной системы в десятичную.',
    variablesKk: {
      'N₁₀': 'ондық сан',
      'dᵢ': 'i-позициядағы екілік цифр (0 немесе 1)',
      'i': 'оң жақтан позиция нөмірі (0-дан басталады)',
    },
    exampleKk: '1011₂ санын ондыққа ауыстырыңыз.',
    exampleSolutionKk:
        '1·2³ + 0·2² + 1·2¹ + 1·2⁰\n= 8 + 0 + 2 + 1 = 11\nЖауап: 1011₂ = 11₁₀',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_hex2bin',
    subjectId: 'cs',
    topicId: 'number_systems',
    titleKk: 'Он алтылық санды екілікке ауыстыру',
    titleRu: 'Перевод шестнадцатеричного числа в двоичное',
    titleEn: 'Hexadecimal to Binary Conversion',
    formulaLatex: r'1\,\text{hex цифр} = 4\,\text{бит}',
    descriptionKk:
        'Он алтылық жүйенің әр цифры дәл 4 екілік цифрға (битке) сәйкес келеді. '
        'Ауыстыру кестесі: 0=0000, 1=0001, ..., F=1111.',
    descriptionRu:
        'Каждая шестнадцатеричная цифра соответствует ровно 4 двоичным цифрам.',
    variablesKk: {
      'hex': 'он алтылық жүйедегі цифр (0-9, A-F)',
      'бит': 'екілік цифр (0 немесе 1)',
    },
    exampleKk: 'A3₁₆ санын екілікке ауыстырыңыз.',
    exampleSolutionKk:
        'A = 1010, 3 = 0011\nA3₁₆ = 1010 0011₂\nЖауап: 10100011₂',
    difficulty: 1,
  ),

  // ── BOOLEAN ALGEBRA ──────────────────────────────────────────────────────
  FormulaModel(
    id: 'f_demorgan1',
    subjectId: 'cs',
    topicId: 'boolean_algebra',
    titleKk: 'Де Морган теоремасы I',
    titleRu: 'Теорема Де Моргана I',
    titleEn: "De Morgan's First Law",
    formulaLatex: r'\overline{A \cdot B} = \bar{A} + \bar{B}',
    descriptionKk:
        'Екі айнымалының AND қосылымының терістеуі олардың жеке терістеулерінің OR-ына тең.',
    descriptionRu:
        'Отрицание конъюнкции двух переменных равно дизъюнкции их отрицаний.',
    variablesKk: {
      'A, B': 'логикалық айнымалылар (0 немесе 1)',
      '·': 'AND (конъюнкция)',
      '+': 'OR (дизъюнкция)',
      '¬ (черта)': 'NOT (терістеу)',
    },
    exampleKk: 'A=1, B=0 болса, ¬(A∧B) және ¬A∨¬B-ны есептеңіз.',
    exampleSolutionKk:
        '¬(A∧B) = ¬(1·0) = ¬0 = 1\n¬A∨¬B = 0∨1 = 1\nЕкеуі тең — теорема дәлелденді.',
    difficulty: 2,
  ),
  FormulaModel(
    id: 'f_demorgan2',
    subjectId: 'cs',
    topicId: 'boolean_algebra',
    titleKk: 'Де Морган теоремасы II',
    titleRu: 'Теорема Де Моргана II',
    titleEn: "De Morgan's Second Law",
    formulaLatex: r'\overline{A + B} = \bar{A} \cdot \bar{B}',
    descriptionKk:
        'Екі айнымалының OR қосылымының терістеуі олардың жеке терістеулерінің AND-ына тең.',
    descriptionRu:
        'Отрицание дизъюнкции двух переменных равно конъюнкции их отрицаний.',
    variablesKk: {
      'A, B': 'логикалық айнымалылар (0 немесе 1)',
      '+': 'OR (дизъюнкция)',
      '·': 'AND (конъюнкция)',
    },
    exampleKk: 'A=1, B=0 болса, ¬(A∨B) және ¬A∧¬B-ны есептеңіз.',
    exampleSolutionKk:
        '¬(A∨B) = ¬(1+0) = ¬1 = 0\n¬A∧¬B = 0·1 = 0\nЕкеуі тең — теорема дәлелденді.',
    difficulty: 2,
  ),

  // ── INFORMATION THEORY ───────────────────────────────────────────────────
  FormulaModel(
    id: 'f_entropy',
    subjectId: 'cs',
    topicId: 'info_theory',
    titleKk: 'Шеннон энтропиясы',
    titleRu: 'Энтропия Шеннона',
    titleEn: 'Shannon Entropy',
    formulaLatex: r'H = -\sum_{x} p(x)\log_2 p(x)',
    descriptionKk:
        'Ақпарат көзінің орташа ақпарат мөлшерін (белгісіздік деңгейін) өлшейтін формула. '
        'Бірлігі — бит.',
    descriptionRu:
        'Формула для измерения среднего количества информации (неопределённости) источника. Единица — бит.',
    variablesKk: {
      'H': 'энтропия (бит)',
      'p(x)': 'x оқиғасының ықтималдығы',
      'log₂': '2 негіздегі логарифм',
    },
    exampleKk: 'Теңдей ықтимал 4 хабардың энтропиясын есептеңіз.',
    exampleSolutionKk:
        'p(x) = 1/4 для каждого x\n'
        'H = −4 · (1/4) · log₂(1/4)\n'
        '= −(−2) = 2 бит\nЖауап: H = 2 бит',
    difficulty: 3,
  ),

  // ── GRAPH THEORY ─────────────────────────────────────────────────────────
  FormulaModel(
    id: 'f_dijkstra',
    subjectId: 'cs',
    topicId: 'graph_theory',
    titleKk: 'Дейкстра алгоритмі: релаксация',
    titleRu: 'Алгоритм Дейкстры: релаксация',
    titleEn: "Dijkstra's Algorithm: Relaxation",
    formulaLatex: r'd[v] = \min\!\bigl(d[v],\; d[u] + w(u,v)\bigr)',
    descriptionKk:
        'Дейкстра алгоритмінің негізгі операциясы: егер u арқылы v-ге жол қысқа болса, d[v]-ні жаңарт.',
    descriptionRu:
        'Основная операция алгоритма Дейкстры: обновление расстояния если найден более короткий путь.',
    variablesKk: {
      'd[v]': 'v шыңына дейінгі ағымдағы ең қысқа жол',
      'd[u]': 'u шыңына дейінгі ағымдағы ең қысқа жол',
      'w(u,v)': 'u мен v арасындағы қабырға салмағы',
    },
    exampleKk:
        'd[A]=0, d[B]=∞, w(A,B)=5 болса, релаксациядан кейін d[B] = ?',
    exampleSolutionKk:
        'd[B] = min(∞, 0+5) = 5\nЖауап: d[B] = 5',
    difficulty: 3,
  ),

  // ── RECURSION ────────────────────────────────────────────────────────────
  FormulaModel(
    id: 'f_factorial',
    subjectId: 'cs',
    topicId: 'recursion',
    titleKk: 'Факториал (рекурсивті анықтама)',
    titleRu: 'Факториал (рекурсивное определение)',
    titleEn: 'Factorial (Recursive Definition)',
    formulaLatex: r'n! = \begin{cases} 1 & n = 0 \\ n \times (n-1)! & n > 0 \end{cases}',
    descriptionKk:
        'Натурал санның факториалы 1-ден сол санға дейінгі барлық натурал сандардың көбейтіндісі. '
        'Рекурсивті формула: n! = n × (n−1)!',
    descriptionRu:
        'Факториал натурального числа n: произведение всех натуральных чисел от 1 до n.',
    variablesKk: {
      'n': 'натурал сан',
      'n!': 'n-нің факториалы',
    },
    exampleKk: '5!-ті рекурсивті есептеңіз.',
    exampleSolutionKk:
        '5! = 5 × 4!\n4! = 4 × 3!\n3! = 3 × 2!\n2! = 2 × 1!\n1! = 1\n'
        '→ 2!=2, 3!=6, 4!=24, 5!=120\nЖауап: 5! = 120',
    difficulty: 1,
  ),
  FormulaModel(
    id: 'f_fibonacci',
    subjectId: 'cs',
    topicId: 'recursion',
    titleKk: 'Фибоначчи сандары',
    titleRu: 'Числа Фибоначчи',
    titleEn: 'Fibonacci Numbers',
    formulaLatex:
        r'F(n) = \begin{cases} 0 & n = 0 \\ 1 & n = 1 \\ F(n-1)+F(n-2) & n > 1 \end{cases}',
    descriptionKk:
        'Фибоначчи тізбегі: 0, 1, 1, 2, 3, 5, 8, 13, ... '
        'Әр мүше алдыңғы екісінің қосындысына тең.',
    descriptionRu:
        'Последовательность Фибоначчи: 0, 1, 1, 2, 3, 5, 8, 13, ...',
    variablesKk: {
      'F(n)': 'n-ші Фибоначчи саны',
      'n': 'реттік нөмір (0-дан басталады)',
    },
    exampleKk: 'F(6)-ны есептеңіз.',
    exampleSolutionKk:
        'F(0)=0, F(1)=1\nF(2)=1, F(3)=2, F(4)=3\nF(5)=5, F(6)=8\nЖауап: F(6) = 8',
    difficulty: 1,
  ),

  // ── SORTING ──────────────────────────────────────────────────────────────
  FormulaModel(
    id: 'f_quicksort',
    subjectId: 'cs',
    topicId: 'sorting',
    titleKk: 'Жылдам сұрыптау (Quicksort)',
    titleRu: 'Быстрая сортировка (Quicksort)',
    titleEn: 'Quicksort Complexity',
    formulaLatex:
        r'T_{avg} = O(n\log n),\quad T_{worst} = O(n^2)',
    descriptionKk:
        'Quicksort тірек элементін таңдап, массивті кіші/үлкен бөліктерге бөледі. '
        'Орта жағдайда O(n log n), ең жаман жағдайда (тіреу нашар таңдалса) O(n²).',
    descriptionRu:
        'Быстрая сортировка: O(n log n) в среднем, O(n²) в худшем случае.',
    variablesKk: {
      'n': 'элементтер саны',
      'Tavg': 'орта жағдайдағы уақыт',
      'Tworst': 'ең жаман жағдайдағы уақыт',
    },
    exampleKk: 'n=8 үшін орта жағдайда неше операция болады?',
    exampleSolutionKk:
        'O(n log n) = O(8 × log₂8) = O(8 × 3) = O(24)\nЖауап: шамамен 24 операция',
    difficulty: 2,
  ),
];
