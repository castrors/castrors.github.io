import 'package:jaspr/jaspr.dart';

class TranslationProvider extends InheritedComponent {
  const TranslationProvider({
    required this.locale,
    required this.toggleLocale,
    required super.child,
    super.key,
  });

  final String locale;
  final VoidCallback toggleLocale;

  static TranslationProvider? of(BuildContext context) {
    return context.dependOnInheritedComponentOfExactType<TranslationProvider>();
  }

  @override
  bool updateShouldNotify(TranslationProvider oldComponent) {
    return oldComponent.locale != locale;
  }
}

extension TranslationExtension on BuildContext {
  String t(String key) {
    final provider = TranslationProvider.of(this);
    if (provider == null) return key;
    final locale = provider.locale;
    final map = translations[locale];
    if (map == null) return key;
    return map[key] ?? key;
  }

  String get locale {
    return TranslationProvider.of(this)?.locale ?? 'pt';
  }

  void toggleLocale() {
    TranslationProvider.of(this)?.toggleLocale();
  }
}

const Map<String, Map<String, String>> translations = {
  'pt': {
    'nav_journey': 'Jornada',
    'nav_blog': 'Blog',
    'nav_links': 'Links',
    'nav_apps': 'Apps',
    'nav_contact': 'Contato',

    'hero_role': 'Senior Mobile Developer',
    'hero_title_part1': 'Desenvolvendo aplicativos de alta performance com ',
    'hero_title_part2': ' e ',
    'hero_desc':
        'Mais de 10 anos de experiência criando aplicativos elegantes, acessíveis e escaláveis para milhões de usuários em e-commerce e finanças.',
    'btn_projects': 'VER PROJETOS',
    'btn_about': 'SOBRE MIM',

    'journey_title': 'JORNADA',
    'journey_subtitle': 'Especialista em Mobile',
    'journey_skill': 'Acessibilidade & CI/CD',
    'journey_exp': '+10 anos de experiência',
    'journey_desc': 'Uma trajetória marcada pela busca constante da excelência técnica e inovação no design.',
    'journey_history_title': 'Histórico Profissional',
    'btn_start_conversation': 'INICIAR CONVERSA',

    'skills_title': 'Habilidades & Maestria',
    'skill_android_title': 'Android Nativo',
    'skill_android_desc': 'Kotlin, Java, Android SDK, Clean Architecture, APIs de Autofill.',
    'skill_flutter_title': 'Flutter & Dart',
    'skill_flutter_desc': 'Flutter Framework, Dart, React Native, Flame Engine, Acessibilidade.',
    'skill_quality_title': 'Qualidade & CI/CD',
    'skill_quality_desc': 'Testes Unitários & Automatizados, Integração Contínua (CI/CD), AWS.',

    // Timeline Date / Info
    't1_date': 'JULHO/2022 — ATUAL',
    't1_role': 'Senior Mobile Developer',
    't1_company': 'BAUHAUS (Mannheim, Alemanha)',
    't1_b1': 'App E-Commerce Flutter (Alemanha, Espanha, Áustria, Suíça)',
    't1_b2': 'Ajustes de Acessibilidade em parceria com time de Design',
    't1_b3': 'Integração Contínua (CI/CD) e Testes Automatizados',

    't2_date': 'ABRIL/2020 — JULHO/2022',
    't2_role': 'Senior Mobile Developer',
    't2_company': 'Avira / NortonLifeLock (Tettnang, Alemanha)',
    't2_b1': 'Portabilidade do Android Password Manager nativo para Flutter',
    't2_b2': 'Integração com backend AWS e uso de APIs de Autofill',
    't2_b3': 'Solução White-Label em React Native pós-aquisição NortonLifeLock',

    't3_date': 'JULHO/2019 — ABRIL/2020',
    't3_role': 'Android e Flutter Developer',
    't3_company': 'Easynvest (São Paulo/SP)',
    't3_b1': 'Evolução de apps de investimento de Renda Fixa e Variável',
    't3_b2': 'Desenvolvimento híbrido e nativo com Flutter & Android',

    't4_date': 'JUNHO/2017 — JULHO/2019',
    't4_role': 'Android Developer',
    't4_company': 'Concrete (São Paulo/SP)',
    't4_b1': 'Evolução de app de hipermercado mundial e grande banco',
    't4_b2': 'Revisão de código (Code Review) e boas práticas em Android',

    't5_date': 'DEZEMBRO/2016 — JUNHO/2017',
    't5_role': 'Android Developer',
    't5_company': 'IBM (São Paulo/SP)',
    't5_b1': 'Desenvolvimento de biblioteca (SDK) de chat nativa para banco',
    't5_b2': 'Evolução técnica do aplicativo principal corporativo',

    't6_date': 'JANEIRO/2016 — DEZEMBRO/2016',
    't6_role': 'Android Developer',
    't6_company': 'Rede Tendência (Campo Grande/MS)',
    't6_b1': 'Evolução de aplicação integrada ao ecossistema Salesforce',
    't6_b2': 'Colaboração técnica e suporte a múltiplos times Android',

    't7_date': 'JUNHO/2014 — OUTUBRO/2015',
    't7_role': 'Android Developer',
    't7_company': 'Jera (Campo Grande/MS)',
    't7_b1': 'Desenvolvimento ágil de aplicativos para startups (3 a 8 semanas)',
    't7_b2': 'Projetos em táxi, pecuária, jurídico, entre outros',

    't8_date': 'AGOSTO/2009 — AGOSTO/2013',
    't8_role': 'Bacharel em Sistemas de Informação',
    't8_company': 'UFMS (Coxim/MS)',
    't8_b1': 'Graduação em Sistemas de Informação',
    't8_b2': 'Criação de startup acadêmica e app móvel para musculação',

    // Apps Page
    'apps_title_part1': 'Aplicações ',
    'apps_title_part2': ' Ferramentas',
    'apps_game_desc':
        'Um jogo de quebra-cabeça e travessia desafiador construído com Flutter e Flame Engine, rodando inteiramente na web.',

    // Links Page
    'links_subtitle': 'Senior Mobile Developer. Criando aplicativos de alta performance, elegantes e acessíveis.',
    'cta_title_part1': 'Vamos construir algo ',
    'cta_title_part2': 'extraordinário',
    'cta_title_part3': '?',
    'cta_desc': 'Estou sempre aberto a novas colaborações e desafios técnicos complexos.',

    // Blog Page
    'blog_page_title': 'Blog | Rodrigo Castro',
    'blog_meta_desc': 'Escritos e pensamentos sobre design, arquitetura e desenvolvimento web por Rodrigo Castro.',
    'blog_meta_keywords': 'blog, design, brutalismo, webassembly, minimalismo, arquitetura moderna',
    'blog_hero_subtitle': 'Pensamentos & Artigos',
    'blog_hero_title_1': 'Escritos sobre design,',
    'blog_hero_title_2': 'arquitetura e código.',
    'blog_search_placeholder': 'Pesquisar artigos...',
    'blog_no_posts': 'Nenhum artigo encontrado',
    'blog_no_posts_desc': 'Tente buscar por termos diferentes ou selecione outra categoria.',
    'blog_featured': 'Destaque',
    'blog_newsletter_title': 'Fique por dentro das novidades.',
    'blog_newsletter_desc': 'Receba artigos exclusivos e insights sobre o futuro do design e tecnologia diretamente no seu e-mail.',
    'blog_newsletter_email_placeholder': 'seu@email.com',
    'blog_newsletter_button': 'Inscrever-se',

    // Post Detail Page
    'post_not_found_title': 'Artigo não encontrado',
    'post_not_found_desc': 'Desculpe, o artigo que você está procurando não existe ou foi removido.',
    'post_back_to_blog': 'VOLTAR AO BLOG',
    'post_liked_it': 'Gostou do post?',
    'post_follow_devto': 'Seguir no Dev.to',
    'post_see_all': 'Ver todos os artigos',
    'post_related_article': 'Artigo Relacionado',
    'post_view_article_devto': 'Ver artigo no Dev.to',

    // Categories
    'cat_all': 'Tudo',
    'cat_design': 'Design',
    'cat_tech': 'Tecnologia',
    'cat_career': 'Carreira',
  },
  'en': {
    'nav_journey': 'Journey',
    'nav_blog': 'Blog',
    'nav_links': 'Links',
    'nav_apps': 'Apps',
    'nav_contact': 'Contact',

    'hero_role': 'Senior Mobile Developer',
    'hero_title_part1': 'Developing high-performance applications with ',
    'hero_title_part2': ' and ',
    'hero_desc':
        'Over 10 years of experience building elegant, accessible, and scalable applications for millions of users in e-commerce and finance.',
    'btn_projects': 'VIEW PROJECTS',
    'btn_about': 'ABOUT ME',

    'journey_title': 'JOURNEY',
    'journey_subtitle': 'Mobile Specialist',
    'journey_skill': 'Accessibility & CI/CD',
    'journey_exp': '+10 years of experience',
    'journey_desc': 'A path marked by the constant pursuit of technical excellence and design innovation.',
    'journey_history_title': 'Professional History',
    'btn_start_conversation': 'START CONVERSATION',

    'skills_title': 'Skills & Mastery',
    'skill_android_title': 'Native Android',
    'skill_android_desc': 'Kotlin, Java, Android SDK, Clean Architecture, Autofill APIs.',
    'skill_flutter_title': 'Flutter & Dart',
    'skill_flutter_desc': 'Flutter Framework, Dart, React Native, Flame Engine, Accessibility.',
    'skill_quality_title': 'Quality & CI/CD',
    'skill_quality_desc': 'Unit & Automated Testing, Continuous Integration (CI/CD), AWS.',

    // Timeline Date / Info
    't1_date': 'JULY/2022 — PRESENT',
    't1_role': 'Senior Mobile Developer',
    't1_company': 'BAUHAUS (Mannheim, Germany)',
    't1_b1': 'Flutter E-Commerce App (Germany, Spain, Austria, Switzerland)',
    't1_b2': 'Accessibility adjustments in partnership with the Design team',
    't1_b3': 'Continuous Integration (CI/CD) and Automated Testing',

    't2_date': 'APRIL/2020 — JULY/2022',
    't2_role': 'Senior Mobile Developer',
    't2_company': 'Avira / NortonLifeLock (Tettnang, Germany)',
    't2_b1': 'Porting the native Android Password Manager to Flutter',
    't2_b2': 'Integration with AWS backend and usage of Autofill APIs',
    't2_b3': 'React Native White-Label solution post-NortonLifeLock acquisition',

    't3_date': 'JULY/2019 — APRIL/2020',
    't3_role': 'Android & Flutter Developer',
    't3_company': 'Easynvest (São Paulo, Brazil)',
    't3_b1': 'Evolution of Fixed and Variable Income investment apps',
    't3_b2': 'Hybrid and native development with Flutter & Android',

    't4_date': 'JUNE/2017 — JULY/2019',
    't4_role': 'Android Developer',
    't4_company': 'Concrete (São Paulo, Brazil)',
    't4_b1': 'Evolution of a global hypermarket app and a major bank app',
    't4_b2': 'Code review and best practices in Android',

    't5_date': 'DECEMBER/2016 — JUNE/2017',
    't5_role': 'Android Developer',
    't5_company': 'IBM (São Paulo, Brazil)',
    't5_b1': 'Development of a native chat library (SDK) for a major bank',
    't5_b2': 'Technical evolution of the main corporate application',

    't6_date': 'JANUARY/2016 — DECEMBER/2016',
    't6_role': 'Android Developer',
    't6_company': 'Rede Tendência (Campo Grande, Brazil)',
    't6_b1': 'Evolution of an application integrated with the Salesforce ecosystem',
    't6_b2': 'Technical collaboration and support for multiple Android teams',

    't7_date': 'JUNE/2014 — OCTOBER/2015',
    't7_role': 'Android Developer',
    't7_company': 'Jera (Campo Grande, Brazil)',
    't7_b1': 'Agile app development for startups (3 to 8 weeks)',
    't7_b2': 'Projects in taxi, cattle management, legal fields, among others',

    't8_date': 'AUGUST/2009 — AUGUST/2013',
    't8_role': 'Bachelor of Information Systems',
    't8_company': 'UFMS (Coxim, Brazil)',
    't8_b1': 'Degree in Information Systems',
    't8_b2': 'Creation of an academic startup and a mobile app for bodybuilding',

    // Apps Page
    'apps_title_part1': 'Applications ',
    'apps_title_part2': ' Tools',
    'apps_game_desc':
        'A challenging river crossing puzzle game built with Flutter and Flame Engine, running entirely on the web.',

    // Links Page
    'links_subtitle': 'Senior Mobile Developer. Creating high-performance, elegant, and accessible applications.',
    'cta_title_part1': "Let's build something ",
    'cta_title_part2': 'extraordinary',
    'cta_title_part3': '?',
    'cta_desc': 'I am always open to new collaborations and complex technical challenges.',

    // Blog Page
    'blog_page_title': 'Blog | Rodrigo Castro',
    'blog_meta_desc': 'Writings and thoughts on design, architecture, and web development by Rodrigo Castro.',
    'blog_meta_keywords': 'blog, design, brutalism, webassembly, minimalism, modern architecture',
    'blog_hero_subtitle': 'Thoughts & Articles',
    'blog_hero_title_1': 'Writings on design,',
    'blog_hero_title_2': 'architecture and code.',
    'blog_search_placeholder': 'Search articles...',
    'blog_no_posts': 'No articles found',
    'blog_no_posts_desc': 'Try searching for different terms or select another category.',
    'blog_featured': 'Featured',
    'blog_newsletter_title': 'Stay updated with news.',
    'blog_newsletter_desc': 'Receive exclusive articles and insights about the future of design and technology directly in your inbox.',
    'blog_newsletter_email_placeholder': 'your@email.com',
    'blog_newsletter_button': 'Subscribe',

    // Post Detail Page
    'post_not_found_title': 'Article not found',
    'post_not_found_desc': "Sorry, the article you are looking for doesn't exist or has been removed.",
    'post_back_to_blog': 'BACK TO BLOG',
    'post_liked_it': 'Liked the post?',
    'post_follow_devto': 'Follow on Dev.to',
    'post_see_all': 'View all articles',
    'post_related_article': 'Related Article',
    'post_view_article_devto': 'View article on Dev.to',

    // Categories
    'cat_all': 'All',
    'cat_design': 'Design',
    'cat_tech': 'Technology',
    'cat_career': 'Career',
  },
};
