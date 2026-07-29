import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/translation_provider.dart';
import '../models/post.dart';
import '../data/posts.dart';
import '../utils/firebase_tracker.dart';

String _translateCategory(BuildContext context, String category) {
  switch (category) {
    case 'Tecnologia':
      return context.t('cat_tech');
    case 'Carreira':
      return context.t('cat_career');
    case 'Design':
      return context.t('cat_design');
    default:
      return category;
  }
}

String _translateReadingTime(BuildContext context, String readingTime) {
  if (context.locale == 'en') {
    return readingTime.replaceAll('min de leitura', 'min read');
  }
  return readingTime;
}

class Blog extends StatefulComponent {
  const Blog({super.key});

  @override
  State<Blog> createState() => BlogState();
}

class BlogState extends State<Blog> {
  String _selectedCategory = 'Tudo';
  String _searchQuery = '';

  List<Post> get _filteredPosts {
    return allPosts.where((post) {
      final matchesCategory = _selectedCategory == 'Tudo' || post.category == _selectedCategory;
      final matchesSearch =
          post.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          post.summary.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Component build(BuildContext context) {
    trackPageView('Blog');
    final posts = _filteredPosts;
    final featuredPost = posts.firstWhere(
      (postItem) => postItem.isFeatured,
      orElse: () => posts.isNotEmpty
          ? posts.first
          : const Post(
              id: '',
              slug: '',
              title: '',
              category: '',
              date: '',
              summary: '',
              bodyMarkdown: '',
              imageUrl: '',
              readingTime: '',
            ),
    );
    final otherPosts = posts.where((postItem) => posts.length <= 1 || postItem != featuredPost).toList();

    final categories = [
      (key: 'Tudo', label: context.t('cat_all')),
      (key: 'Design', label: context.t('cat_design')),
      (key: 'Tecnologia', label: context.t('cat_tech')),
      (key: 'Carreira', label: context.t('cat_career')),
    ];

    return main_(
      classes: 'pt-20 bg-[#011038] text-[#dbe1ff] min-h-screen pb-unit-12',
      [
        Document.head(
          title: context.t('blog_page_title'),
          meta: {
            'description': context.t('blog_meta_desc'),
            'keywords': context.t('blog_meta_keywords'),
          },
        ),

        // Hero Section
        section(
          classes: 'max-w-container-max mx-auto px-margin-mobile mb-unit-12 pt-unit-12',
          [
            span(classes: 'font-label-sm text-pico-orange mb-unit-2 block tracking-widest uppercase', [
              .text(context.t('blog_hero_subtitle')),
            ]),
            h1(
              classes:
                  'font-headline-lg-mobile md:font-headline-lg text-[40px] md:text-[56px] text-pico-white mb-unit-8 uppercase leading-none',
              [
                .text(context.t('blog_hero_title_1')),
                const br(),
                .text(context.t('blog_hero_title_2')),
              ],
            ),

            // Search & Filters
            div(
              classes:
                  'flex flex-col md:flex-row gap-unit-4 items-center justify-between border-b-2 border-pico-dark-grey pb-unit-8',
              [
                div(
                  classes: 'flex gap-unit-2 overflow-x-auto w-full md:w-auto pb-unit-2 md:pb-0 no-scrollbar',
                  [
                    for (var cat in categories)
                      button(
                        classes: _selectedCategory == cat.key
                            ? 'px-unit-4 py-unit-1 bg-primary text-pico-black font-label-sm uppercase rounded-full whitespace-nowrap cursor-pointer mr-2'
                            : 'px-unit-4 py-unit-1 bg-pico-dark-blue border border-pico-dark-grey text-on-surface-variant hover:text-primary font-label-sm uppercase rounded-full transition-all whitespace-nowrap cursor-pointer mr-2',
                        events: {
                          'click': (_) {
                            setState(() {
                              _selectedCategory = cat.key;
                            });
                          },
                        },
                        [.text(cat.label)],
                      ),
                  ],
                ),
                div(
                  classes: 'relative w-full md:w-80 group',
                  [
                    span(
                      classes:
                          'material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-pico-dark-grey group-focus-within:text-primary transition-colors',
                      [.text('search')],
                    ),
                    input(
                      classes:
                          'w-full bg-pico-dark-blue border-2 border-pico-dark-grey focus:border-primary rounded-xl pl-10 pr-unit-4 py-unit-2 font-label-md text-pico-white placeholder:text-pico-dark-grey outline-none',
                      attributes: {'placeholder': context.t('blog_search_placeholder')},
                      type: InputType.text,
                      events: {
                        'input': (e) {
                          final value = (e.target as dynamic).value ?? '';
                          setState(() {
                            _searchQuery = value;
                          });
                        },
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        // Main Grid Section
        if (posts.isEmpty)
          section(
            classes: 'max-w-container-max mx-auto px-margin-mobile py-16 text-center',
            [
              span(classes: 'material-symbols-outlined text-[64px] text-pico-dark-grey mb-4', [.text('folder_open')]),
              h3(classes: 'font-headline-sm text-pico-white', [.text(context.t('blog_no_posts'))]),
              p(classes: 'text-on-surface-variant mt-2', [
                .text(context.t('blog_no_posts_desc')),
              ]),
            ],
          )
        else
          section(
            classes: 'max-w-container-max mx-auto px-margin-mobile',
            [
              div(
                classes: 'grid grid-cols-1 md:grid-cols-12 gap-gutter',
                [
                  // Featured Post
                  if (featuredPost.title.isNotEmpty)
                    a(
                      href: '/blog/detail?id=${featuredPost.id}',
                      classes: 'md:col-span-8 group cursor-pointer text-decoration-none block',
                      [
                        article(
                          classes: 'w-full',
                          [
                            div(
                              classes:
                                  'pico-border overflow-hidden rounded-xl aspect-[16/9] mb-unit-4 bg-pico-dark-blue relative',
                              [
                                img(
                                  classes:
                                      'w-full h-full object-cover transition-transform duration-700 group-hover:scale-105 opacity-60 group-hover:opacity-100 grayscale group-hover:grayscale-0',
                                  src: featuredPost.imageUrl,
                                ),
                                div(
                                  classes: 'absolute top-4 left-4',
                                  [
                                    span(
                                      classes:
                                          'px-unit-2 py-1 bg-pico-orange text-pico-black font-label-sm uppercase rounded border border-pico-black',
                                      [.text(context.t('blog_featured'))],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            div(
                              [
                                div(
                                  classes: 'flex items-center gap-unit-2 mb-unit-2',
                                  [
                                    span(classes: 'font-label-sm text-primary uppercase', [
                                      .text(_translateCategory(context, featuredPost.category)),
                                    ]),
                                    span(classes: 'w-1 h-1 bg-pico-dark-grey rounded-full', []),
                                    span(classes: 'font-label-sm text-on-surface-variant', [.text(featuredPost.date)]),
                                  ],
                                ),
                                h2(
                                  classes:
                                      'font-headline-md text-[32px] text-pico-white group-hover:text-primary transition-colors mb-unit-4 uppercase leading-tight',
                                  [.text(featuredPost.title)],
                                ),
                                p(classes: 'font-body-lg text-on-surface-variant line-clamp-2 max-w-2xl', [
                                  .text(featuredPost.summary),
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                  // Sidebar Posts
                  div(
                    classes: 'md:col-span-4 flex flex-col gap-unit-8',
                    [
                      for (var post in otherPosts.take(3))
                        a(
                          href: '/blog/detail?id=${post.id}',
                          classes: 'group cursor-pointer text-decoration-none block',
                          [
                            article(
                              [
                                div(
                                  classes: 'flex gap-unit-4',
                                  [
                                    div(
                                      classes:
                                          'w-24 h-24 shrink-0 rounded-lg overflow-hidden border-2 border-pico-dark-grey group-hover:border-primary transition-colors bg-pico-dark-blue',
                                      [
                                        img(
                                          classes:
                                              'w-full h-full object-cover grayscale group-hover:grayscale-0 transition-all',
                                          src: post.imageUrl,
                                        ),
                                      ],
                                    ),
                                    div(
                                      [
                                        span(classes: 'font-label-sm text-pico-dark-grey block mb-1', [
                                          .text(post.date),
                                        ]),
                                        h3(
                                          classes:
                                              'font-headline-sm text-[20px] text-pico-white group-hover:text-primary transition-colors leading-tight uppercase line-clamp-2',
                                          [.text(post.title)],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),

              // Bento Grid layout for secondary posts
              if (otherPosts.length > 3)
                div(
                  classes: 'grid grid-cols-1 md:grid-cols-3 gap-gutter mt-unit-8',
                  [
                    for (var post in otherPosts.skip(3))
                      a(
                        href: '/blog/detail?id=${post.id}',
                        classes: 'group cursor-pointer text-decoration-none block',
                        [
                          div(
                            classes:
                                'bg-pico-dark-blue p-unit-4 rounded-xl border-2 border-pico-dark-grey group-hover:border-primary transition-all shadow-[4px_4px_0px_#000000]',
                            [
                              div(
                                classes:
                                    'aspect-video rounded-lg overflow-hidden mb-unit-4 border border-pico-dark-grey bg-pico-black',
                                [
                                  img(
                                    classes:
                                        'w-full h-full object-cover opacity-60 grayscale group-hover:opacity-100 group-hover:grayscale-0 transition-all',
                                    src: post.imageUrl,
                                  ),
                                ],
                              ),
                              span(classes: 'font-label-sm text-pico-orange mb-unit-2 block uppercase', [
                                .text(_translateCategory(context, post.category)),
                              ]),
                              h3(
                                classes:
                                    'font-headline-sm text-[20px] mb-unit-2 text-pico-white uppercase line-clamp-1',
                                [.text(post.title)],
                              ),
                              p(classes: 'font-body-md text-on-surface-variant line-clamp-2', [.text(post.summary)]),
                              div(
                                classes:
                                    'mt-unit-8 pt-unit-4 border-t-2 border-pico-dark-grey flex justify-between items-center',
                                [
                                  span(classes: 'font-label-sm text-pico-dark-grey', [
                                    .text(_translateReadingTime(context, post.readingTime)),
                                  ]),
                                  span(
                                    classes:
                                        'material-symbols-outlined text-primary group-hover:translate-x-1 transition-transform',
                                    [.text('arrow_forward')],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),

              // Pagination
              div(
                classes: 'flex justify-center items-center gap-unit-4 mt-unit-12',
                [
                  button(
                    classes:
                        'w-10 h-10 flex items-center justify-center rounded-lg border-2 border-pico-dark-grey text-on-surface-variant hover:border-primary hover:text-primary transition-all shadow-[2px_2px_0px_#000000] active:translate-y-0.5 active:shadow-none cursor-pointer',
                    [
                      span(classes: 'material-symbols-outlined', [.text('chevron_left')]),
                    ],
                  ),
                  div(
                    classes: 'flex gap-unit-2',
                    [
                      button(
                        classes:
                            'w-10 h-10 flex items-center justify-center rounded-lg bg-primary text-pico-black font-label-sm border-2 border-pico-black shadow-[2px_2px_0px_#000000] cursor-pointer',
                        [.text('1')],
                      ),
                      button(
                        classes:
                            'w-10 h-10 flex items-center justify-center rounded-lg border-2 border-pico-dark-grey text-on-surface-variant hover:border-primary hover:text-primary font-label-sm transition-all shadow-[2px_2px_0px_#000000] active:translate-y-0.5 active:shadow-none cursor-pointer',
                        [.text('2')],
                      ),
                      button(
                        classes:
                            'w-10 h-10 flex items-center justify-center rounded-lg border-2 border-pico-dark-grey text-on-surface-variant hover:border-primary hover:text-primary font-label-sm transition-all shadow-[2px_2px_0px_#000000] active:translate-y-0.5 active:shadow-none cursor-pointer',
                        [.text('3')],
                      ),
                    ],
                  ),
                  button(
                    classes:
                        'w-10 h-10 flex items-center justify-center rounded-lg border-2 border-pico-dark-grey text-on-surface-variant hover:border-primary hover:text-primary transition-all shadow-[2px_2px_0px_#000000] active:translate-y-0.5 active:shadow-none cursor-pointer',
                    [
                      span(classes: 'material-symbols-outlined', [.text('chevron_right')]),
                    ],
                  ),
                ],
              ),
            ],
          ),

        // Newsletter Subscription
        section(
          classes: 'max-w-container-max mx-auto px-margin-mobile mt-unit-12',
          [
            div(
              classes:
                  'bg-pico-dark-blue rounded-2xl p-unit-8 border-4 border-pico-dark-grey relative overflow-hidden shadow-[8px_8px_0px_#000000]',
              [
                div(classes: 'absolute top-0 right-0 w-64 h-64 bg-primary/5 blur-3xl -mr-32 -mt-32', []),
                div(
                  classes: 'relative z-10 max-w-2xl',
                  [
                    h2(classes: 'font-headline-lg-mobile text-[32px] text-pico-white mb-unit-4 uppercase', [
                      .text(context.t('blog_newsletter_title')),
                    ]),
                    p(classes: 'font-body-lg text-on-surface-variant mb-unit-8', [
                      .text(context.t('blog_newsletter_desc')),
                    ]),
                    form(
                      classes: 'flex flex-col sm:flex-row gap-unit-4',
                      events: {
                        'submit': (e) {
                          (e as dynamic).preventDefault();
                        },
                      },
                      [
                        input(
                          classes:
                              'flex-grow bg-background border-2 border-pico-dark-grey focus:border-primary rounded-xl px-unit-4 py-unit-2 text-pico-white font-label-md outline-none',
                          attributes: {'placeholder': context.t('blog_newsletter_email_placeholder')},
                          type: InputType.email,
                        ),
                        button(
                          classes:
                              'bg-pico-orange text-pico-black px-unit-8 py-unit-2 font-label-sm uppercase rounded-xl hover:bg-pico-white transition-all active:translate-y-0.5 border-b-4 border-pico-brown cursor-pointer',
                          type: ButtonType.submit,
                          [.text(context.t('blog_newsletter_button'))],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
