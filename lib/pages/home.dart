import 'package:jaspr/dom.dart';
import 'package:jaspr/jaspr.dart';

import '../components/translation_provider.dart';

class Home extends StatefulComponent {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Component build(BuildContext context) {
    return main_(
      classes: 'pt-20 bg-pico-dark-blue text-pico-white min-h-screen',
      [
        Document.head(
          title: 'Journey | Rodrigo Castro',
          meta: {
            'description':
                'A trajetória profissional de Rodrigo Castro, Senior Mobile Developer especialista em Flutter, Dart e desenvolvimento de aplicativos.',
            'keywords':
                'flutter developer, senior mobile engineer, dart, android, ios, react native, developer portfolio, rodrigo de souza castro',
          },
        ),

        // Custom Cursor element
        div(id: 'cursor', classes: 'custom-cursor hidden md:block', []),

        // Hero Section
        section(
          classes:
              'relative min-h-[90vh] flex flex-col justify-center items-center px-margin-mobile text-center overflow-hidden bg-[radial-gradient(#5F574F_1px,transparent_1px)] [background-size:20px_20px]',
          [
            div(
              classes: 'relative z-10 max-w-[900px] py-16',
              [
                span(
                  classes:
                      'inline-block font-label-sm text-[16px] md:text-[20px] text-pico-yellow tracking-[0.2em] mb-unit-4 bg-pico-black px-4 py-2 border-2 border-pico-yellow uppercase',
                  [.text(context.t('hero_role'))],
                ),
                h1(
                  classes:
                      'font-headline-lg-mobile md:font-headline-lg text-[36px] md:text-[64px] text-pico-white mb-unit-8 leading-tight',
                  [
                    .text(context.t('hero_title_part1')),
                    span(classes: 'text-pico-blue uppercase', [.text('Flutter')]),
                    .text(context.t('hero_title_part2')),
                    span(classes: 'text-pico-red uppercase', [.text('Dart')]),
                    .text('.'),
                  ],
                ),
                p(
                  classes:
                      'font-body-lg text-[18px] md:text-[22px] text-pico-light-grey max-w-[750px] mx-auto mb-unit-12',
                  [
                    .text(context.t('hero_desc')),
                  ],
                ),
                div(
                  classes: 'flex flex-col sm:flex-row gap-unit-4 justify-center items-center',
                  [
                    a(
                      classes:
                          'w-full sm:w-auto text-center inline-block bg-pico-red text-pico-white font-label-md text-label-md px-unit-8 py-unit-4 border-2 border-pico-black shadow-[4px_4px_0px_#000] hover:translate-x-[2px] hover:translate-y-[2px] hover:shadow-none transition-all uppercase font-bold cursor-pointer text-decoration-none',
                      href: '/apps',
                      [.text(context.t('btn_projects'))],
                    ),
                    a(
                      classes:
                          'w-full sm:w-auto text-center inline-block bg-pico-black text-pico-blue border-2 border-pico-blue font-label-md text-label-md px-unit-8 py-unit-4 shadow-[4px_4px_0px_#1D2B53] hover:translate-x-[2px] hover:translate-y-[2px] hover:shadow-none transition-all uppercase font-bold cursor-pointer text-decoration-none',
                      href: 'https://www.linkedin.com/in/castrodev/',
                      [.text(context.t('btn_about'))],
                    ),
                  ],
                ),
              ],
            ),
            div(
              classes: 'absolute bottom-10 left-1/2 -translate-x-1/2 animate-bounce',
              [
                span(classes: 'material-symbols-outlined text-pico-yellow', [.text('keyboard_double_arrow_down')]),
              ],
            ),
          ],
        ),

        // Journey Section
        section(
          classes: 'py-unit-12 px-margin-mobile max-w-[1120px] mx-auto',
          [
            div(
              classes: 'flex flex-col md:flex-row gap-unit-12',
              [
                aside(
                  classes: 'md:w-1/3',
                  [
                    h2(
                      classes:
                          'font-headline-md text-headline-md text-pico-white mb-unit-4 border-l-8 border-pico-blue pl-unit-4 uppercase',
                      [.text(context.t('journey_history_title'))],
                    ),
                    p(
                      classes: 'font-body-md text-body-md text-pico-light-grey mb-unit-8',
                      [
                        .text(context.t('journey_desc')),
                      ],
                    ),
                    div(
                      classes: 'space-y-unit-2',
                      [
                        div(
                          classes: 'flex items-center gap-unit-2 bg-pico-black p-2 border border-pico-dark-grey',
                          [
                            span(classes: 'material-symbols-outlined text-pico-green text-sm', [.text('terminal')]),
                            span(classes: 'font-label-sm text-label-sm text-pico-light-grey uppercase', [
                              .text(context.t('journey_exp')),
                            ]),
                          ],
                        ),
                        div(
                          classes: 'flex items-center gap-unit-2 bg-pico-black p-2 border border-pico-dark-grey',
                          [
                            span(classes: 'material-symbols-outlined text-pico-blue text-sm', [.text('phone_android')]),
                            span(classes: 'font-label-sm text-label-sm text-pico-light-grey uppercase', [
                              .text(context.t('journey_subtitle')),
                            ]),
                          ],
                        ),
                        div(
                          classes: 'flex items-center gap-unit-2 bg-pico-black p-2 border border-pico-dark-grey',
                          [
                            span(classes: 'material-symbols-outlined text-pico-red text-sm', [
                              .text('settings_suggest'),
                            ]),
                            span(classes: 'font-label-sm text-label-sm text-pico-light-grey uppercase', [
                              .text(context.t('journey_skill')),
                            ]),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                div(
                  classes: 'md:w-2/3 relative pl-unit-8',
                  [
                    // Vertical Line
                    div(classes: 'absolute left-0 top-0 bottom-0 w-[4px] timeline-line', []),

                    // Journey Items
                    div(
                      classes: 'space-y-unit-12',
                      [
                        // Item 1: BAUHAUS
                        div(
                          classes: 'relative pl-unit-8 group',
                          [
                            div(
                              classes:
                                  'absolute left-[-10px] top-2 w-5 h-5 bg-pico-black border-4 border-pico-red z-10 group-hover:bg-pico-red transition-colors',
                              [],
                            ),
                            span(classes: 'font-label-sm text-label-sm text-pico-yellow mb-unit-1 block uppercase', [
                              .text(context.t('t1_date')),
                            ]),
                            h3(classes: 'font-headline-sm text-headline-sm text-pico-white mb-unit-1', [
                              .text(context.t('t1_role')),
                            ]),
                            p(
                              classes: 'font-label-md text-label-md text-pico-red mb-unit-4 tracking-widest uppercase',
                              [.text(context.t('t1_company'))],
                            ),
                            div(
                              classes: 'p-unit-4 bg-pico-black border border-pico-dark-grey',
                              [
                                ul(
                                  classes:
                                      'list-disc list-inside space-y-1 font-body-md text-body-md text-pico-light-grey',
                                  [
                                    li([.text(context.t('t1_b1'))]),
                                    li([.text(context.t('t1_b2'))]),
                                    li([.text(context.t('t1_b3'))]),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Item 2: Avira
                        div(
                          classes: 'relative pl-unit-8 group',
                          [
                            div(
                              classes:
                                  'absolute left-[-10px] top-2 w-5 h-5 bg-pico-black border-4 border-pico-blue z-10 group-hover:bg-pico-blue transition-colors',
                              [],
                            ),
                            span(classes: 'font-label-sm text-label-sm text-pico-yellow mb-unit-1 block uppercase', [
                              .text(context.t('t2_date')),
                            ]),
                            h3(classes: 'font-headline-sm text-headline-sm text-pico-white mb-unit-1', [
                              .text(context.t('t2_role')),
                            ]),
                            p(
                              classes: 'font-label-md text-label-md text-pico-blue mb-unit-4 tracking-widest uppercase',
                              [.text(context.t('t2_company'))],
                            ),
                            div(
                              classes: 'p-unit-4 bg-pico-black border border-pico-dark-grey',
                              [
                                ul(
                                  classes:
                                      'list-disc list-inside space-y-1 font-body-md text-body-md text-pico-light-grey',
                                  [
                                    li([.text(context.t('t2_b1'))]),
                                    li([.text(context.t('t2_b2'))]),
                                    li([.text(context.t('t2_b3'))]),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Item 3: Easynvest
                        div(
                          classes: 'relative pl-unit-8 group',
                          [
                            div(
                              classes:
                                  'absolute left-[-10px] top-2 w-5 h-5 bg-pico-black border-4 border-pico-green z-10 group-hover:bg-pico-green transition-colors',
                              [],
                            ),
                            span(classes: 'font-label-sm text-label-sm text-pico-yellow mb-unit-1 block uppercase', [
                              .text(context.t('t3_date')),
                            ]),
                            h3(classes: 'font-headline-sm text-headline-sm text-pico-white mb-unit-1', [
                              .text(context.t('t3_role')),
                            ]),
                            p(
                              classes:
                                  'font-label-md text-label-md text-pico-green mb-unit-4 tracking-widest uppercase',
                              [.text(context.t('t3_company'))],
                            ),
                            div(
                              classes: 'p-unit-4 bg-pico-black border border-pico-dark-grey',
                              [
                                ul(
                                  classes:
                                      'list-disc list-inside space-y-1 font-body-md text-body-md text-pico-light-grey',
                                  [
                                    li([.text(context.t('t3_b1'))]),
                                    li([.text(context.t('t3_b2'))]),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Item 4: Concrete
                        div(
                          classes: 'relative pl-unit-8 group',
                          [
                            div(
                              classes:
                                  'absolute left-[-10px] top-2 w-5 h-5 bg-pico-black border-4 border-pico-yellow z-10 group-hover:bg-pico-yellow transition-colors',
                              [],
                            ),
                            span(classes: 'font-label-sm text-label-sm text-pico-yellow mb-unit-1 block uppercase', [
                              .text(context.t('t4_date')),
                            ]),
                            h3(classes: 'font-headline-sm text-headline-sm text-pico-white mb-unit-1', [
                              .text(context.t('t4_role')),
                            ]),
                            p(
                              classes:
                                  'font-label-md text-label-md text-pico-yellow mb-unit-4 tracking-widest uppercase',
                              [.text(context.t('t4_company'))],
                            ),
                            div(
                              classes: 'p-unit-4 bg-pico-black border border-pico-dark-grey',
                              [
                                ul(
                                  classes:
                                      'list-disc list-inside space-y-1 font-body-md text-body-md text-pico-light-grey',
                                  [
                                    li([.text(context.t('t4_b1'))]),
                                    li([.text(context.t('t4_b2'))]),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Item 5: IBM
                        div(
                          classes: 'relative pl-unit-8 group',
                          [
                            div(
                              classes:
                                  'absolute left-[-10px] top-2 w-5 h-5 bg-pico-black border-4 border-pico-pink z-10 group-hover:bg-pico-pink transition-colors',
                              [],
                            ),
                            span(classes: 'font-label-sm text-label-sm text-pico-yellow mb-unit-1 block uppercase', [
                              .text(context.t('t5_date')),
                            ]),
                            h3(classes: 'font-headline-sm text-headline-sm text-pico-white mb-unit-1', [
                              .text(context.t('t5_role')),
                            ]),
                            p(
                              classes: 'font-label-md text-label-md text-pico-pink mb-unit-4 tracking-widest uppercase',
                              [.text(context.t('t5_company'))],
                            ),
                            div(
                              classes: 'p-unit-4 bg-pico-black border border-pico-dark-grey',
                              [
                                ul(
                                  classes:
                                      'list-disc list-inside space-y-1 font-body-md text-body-md text-pico-light-grey',
                                  [
                                    li([.text(context.t('t5_b1'))]),
                                    li([.text(context.t('t5_b2'))]),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Item 6: Rede Tendência
                        div(
                          classes: 'relative pl-unit-8 group',
                          [
                            div(
                              classes:
                                  'absolute left-[-10px] top-2 w-5 h-5 bg-pico-black border-4 border-pico-orange z-10 group-hover:bg-pico-orange transition-colors',
                              [],
                            ),
                            span(classes: 'font-label-sm text-label-sm text-pico-yellow mb-unit-1 block uppercase', [
                              .text(context.t('t6_date')),
                            ]),
                            h3(classes: 'font-headline-sm text-headline-sm text-pico-white mb-unit-1', [
                              .text(context.t('t6_role')),
                            ]),
                            p(
                              classes:
                                  'font-label-md text-label-md text-pico-orange mb-unit-4 tracking-widest uppercase',
                              [.text(context.t('t6_company'))],
                            ),
                            div(
                              classes: 'p-unit-4 bg-pico-black border border-pico-dark-grey',
                              [
                                ul(
                                  classes:
                                      'list-disc list-inside space-y-1 font-body-md text-body-md text-pico-light-grey',
                                  [
                                    li([.text(context.t('t6_b1'))]),
                                    li([.text(context.t('t6_b2'))]),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Item 7: Jera
                        div(
                          classes: 'relative pl-unit-8 group',
                          [
                            div(
                              classes:
                                  'absolute left-[-10px] top-2 w-5 h-5 bg-pico-black border-4 border-pico-peach z-10 group-hover:bg-pico-peach transition-colors',
                              [],
                            ),
                            span(classes: 'font-label-sm text-label-sm text-pico-yellow mb-unit-1 block uppercase', [
                              .text(context.t('t7_date')),
                            ]),
                            h3(classes: 'font-headline-sm text-headline-sm text-pico-white mb-unit-1', [
                              .text(context.t('t7_role')),
                            ]),
                            p(
                              classes:
                                  'font-label-md text-label-md text-pico-peach mb-unit-4 tracking-widest uppercase',
                              [.text(context.t('t7_company'))],
                            ),
                            div(
                              classes: 'p-unit-4 bg-pico-black border border-pico-dark-grey',
                              [
                                ul(
                                  classes:
                                      'list-disc list-inside space-y-1 font-body-md text-body-md text-pico-light-grey',
                                  [
                                    li([.text(context.t('t7_b1'))]),
                                    li([.text(context.t('t7_b2'))]),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Item 8: UFMS
                        div(
                          classes: 'relative pl-unit-8 group',
                          [
                            div(
                              classes:
                                  'absolute left-[-10px] top-2 w-5 h-5 bg-pico-black border-4 border-pico-yellow z-10 group-hover:bg-pico-yellow transition-colors',
                              [],
                            ),
                            span(classes: 'font-label-sm text-label-sm text-pico-yellow mb-unit-1 block uppercase', [
                              .text(context.t('t8_date')),
                            ]),
                            h3(classes: 'font-headline-sm text-headline-sm text-pico-white mb-unit-1', [
                              .text(context.t('t8_role')),
                            ]),
                            p(
                              classes:
                                  'font-label-md text-label-md text-pico-yellow mb-unit-4 tracking-widest uppercase',
                              [.text(context.t('t8_company'))],
                            ),
                            div(
                              classes: 'p-unit-4 bg-pico-black border border-pico-dark-grey',
                              [
                                ul(
                                  classes:
                                      'list-disc list-inside space-y-1 font-body-md text-body-md text-pico-light-grey',
                                  [
                                    li([.text(context.t('t8_b1'))]),
                                    li([.text(context.t('t8_b2'))]),
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
          ],
        ),

        // Skills Section
        section(
          classes: 'py-unit-12 bg-pico-black border-y-4 border-pico-dark-grey',
          [
            div(
              classes: 'max-w-[1120px] mx-auto px-margin-mobile',
              [
                div(
                  classes: 'text-center mb-unit-12',
                  [
                    h2(
                      classes: 'font-headline-md text-headline-md text-pico-white mb-unit-4 uppercase tracking-widest',
                      [.text(context.t('skills_title'))],
                    ),
                    div(classes: 'h-1 w-24 bg-pico-red mx-auto', []),
                  ],
                ),
                div(
                  classes: 'grid grid-cols-1 md:grid-cols-3 gap-unit-8',
                  [
                    // Skill 1: Android Nativo
                    div(
                      classes: 'pico-card p-unit-8 flex flex-col items-center text-center',
                      [
                        div(
                          classes:
                              'w-16 h-16 bg-pico-dark-blue border-2 border-pico-blue flex items-center justify-center mb-unit-4',
                          [
                            span(classes: 'material-symbols-outlined text-pico-blue text-3xl', [
                              .text('android'),
                            ]),
                          ],
                        ),
                        h4(classes: 'font-headline-sm text-headline-sm text-pico-white mb-unit-2 uppercase', [
                          .text(context.t('skill_android_title')),
                        ]),
                        p(classes: 'font-label-sm text-label-sm text-pico-light-grey uppercase', [
                          .text(context.t('skill_android_desc')),
                        ]),
                      ],
                    ),
                    // Skill 2: Flutter & Dart (Featured)
                    div(
                      classes:
                          'pico-card p-unit-8 flex flex-col items-center text-center border-pico-red md:scale-105 z-10',
                      [
                        div(
                          classes:
                              'w-16 h-16 bg-pico-red border-2 border-pico-white flex items-center justify-center mb-unit-4',
                          [
                            span(classes: 'material-symbols-outlined text-pico-white text-3xl', [
                              .text('devices'),
                            ]),
                          ],
                        ),
                        h4(classes: 'font-headline-sm text-headline-sm text-pico-white mb-unit-2 uppercase', [
                          .text(context.t('skill_flutter_title')),
                        ]),
                        p(classes: 'font-label-sm text-label-sm text-pico-light-grey uppercase', [
                          .text(context.t('skill_flutter_desc')),
                        ]),
                      ],
                    ),
                    // Skill 3: Qualidade & DevOps
                    div(
                      classes: 'pico-card p-unit-8 flex flex-col items-center text-center',
                      [
                        div(
                          classes:
                              'w-16 h-16 bg-pico-dark-blue border-2 border-pico-green flex items-center justify-center mb-unit-4',
                          [
                            span(classes: 'material-symbols-outlined text-pico-green text-3xl', [.text('build')]),
                          ],
                        ),
                        h4(classes: 'font-headline-sm text-headline-sm text-pico-white mb-unit-2 uppercase', [
                          .text(context.t('skill_quality_title')),
                        ]),
                        p(classes: 'font-label-sm text-label-sm text-pico-light-grey uppercase', [
                          .text(context.t('skill_quality_desc')),
                        ]),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),

        // CTA Section
        section(
          classes: 'py-unit-12 px-margin-mobile',
          [
            div(
              classes:
                  'max-w-[1120px] mx-auto bg-pico-black border-4 border-pico-white overflow-hidden flex flex-col md:flex-row items-stretch',
              [
                div(
                  classes: 'md:w-1/2 p-unit-8 flex flex-col justify-center',
                  [
                    h2(
                      classes:
                          'font-headline-lg-mobile text-headline-lg-mobile text-pico-white mb-unit-8 uppercase italic tracking-tighter',
                      [
                        .text(context.t('cta_title_part1')),
                        span(classes: 'text-pico-yellow', [.text(context.t('cta_title_part2'))]),
                        .text(context.t('cta_title_part3')),
                      ],
                    ),
                    p(
                      classes: 'font-body-lg text-body-lg text-pico-light-grey mb-unit-12',
                      [.text(context.t('cta_desc'))],
                    ),
                    a(
                      classes:
                          'inline-block bg-pico-blue text-pico-black font-label-md text-label-md px-unit-8 py-unit-4 border-4 border-pico-black shadow-[8px_8px_0px_#5F574F] hover:translate-x-[4px] hover:translate-y-[4px] hover:shadow-none transition-all uppercase font-bold self-start cursor-pointer text-decoration-none',
                      href: 'mailto:rodrigodesouzacastro@gmail.com',
                      [.text(context.t('btn_start_conversation'))],
                    ),
                  ],
                ),
                div(
                  classes: 'md:w-1/2 w-full min-h-[400px] relative border-l-4 border-pico-white',
                  [
                    div(
                      classes: 'absolute inset-0 bg-cover bg-center grayscale contrast-125 brightness-75',
                      styles: Styles(
                        raw: const {
                          'background-image':
                              "url('https://lh3.googleusercontent.com/aida-public/AB6AXuBk8zZYez63Of2lnmT0ozs6lHUyhGecCOGql5Nzh1gtmWMZRuRyX0JlV25Haq8xBvyDwVtyLf87C2lv2k_Ptlpd5CmU6_AlagDVCToltzeOUFioLpYkDw5LAN5_emNK3YKQ9P3EVCkjY82JT3MOmRB1WAau-0XVzA-4M48Jmpay6TpbMShwBQBw0gfXweDazNQIpYoVZAMn_qfqWenvmnAlhMOYLRvK8K-FYSgRHuPwlc1MI5S6ZdCy')",
                        },
                      ),
                      [],
                    ),
                    div(
                      classes: 'absolute inset-0 bg-gradient-to-r from-pico-black via-transparent to-transparent',
                      [],
                    ),
                    div(classes: 'absolute inset-0 border-4 border-pico-red/30 pointer-events-none', []),
                  ],
                ),
              ],
            ),
          ],
        ),

        // Inline Cursor script
        script(
          content: '''
          (function() {
            const cursor = document.getElementById('cursor');
            if (cursor) {
              document.addEventListener('mousemove', (e) => {
                cursor.style.left = e.clientX - 8 + 'px';
                cursor.style.top = e.clientY - 8 + 'px';
              });
              
              document.querySelectorAll('button, a, .group, .pico-card').forEach(item => {
                item.addEventListener('mouseenter', () => {
                  cursor.style.transform = 'scale(2.5)';
                  cursor.style.background = '#FF004D';
                  cursor.style.borderColor = '#FFF1E8';
                });
                item.addEventListener('mouseleave', () => {
                  cursor.style.transform = 'scale(1)';
                  cursor.style.background = 'transparent';
                  cursor.style.borderColor = '#FFEC27';
                });
              });
            }
          })();
        ''',
        ),
      ],
    );
  }
}
