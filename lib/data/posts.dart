import '../models/post.dart';

const List<Post> allPosts = [
  Post(
    id: '1653417',
    slug: 'how-i-migrated-the-icon-font-generation-in-my-flutter-app-and-why-3al7',
    title: r'''How I migrated the icon font generation in my Flutter app and why''',
    category: 'Tecnologia',
    date: '01 de Novembro, 2023',
    summary:
        r'''Versão em Português:                                        Como eu migrei o modo de gerar as fontes...''',
    bodyMarkdown: r'''Versão em Português:
{% embed https://dev.to/rodrigocastro_o/como-eu-migrei-o-modo-de-gerar-as-fontes-de-icones-no-meu-app-flutter-e-o-porque-2g68 %}


In the project I'm currently working on, we use a font just for icons. One way we found to generate these fonts was to submit all the SVGs to https://www.fluttericon.com/. 

The process basically involved:
1) Getting the SVG from the designer
2) Updating the site with the latest config.json
3) Inserting the new icon
4) Downloading the updated icon font
5) Copy and replace the new files (font, config.json and icons.dart) into the project, which sometimes required adjusting some things manually.

## What are the problems with this approach?

Our team currently consists of 5 Flutter developers and sometimes developers would create PRs where they both added icons and of course there were conflicts when it came to resolving these merges. The first developer to submit their changes would do fine, while the next person would have to deal with the conflicts manually, sometimes it was better to redo the whole process mentioned above, to resolve the conflicts more easily. I think this problem happened to me a few times and so I tried to find a more efficient way of doing this process.

## Which approaches should I take?

Searching for alternatives to improve this process, making it easier to generate the icons by thinking about automating most of the process, I found this lib dart https://pub.dev/packages/icon_font_generator that "under the hood" uses nodeJS to generate the icons, and I realized that the result was exactly what we were expecting, but it would solve everything in a command line to generate, without the need to open the Flutter Icon site. All we would need to input was the folder with all the SVGs to be able to generate our font locally.

There was just one small problem...

## Where are my SVGs?

Right at the start I ran into a very big problem. The SVG icons are used to generate the font and configuration files, but there's no way to download the SVGs back from fluttericon.com.

That's when I came across an excellent article by a developer called Sara, on how to retrieve SVG files from font-generating sites. It wasn't exactly about fluttericon.com, but it was something that caught my eye.

Link to her article:
https://www.sarasoueidan.com/blog/icon-fonts-to-svg/

Reading more about the article I realized that Flutter Icon is a fork of Fontello, one of the sites mentioned by Sara in the article.

Briefly, following the article:
1) upload the FlutterIcon config.json file in Fontello
2) download the fonts from Fontello
3) Import the Fontello fonts into Icomoon.app
4) Select all the icons and download them in SVG format

This way I got the SVGs back, whew!

## Putting the Icon Font Generator package to work

First I installed IconFontGenerator as global

```bash
dart pub get activate icon_font_generator
```
Next, I downloaded NodeJS via brew (MacOS):

```bash
brew install node
```
Just to be sure, I checked to see if it was pointing correctly (what was expected was something like `/opt/homebrew/bin/node`).

```bash
which node
```
Result:
```bash 
$ /opt/homebrew/opt/node@18/bin/node
```
Perfect, the last step is to run the icon_font_generator:

```bash
icon_font_generator --from=./assets/icons/svg --class-name=MyProjectIcons --out-font=./assets/icons/MyProjectIcons.ttf --out-flutter=./assets/icons/MyProject_icons.dart --naming-strategy=camel
```

Everything worked, and now our icon font generation process is much simpler and faster. 

I hope this has helped you

Until next time,''',
    imageUrl:
        'https://media2.dev.to/dynamic/image/width=1000,height=420,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2Fk11t7x1h3zos5jikygl2.jpeg',
    readingTime: '5 min de leitura',
    isFeatured: true,
  ),
  Post(
    id: '1653402',
    slug: 'como-eu-migrei-o-modo-de-gerar-as-fontes-de-icones-no-meu-app-flutter-e-o-porque-2g68',
    title: r'''Como eu migrei o modo de gerar as fontes de ícones no meu app Flutter e o porquê''',
    category: 'Tecnologia',
    date: '01 de Novembro, 2023',
    summary:
        r'''English version:                                        How I migrated the icon font generation in my...''',
    bodyMarkdown: r'''English version:
{% embed https://dev.to/rodrigocastro_o/how-i-migrated-the-icon-font-generation-in-my-flutter-app-and-why-3al7 %}

No projeto que atualmente trabalho a gente utiliza uma fonte só para ícones. Um jeito que achamos para gerar essas fontes foi submeter todos os SVGs para o site https://www.fluttericon.com/. 

O processo basicamente envolvia:
1) Pegar o SVG com o designer
2) Atualizar o site com o config.json mais atual
3) Inserir o ícone novo
4) Baixar a fonte dos ícone atualizadas
5) Copiar e substituir os novos arquivos (fonte, config.json e icons.dart) para dentro do projeto, o que as vezes precisava ajustar alguma coisa manualmente.

## Quais os problemas com essa abordagem?

O nosso time atualmente é composto por 5 desenvolvedores Flutter e as vezes os desenvolvedores criavam PRs onde ambos adicionavam ícones e é claro que aconteciam conflitos na hora de resolver esses merges. O primeiro desenvolvedor a submeter suas mudanças se dava bem, já a próxima pessoa teria que tratar os conflitos manualmente, as vezes era melhor refazer todo o processo citado acima, para resolver os conflitos de maneira mais fácil. Acho que esse problema aconteceu algumas vezes só comigo e então eu tentei procurar uma maneira mais eficiente de fazer esse processo.

## Quais abordagens seguir?

Pesquisando alternativas para melhorar esse processo, deixando mais fácil para gerar os ícones pensando em automatizar a maior parte do processo eu encontrei essa lib dart https://pub.dev/packages/icon_font_generator que "por baixo do motor" utiliza nodeJS para gerar os ícones, e eu percebi que o resultado era exatamente o que estávamos esperando, mas resolveria tudo em uma linha de comando para gerar, sem a necessidade de abrir o site Flutter Icon. Tudo que precisaríamos de input era a pasta com todos os SVGs para conseguirmos gerar a nossa fonte localmente.

Só tinha um pequeno problema...

## Cadê os meus SVGs?

Logo no começo me deparo com um problema bem grande. Os ícones SVG são usados para gerar a fonte e os arquivos de configuração, mas não existe um jeito de baixar os SVGs de volta no site fluttericon.com.

Foi daí então que eu encontrei um artigo excelente de uma desenvolvedora chamada Sara, sobre como recuperar os arquivos SVGs de sites geradores de fontes. Não era algo exatamente sobre o fluttericon.com, mas foi algo que me chamou a atenção.

Link do artigo dela:
https://www.sarasoueidan.com/blog/icon-fonts-to-svg/

Lendo mais sobre o artigo eu me dei conta que o Flutter Icon é um fork do Fontello, um dos sites citados pela Sara no artigo.

Resumidamente, seguindo o artigo:
1) subir o arquivo config.json do FlutterIcon no Fontello
2) baixar as fontes no Fontello
3) Importar as fontes do Fontello no Icomoon.app
4) Selecionar todos os ícones e baixar todos em formato SVG

Deste modo eu consegui os SVGs de volta, ufa!

## Botando o pacote Icon Font Generator pra trabalhar

Primeiro instalei o IconFontGenerator como global

```bash
dart pub get activate icon_font_generator
```
Em seguida, baixei o NodeJS pelo brew (MacOS):

```bash
brew install node
```
Só pra ter certeza, dei um confere para ver se tava apontando corretamente (o esperado era algo parecido com `/opt/homebrew/bin/node`).

```bash
which node
```
Resultado:
```bash 
$ /opt/homebrew/opt/node@18/bin/node
```
Perfeito, ultimo passo é só rodar o icon_font_generator:

```bash
icon_font_generator --from=./assets/icons/svg --class-name=MeuProjetoIcons --out-font=./assets/icons/MeuProjetoIcons.ttf --out-flutter=./assets/icons/meu_projeto_icons.dart --naming-strategy=camel
```

Deu tudo certo, agora o nosso processo de geração da fonte de ícones é muito mais simples e rápido. 

Espero que isso tenha te ajudado

Até a próxima,''',
    imageUrl:
        'https://media2.dev.to/dynamic/image/width=1000,height=420,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2F8n3l71f5a7n7esbd729b.jpeg',
    readingTime: '5 min de leitura',
    isFeatured: false,
  ),
  Post(
    id: '1445410',
    slug: 'notebook-de-bambu-2m4b',
    title: r'''Notebook de bambu''',
    category: 'Design',
    date: '23 de Abril, 2023',
    summary: r'''Culto a carga     Desde que conheci o podcast Boa Noite Internet, me apaixonei pela...''',
    bodyMarkdown: r'''## Culto a carga

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/6m7jr1bektlente3rmg2.png)


Desde que conheci o podcast [Boa Noite Internet](https://www.boanoiteinternet.com.br/), me apaixonei pela narrativa do Cris Dias, e um dos episódios mais marcantes pra mim, foi o episódio chamado "[Aviões de Bambu](https://www.boanoiteinternet.com.br/2018/11/30/001-avioes-de-bambu/)". 

Nesse episódio é retratada a história dos moradores de ilhas no pacífico, que no período da segunda guerra mundial, tiveram contato contato imediato com tecnologias como aviões, rádio, armas de fogo. E que para eles, todas aquelas tecnologias foram enviadas pelos deuses.

Mas isso não durou muito, ao fim da guerra, as bases militares dessas ilhas rapidamente foram desfeitas. E do dia para a noite, toda aquela tecnologia sumiu. E eles, de maneira totalmente desesperada começaram a fazer o culto da carga. Imitando os soldados da melhor maneira que eles podiam, com capacetes de coco e aviões de bambu, para que a comida que surgia da barriga dos gigantes pássaros de ferro, voltassem a aparecer. 

## E você, já fez culto a carga?

Eu lembro que no início da minha carreira eu sempre via um ou outro programador com MacBook e pensava comigo mesmo. Um dia eu vou ser um programador tão bom quanto esse cara ai, como eu faço para chegar, lá? Comprando um MacBook, é claro. 

Mas para que eu preciso de um MacBook? Na época eu era desenvolvedor Android Nativo, o qual esse desenvolvimento poderia ser feito em qualquer sistema operacional. 
Até que um dia, tive a oportunidade de ter um MacBook para chamar de meu. Coloquei na minha cabeça, que iria começar a desenvolver para iOS também, fiz um ou outro curso mas logo em seguida o estudo nunca foi pra frente. 

Vale ressaltar que eu me considero um bom profissional, mas as vezes parece que eu sou que nem um ilhéu do pacífico. É só sair um modelo novo de computador e eu já vou lá usar meu capacete de coco.

## O caminho certo é o caminho mais rápido

![Image description](https://media.giphy.com/media/9AltGaetVhOhO/giphy.gif)


Já dizia o He-man, que o caminho correto para o sucesso é o trabalho duro e dedicação em programação, assim como em qualquer outra área. 

Gostaria de citar alguns cases aqui para que caso eu queira iniciar um novo culto a carga eu pare e reflita antes disso.

Lembro que teve um case de um [programador autodidata](https://g1.globo.com/economia/tecnologia/noticia/2021/03/09/como-brasileiro-virou-programador-usando-celulares-quebrados.ghtml) que programava com teclado e mouse em um celular Android usando cabo OTG, e que por meio de seu esforço, conseguiu ser contratado por uma grande Fintech do Brasil.

## Como ser um dev melhor?
Acho que primeiro ponto é ter um bom planejamento de estudo, assim você consegue construir qual caminho você deve trilhar e deste modo é possível visualizar o quão distante está do objetivo. 

A [Alura](https://www.alura.com.br/) criou um projeto open-source muito interessante há meses atrás, que é o [TechGuide](https://techguide.sh/). É algo que consegue ajudar as pessoas a se guiarem e entenderem quais skills faltam para se tornar profissional naquela área específica.

## Conclusão
Não tem jeito, o He-man está certo, a gente precisa criar um hábito de estudar constantemente, para nos mantermos atualizados. Algumas das práticas que busco praticar são: ter um pet project, [coding dojos](https://codingdojo.org/), solucionar problemas de programação no [Exercism](https://exercism.org/), participar ativamente de comunidades (isso eu preciso melhorar), e por aí vai. Até posts como esse aqui é algo que quero fazer mais frequentemente. Aguarde que virão alguns posts de Flutter em breve.

Agradeço a atenção e até a próxima.

''',
    imageUrl:
        'https://media2.dev.to/dynamic/image/width=1000,height=420,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2F91yxwaixtcbl2kwjpj31.png',
    readingTime: '5 min de leitura',
    isFeatured: false,
  ),
  Post(
    id: '1210456',
    slug: 'publishing-your-flutter-apps-into-github-pages-1l61',
    title: r'''Publishing your Flutter apps into GitHub pages''',
    category: 'Tecnologia',
    date: '04 de Outubro, 2022',
    summary:
        r'''Versão em português:                                         Publicando suas aplicações Flutter no...''',
    bodyMarkdown: r'''Versão em português: 
{% embed https://dev.to/rodrigocastro_o/publicando-suas-aplicacoes-flutter-no-github-pages-268f %}

## Long, long time ago...

In a far far away land, when Flutter web used to be something experimental yet, and I was looking for somewhere to publish my Flutter app into Github pages.

But now with Flutter 3.3.3, Flutter web is already stable long time ago, decided to see what has changed. I took the opportunity to document here everything I learned.

## What is this GitHub pages?

Essentially is one approach that GitHub offers you to promote your repository, as a webpage to your code, it can be a landing page, documentation or whatever you want. It's possible to do that in every repository, including a "secret" repository that consists on naming it as `<your_github_username>.github.io`, and if you create one GitHub page in this repository, it will be your home page and the other repositories always will be `<your_github_username>.github.io/other_repo_name/`.

I remember that it was cool, long time ago, when the developers used to have their blogs made with static websites into GitHub using Jekyll framework, it was really popular at that moment, I remember that I used to find some cools plugins and themes to customise my blog.

Now (not really now) it's possible to publish your app into GitHub pages, and have your own web app.

## Source code

The source code used in this article will be available in this link: https://github.com/castrors/flutter_web


## Option 1: Peanut

```
https://pub.dev/packages/peanut
```
it's a tool that makes the application build and updates/create a  `gh-pages` branch.

In my case, I had to follow these steps: 

- Install peanut
```dart
flutter pub global activate peanut
```
- Run the peanut command line with one extra parameter, because my repository will be available at https://castrors.github.io/flutter_web/, that is different than the default that is `/`, that's why I needed to give this base-href extra parameter too.
```dart
flutter pub global run peanut --extra-args "--base-href=/flutter_web/"
```

- In the end it will show that the gh-pages branch construction was completely successful, but you need to sync it in git.
```git 
To push your gh-pages branch to github (without switching from your working branch), run:
  git push origin --set-upstream gh-pages
```

- It's just run this command, and your local branch will be synced with the remote and that's it, you just need to wait. You can see that there is one GitHub action running, called `pages build and deployment`. It's responsible to pick-up your selected branch, in this example `gh-pages`, and publish it as the page of your repository. 

> If for some reason you cannot find this GitHub action, maybe it's because the GitHub page was not configured in your repository. To fix that you need to go into your repository -> Settings -> Pages and select the branch you want to build your GitHub page.

![GitHub pages settings page](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/j334evmpktm5vxhposx5.png)

- Success! The Flutter web application is alarde published, checkout this link: https://castrors.github.io/flutter_web/#/


![Flutter web application running, with the initial counter app with the default color, which is blue](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/tpgiqxuja80s9y499u9b.png)

![It's alive](https://i.gifer.com/7RWA.gif)

## Option 2: GitHub actions

In this alternative we are going to create one workflow that will have as trigger, any update into the `main` branch, so follow all of these steps to publish the GitHub page.

Let's go, open your repository into the GitHub website and follow these steps:

- First, click into the tab Actions, just bellow the repository name and then click into `New workflow`.
![GitHub actions menu](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/uhzfspkiq4fv9e23q2h1.png)

- Select the option to create the workflow by yourself `set up a workflow yourself`. 
![Action creation menu](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/ll2y8ywj0u50zy8pzqa1.png)

- You will see this screen here. First, in the top rename the file, if you want. I'll change it to `deploy_github_page`.

![GitHub action creation screen, in edit mode](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/1xryli6lbggxdd7vqf2h.png)

- Delete all the content of this file and replace with this code bellow:

```
name: Flutter Web Deploy
on:
  push:
    branches:
      - main
jobs:
  build:    
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter build web --release --base-href /flutter_web/
      - run: git config user.name github-actions
      - run: git config user.email github-actions@github.com
      - run: git --work-tree build/web add --all
      - run: git commit -m "Automatic deployment by github-actions"
      - run: git push origin HEAD:gh-pages --force

```

- Code changed, we are ready to submit the changes, create a commit or PR directly the GitHub to save the changes, in my case I'm going to save it directly into the main branch.

![Commit changes menu](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/0dkkb3m192hrrufre5e4.png)

- Is it ready? Yes, now we just need to change any UI component into our application so we can proof that the workflow is working properly.

![Commit showing the color change from blue to green](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/g7k32ry5j1h60zzrj56r.png)

![Screen showing all the GitHub actions steps, all successfully executed](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/2mt15w4xjm3npziy2xcw.png)

- All the workflow steps were satisfied and in the end it updates our application that has it's primary color as green instead of blue.

![Again the flutter application running, but this time with the primary color as green](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zpws7kvb6t6axflnxqsa.png)

## Pros and Cons of these approaches

![Nazaré Tedesco thinking in some math formulas](https://i.gifer.com/3RFR.gif)

Peanut is the simplest solution, because it takes just two command lines and you already have your `gh-pages` branch updated. But we have to consider that we are humans and probably we would forget to run these command lines and your application will not be updated.

In another way, with GitHub action everything runs automatically, but it takes really more time, and you have to consider once your application is growing, it will take more time to run the workflow too. But these steps will never be forgotten, because every time you update your main branch it will trigger these action once again.

## Use this knowledge to go further

GitHub pages is not the only option to deploy your Flutter web app, you can give a try in other services like:

[Firebase Hosting](https://firebase.google.com/products/hosting)
[Netlify](https://www.netlify.com)
[Codemagic Static Pages](https://docs.codemagic.io/flutter-publishing/publishing-to-codemagic-static-pages/)

## Conclusion

I hope I can help someone with this content, use both approaches wisely, or only one of them,  depends on your use case.

See you soon!

![Hagrid waving his hands, saying bye!](https://i.gifer.com/6I9a.gif)
''',
    imageUrl:
        'https://media2.dev.to/dynamic/image/width=1000,height=500,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2Fchu3pf762voyin28bd7u.png',
    readingTime: '5 min de leitura',
    isFeatured: false,
  ),
  Post(
    id: '1210442',
    slug: 'publicando-suas-aplicacoes-flutter-no-github-pages-268f',
    title: r'''Publicando suas aplicações Flutter no GitHub Pages''',
    category: 'Tecnologia',
    date: '04 de Outubro, 2022',
    summary:
        r'''English version:                                         Publishing your Flutter apps into GitHub...''',
    bodyMarkdown: r'''English version: 
{% embed https://dev.to/rodrigocastro_o/publishing-your-flutter-apps-into-github-pages-1l61 %}

## A muito tempo atrás...

Em uma terra muito distante, quando Flutter web era algo experimental ainda, e eu já tinha visto algumas maneiras de publicar o meu aplicativo Flutter no GitHub pages.

Mas agora com o Flutter 3.3.3, Flutter web já estável há muito tempo, resolvi ver o que mudou. Vou aproveitar e documentar aqui o que aprendi.

## O que é esse tal de Github pages?

Essencialmente é uma maneira que o GitHub oferece para você divulgar o seu repositório, seja com uma página do seu código, seja uma landing page, documentação ou o que quer que seja. Em todo repositório é possível fazer isso, inclusive um repositório "secreto" que consiste em ter o nome `<sua_conta_do_github>.github.io`, e se voce criar uma GitHub page nesse repositório, ele será a sua página inicial e outros repositórios sempre serão `<sua_conta_do_github>.github.io/nome_de_outro_repo/`.

Eu lembro que era modinha a muito tempo atrás, quando os programadores tinham os seus blogs feitos em sites estáticos no GitHub usando um tal de framework Jekyll, era a sensação
do momento, eu lembro que eu até procurava plugins e temas bem legais para criar o meu blog bem bonito.

Agora (faz tempo já) é possível publicar seu aplicativo no GitHub pages, pra chamar de seu!

## Código

O código utilizado neste artigo estará disponibilizado neste link aqui: https://github.com/castrors/flutter_web


## Opção 1: Peanut

```
https://pub.dev/packages/peanut
```

é uma ferramenta que faz o build da aplicação e atualiza/cria a branch `gh-pages`.

No meu caso, eu tive que seguir esses seguintes passos:

- Instalar o peanut 
```dart
flutter pub global activate peanut
```
- Rodar o peanut com um parâmetro extra, pois o meu repositório estará disponibilizado em https://castrors.github.io/flutter_web/, ou seja é diferente do padrão que é `/`, por isso precisei passar o parâmetro base-href também.

```dart
flutter pub global run peanut --extra-args "--base-href=/flutter_web/"
```

- Ao finalizar ele mostra que a construção da branch gh-pages foi efetuada com sucesso, porém precisa sincronizar essa branch no git.

```git 
To push your gh-pages branch to github (without switching from your working branch), run:
  git push origin --set-upstream gh-pages
```

- É só executar esse comando, que a sua branch local será sincronizada com a remota e é só aguardar. Você pode ver que tem uma GitHub action rodando, chamada `pages build and deployment`. Ela é a responsável em pegar a branch selecionada, no caso gh-pages, e publicar como a página do seu repositório. 

> Se por algum motivo você não encontrar essa GitHub action, deve ser porque a GitHub page não foi configurada no seu repositório. Para resolver isso vá em seu repositório -> Settings -> Pages e selecione a branch a qual você quer construir a sua GitHub page. 
![Pagina de configuração do GitHub pages](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/j334evmpktm5vxhposx5.png)

- Sucesso! A aplicação Flutter web está publicada, confira neste link: https://castrors.github.io/flutter_web/#/


![Aplicação flutter web rodando, aplicativo contador inicial com a cor padrão, que é azul](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/tpgiqxuja80s9y499u9b.png)

![It's alive](https://i.gifer.com/7RWA.gif)

## Opção 2: GitHub actions

Nessa alternativa iremos criar um fluxo de trabalho que irá ter como o gatilho, toda vez que a branch `main` for atualizada, e então faça todos os passos necessários para publicarmos a GitHub page. 

Vamos lá, abra o seu repositório e siga esses passos

- Primeiro, clique na aba Actions, logo abaixo do nome do seu repositório e em seguida clique em `New workflow`.
![Menu de actions do GitHub](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/uhzfspkiq4fv9e23q2h1.png)

- Selecione a opção de criar o fluxo você mesmo `set up a workflow yourself`. 
![Menu de criação de uma action](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/ll2y8ywj0u50zy8pzqa1.png)

- Você verá essa tela aqui. Primeiro, na parte superior renomeie o nome do seu arquivo, caso queira. Eu mudarei para deploy_github_page.

![Tela de criação de uma GitHub action, em modo de edição](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/1xryli6lbggxdd7vqf2h.png)

- Em seguida apague todo o conteúdo do arquivo e substitua por esse código abaixo:

```
name: Flutter Web Deploy
on:
  push:
    branches:
      - main
jobs:
  build:    
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - run: flutter build web --release --base-href /flutter_web/
      - run: git config user.name github-actions
      - run: git config user.email github-actions@github.com
      - run: git --work-tree build/web add --all
      - run: git commit -m "Automatic deployment by github-actions"
      - run: git push origin HEAD:gh-pages --force

```

- Código alterado, estamos prontos para submeter as alterações, crie um commit ou PR diretamente pelo GitHub para salvar as alterações, no meu caso vou salvar diretamente na main.


![Menu de criar commit das alterações](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/0dkkb3m192hrrufre5e4.png)

- Tudo está pronto? Sim, agora só precisamos fazer alguma alteração visual em nosso código para que possamos ver o fluxo de trabalho acontecendo

![Commit mostrando a alteração da cor do aplicativo de azul para verde](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/g7k32ry5j1h60zzrj56r.png)

![Tela mostrando os passos do GitHub action, todos executados com sucesso](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/2mt15w4xjm3npziy2xcw.png)

- Todos os passos do workflow foram satisfeitos e por fim ele atualiza nossa aplicação e que agora está com as cores predominantes de verde.


![Novamente a aplicação flutter rodando, mas desta vez com as cores predominantes em verde](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/zpws7kvb6t6axflnxqsa.png)

## Pros e contras das abordagens

![Nazaré Tedesco pensando nas fórmulas matemáticas](https://i.gifer.com/3RFR.gif)

A peanut é a mais simples, pois só exige dois comandos e já está com a branch `gh-pages` atualizada. Porém é necessário fazer você mesmo esse comando, manualmente. E por sermos humanos provavelmente eventualmente esqueceremos de rodar esse comando e a nossa aplicação não será atualizada.

De outro modo, com o GitHub action tudo roda automaticamente, mas ele é muito mais demorado, e conforme sua aplicação for crescendo, como por exemplo geração de código, isso fará com que esse workflow demore ainda mais. Mas esse passo jamais será esquecido, pois toda vez que a sua branch main for atualizada ele criará um gatilho para rodar esse action mais uma vez. 

## Use esse conhecimento para ir além

GitHub pages provavelmente não é a única opção para publicar suas aplicações Flutter web, você pode testar esses outros serviços:

[Firebase Hosting](https://firebase.google.com/products/hosting)
[Netlify](https://www.netlify.com)
[Codemagic Static Pages](https://docs.codemagic.io/flutter-publishing/publishing-to-codemagic-static-pages/)

## Conclusão

Espero que eu consiga ajudar alguém com esse conteúdo, use os dois sabiamente, ou só um dos dois, depende do seu caso de uso. 

Até a próxima!

![Hagrid dando tchau!](https://i.gifer.com/6I9a.gif)

''',
    imageUrl:
        'https://media2.dev.to/dynamic/image/width=1000,height=500,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2Fgo7f51qwqax56q7667ct.png',
    readingTime: '5 min de leitura',
    isFeatured: false,
  ),
  Post(
    id: '1094779',
    slug: 'mudanca-de-emprego-na-alemanha-10fo',
    title: r'''Mudança de emprego na Alemanha 🇩🇪''',
    category: 'Carreira',
    date: '24 de Maio, 2022',
    summary:
        r'''Esse post é uma continuação desse post aqui:                                        Como vim parar na...''',
    bodyMarkdown: r'''Esse post é uma continuação desse post aqui:
{% embed https://dev.to/rodrigocastro_o/como-vim-parar-na-alemanha--2ie3 %}

Se você não leu ainda, dá uma conferida lá, rapidinho :)

## Introdução
No momento que estou escrevendo esse post, faltam exatamente uma semana para eu sair do meu primeiro emprego aqui na Alemanha. 

Gostaria de compartilhar um pouco o motivo da mudança de emprego e a minha experiência morando aqui a procura de um novo trabalho.

## Antes de me mudar pra Alemanha
Eu estava meio infeliz como desenvolvedor Android nativo e estava procurando trabalhar com Flutter. No momento eu conseguia fazer algumas coisas com Flutter no trabalho, mas nada de um projeto de verdade que alguém usaria de fato. E então em paralelo com o processo seletivo da Alemanha, eu estava em um outro processo para uma empresa de banco no Brasil que já estava adotando Flutter fazia um tempo já. 

No final, não passei no processo dessa empresa brasileira mas passei na empresa Alemã. O engraçado é que se eu tivesse continuado por alguns meses nessa empresa que eu tava, ela seria adquirida por esse banco que eu não passei no processo seletivo. E eu seria funcionário deles, ironia do destino hehe.

## Emprego dos sonhos
Iniciei nesta empresa Alemã remotamente no início de abril de 2020, trabalhei sozinho por um tempo e logo depois entrou uma amiga desenvolvedora para trabalharmos junto. 

Qual era o desafio? Era refazer um aplicativo de gerenciamento de senhas, só que agora em Flutter. A configuração do time era pessoas que trabalhavam nas extensões do browser, backend e mobile nativos. 

O legal é que eu e essa amiga dev viemos de desenvolvimento nativo Android e conseguimos trazer bastante bagagem de aprendizado de lá. Tivemos total autonomia de arquiteturar o projeto, montar do jeito que gostariamos, com reatividade, testes e tudo mais.

O aprendizado foi incrível, estávamos aprendendo demais a cada sprint que passava. Tínhamos coisas que gostaríamos de melhorar, para entregarmos as coisas ainda mais rápido e com mais qualidade. Tudo incrível, até que um dia tudo mudou.

## A aquisição inesperada
Um belo dia, o CEO da empresa informa que adquirimos uma empresa menor de segurança localizada em Londres. Nessa reunião foi muito clara quais os objetivos da união das empresas e como que seguiríamos os nossos projetos a primeiro momento.

## A aquisição inesperada, vol. 2
Na semana seguinte, uma reunião surpresa aparece de última hora e o CEO informa que nós e a empresa que acabamos de adquirir, fomos adquiridos por uma empresa de segurança dos EUA, mas dessa vez foi estranho. Não tivemos muito posicionamento de como que seriam as coisas. E ficamos aguardando novidades.

## A negociação 
A empresa Americana teve a mesma idéia que tivemos em jogar fora o aplicativo nativo e escrever tudo denovo em uma aplicação híbrida, mas eles estavam com a idéia de adotar React Native. 

Foi aí então que nós do time de mobile, montamos um comparativo das ferramentas e tentamos discutir pros e contras sobre Flutter e React Native.

Levei horas montando essa apresentação e no final de tudo me pareceu que só estávamos lá só por estar, pois a decisão já tinha vindo de cima, que descontinuaríamos o Flutter e seguiríamos com React Native.

## A depressão
Fiquei muito triste, pois o Flutter tinha sido descontinuado na empresa e teria que começar a estudar o React Native. 

O processo de acesso aos códigos foi bem demorado e eu consegui fazer vários cursos de React Native até lá. Achei interessante a ferramenta, mas ao iniciar no projeto de fato junto com o novo time percebi que seria uma jornada difícil. A cada dia que passava eu não me sentia produtivo, muito menos feliz.

Dias e mais dias se passaram foi aí que eu percebi que eu estava realmente ficando triste ao trabalhar nessa empresa, que eu já não estava produzindo como eu gostaria. De certo modo até sinto que desaprendi a programar nesse último ano, me sinto mal só de lembrar das frustrações que tive.

## A aceitação
Com todos esses problemas eu percebi que já não tinha mais autonomia como antes, e que a única maneira seria procurar uma outra oportunidade de trabalho. 

Foi aí então que comecei a me atualizar nas novidades do Flutter e comecei a aplicar para várias vagas de Flutter na Alemanha.

## Processos seletivos

### Empresa A
Conversa normal com o RH, para alinharmos o meu background e expectativa salarial. Foi tudo bem nessa parte e agendamos uma conversa com um desenvolvedor, sobre assuntos técnicos de Flutter.

Foi uma conversa muito legal com o desenvolvedor, foi cobrado vários tópicos bem baixo nível de flutter e eu falei a verdade quando não sabia responder, pois afinal fazia 1 ano que eu não estava trabalhando ativamente com Flutter. 

O desenvolvedor foi bem transparente e disse que gostaria de alguém que conseguisse responder todas as questões na ponta da lingua para seguir. Até me recomendou de estudar e reaplicar novamente em um mês.

### Empresa B
Conversa bem parecida com o RH também e em seguida uma conversa com um techlead, conversa muito parecida com a anterior também, porém menos técnica. Acredito que foi tudo bem e me pediram para implementar um desafio em Flutter e submeter em uma semana (não me lembro ao certo do prazo).

Submeti o código na data exigida e até hoje não me avaliaram sobre o meu código e nem me deram negativa no processo. Vida que segue... 

### Empresa C
Essa aqui foi rápida, o RH me mandou um e-mail com um link do calendly para escolher um melhor horário para conversarmos e em 2 dias ele mandou outro e-mail cancelando tudo, falando que não iriam seguir comigo no processo.

### Empresa D
Sabe quando você percebe quando a pessoa não gostou de você? Sei lá qual foi o motivo, mas esse foi assim. Durante a conversa com a RH, como de praxe fui apresentar a minha trajetória contei resumidamente e no instante que terminei a RH me diz que não conseguiu se concentrar direito na conversa, pois eu tinha um vício de linguagem disse muitos "E então...". Eu respirei fundo e falei: "Você me desculpe mas eu não sou nativo em Inglês". Mas senti um toque ácido nesse comentario, não falei nada e conversa que segue. Logo depois ela pergunta a pretensão salarial e eu prontamente respondo. Ela me diz: "Nossa, que salto salarial ein, é isso mesmo que você quer?". A conversa meio que acabou por aí, ela disse que ia passar meu perfil para o gestor e depois entrariam em contato comigo para continuarmos o processo. 

Acredito que ela já me excluiu do processo logo ali. Mas nunca entraram em contato comigo novamente, vai saber.

### Empresa E
Começou com um headhunter me oferecendo a vaga no linkedin, conversamos por telefone e foi bem legal, ele me explicou os detalhes da vaga e disse que me encaminharia para o techlead do time que eu iria trabalhar.

Conversei com esse techlead, que me explicou novamente a vaga e me deu mais detalhes sobre a empresa, finalizamos a conversa com um pair programming agendado para os próximos dias. 

Uma semana depois fizemos o pair programming, onde eu pude escolher qualquer linguagem para resolver os problemas computacionais. Decidi ir de dart mesmo, pois era o que eu já estava esperando. Foram dois problemas simples, um de contagem de caracteres e o outro era o FizzBuzz. Fiz ambos com TDD e por mais que eu estava nervoso, fluiu bem legal, fui explicando e comentando o meu código enquanto resolvia. 

No final do desafio, como consegui resolver os dois dentro do tempo ele disse que me passaria para a próxima etapa. E antes de encerrar ele me perguntou se eu já tinha resolvido esses problemas antes, eu falei que já tinha visto algumas vezes o FizzBuzz e que tinha visto um vídeo muito legal que comentava sobre o assunto. O qual foi no keynote evento Flutter Europe,  que por sinal, acho que é uma das melhores palestras que eu já ví na vida. Segue o vídeo:
{% embed https://youtu.be/uNjp0gS8x_k?t=2076 %}

Mandei o vídeo pra ele antes de encerrar a call. O mais legal foi que no dia seguinte, logo cedo ele me mandou uma mensagem falando que curtiu pra caramba o vídeo e me agradeceu novamente por ter compartilhado com ele.

Logo em seguida veio o email perguntando minha disponibilidade para a entrevista final de 4 horas seguidas, o que eles chamam de Hiring Day.

### Hiring Day
O hiring day começou com uma conversa com a RH, mais para entender o meu trabalho em time e ela pediu para eu dar exemplos das minhas experiências passadas. A conversa foi bem tranquila e logo seguiu para um outro pair programming, mas dessa vez era para implementar uma pequena aplicação em Flutter.

Fiz esse pair programming com um desenvolvedor do time ele me explicou o que deveria ser feito e disse que eu tinha total liberdade de pesquisar na internet, só não deveria usar nenhuma lib para resolver o problema. O desafio era um input de texto com alguns botões de manipulação no texto digitado. Se não me falha a memória, foram ações de deixar tudo maiusculo, inverter maiusculas com minusculas e vice versa, cifra de Cesar rot13 e mapear textos para transformar em emoji. 

Estava nervoso no início, mas logo foi fluindo e consegui explicar o meu pensamento. Consegui acabar bem antes do tempo dado e no final esse outro programador disse que nunca tinha se divertido tanto com um pair programming e que eu tinha sido a pessoa que tinha resolvido o mais rápido que ele já tinha visto. Fiquei bem animado, mas ainda era a metade das entrevistas.

Tivemos uma pequena pausa e a conversa continuou com um outro programador, sobre boas práticas de desenvolvimento. Ele me dava um tópico e eu explicava como que seria minha abordagem para aquela situação ou problema. Foi bem tranquila essa etapa, mas não dava pra saber muito se eu tinha me saído bem.

E por fim, a última etapa, com o product owner do time. Foram várias conversas sobre agilidade e que eu fiquei bem feliz de saber que a empresa adota várias coisas que eu acredito que funcionam e que não só são ágeis por ter um Kanban.

No fim da conversa o PO disse que a empresa entraria em contato comigo nos próximos dias, mas que spoiler alert eu já tinha alguns fãs no time. 

O Hiring day foi numa quinta-feira e não deu outra, as 8 da manhã da segunda-feira estava lá, a proposta de trabalho toda detalhada e com algumas perguntas sobre o contrato.

Fiquei tão feliz que nesse dia estourei um espumante e comemorei com minha família. 

## Conclusão
Fico pensando aqui se deveria ter saído logo no início, quando ví que não iria trabalhar com Flutter mais. Mas acho que o problema foi muito além de framework, pois com a aquisição, a cultura da empresa foi muito afetada. Sinto que minha autonomia e a do time já não era a mesma. Agora tínhamos que simplesmente aceitar as demandas e não influenciar mais sobre a maneira que o projeto deveria seguir. Paguei um preço muito caro, o valor mais caro que paguei foi minha sanidade mental, foi uma experiência que não quero que se repita nunca mais. O intuito de documentar isso aqui é para reforçar isso para mim e espero que ajude alguém que está passando pela mesma situação que eu. 

Durante os processos eu recebi vários nãos, alguns foram construtivos, outros nem tanto. Mas sei que cada um dos nãos me ajudou a chegar no sim. Eu sei que não sou o cara mais expert do mundo em Flutter e a empresa que me contratou também não quer esse cara, quer uma pessoa que ajude a construir um time e um produto incrível, espero que eu consiga contribuir com isso. A minha parte eu vou fazer, com certeza! 

Obrigado pela atenção e até a próxima.


''',
    imageUrl:
        'https://media2.dev.to/dynamic/image/width=1000,height=420,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2F6sxthlaond208xfj93uc.jpg',
    readingTime: '5 min de leitura',
    isFeatured: false,
  ),
  Post(
    id: '1067938',
    slug: 'como-vim-parar-na-alemanha--2ie3',
    title: r'''Como vim parar na Alemanha 🇩🇪?''',
    category: 'Carreira',
    date: '12 de Maio, 2022',
    summary: r'''Quem sou eu?   Sou Rodrigo Castro, sou desenvolvedor de software desde 2014, trabalhei a...''',
    bodyMarkdown: r'''## Quem sou eu?
Sou Rodrigo Castro, sou desenvolvedor de software desde 2014, trabalhei a maioria da minha carreira desenvolvendo aplicações nativas para Android. Já trabalhei em várias empresas no Brasil, como por exemplo bancos, hipermercados e corretora de investimentos. 

Mas em 2018, acredito eu, foi um divisor de águas na minha carreira, quando ví o framework multiplataforma novo do Google, o Flutter (confira o vídeo do Google I/O 18 [aqui](https://www.youtube.com/watch?v=Px4ckfvecHM)). Eu já tinha testado outras ferramentas multiplataforma antes, mas nunca tinha botado fé nelas, acreditava que eram mais pra hackathons ou para validar idéia de uma aplicação e então realmente desenvolver nativo depois. Mas com Flutter foi diferente, já no anúncio do Flutter, mesmo sendo beta, já tinha cara de produto final e eu decidi apostar minhas fichas nesse framework. 

No começo eu comecei a fazer meetups sobre Flutter (GDG São Paulo e FlutterBR), criar palestras, fazer projetos pessoas para consolidar melhor o meu conhecimento e é claro contar para as pessoas sobre a palavra do Flutter e o quanto é legal esse framework do Google. 

![Image description](https://dev-to-uploads.s3.amazonaws.com/uploads/articles/jk02q4h4j55omtqgciuj.gif)

> Esse GIF é um meme que sempre aparecia na comunidade [AndroidDevBR](http://slack.androiddevbr.org/) 😂

## A preparação

O meu primeiro processo em inglês foi para uma empresa do Brasil, que me levaria para os EUA por um tempo e depois trabalhar remotamente com esse time. A intenção era fazer um app de um banco do zero em Flutter. 

Eu lembro como se fosse hoje, no final de 2019, eu estava de férias viajando e fiz as entrevistas todas em inglês, estava muito nervoso mas consegui me comunicar. A última etapa foi com um dos sócios fundadores do projeto, que era ex funcionário do Google. Eu acabei não passando nessa vaga, mas a cada pergunta que eu errava ou que respondia incompleta o cara me dava uma aula explicando qual era a resposta e o porque. Na hora fiquei muito triste ao saber que não passei, mas hoje vejo que foi muito rica e me preparou bastante para as próximas etapas da minha carreira.

## Um chamado inesperado 

No início de 2020, acredito que janeiro eu estava de boa, morando em São Paulo, quando recebi uma mensagem de uma headhunter me oferecendo uma vaga de trabalho para refazer um projeto nativo em Flutter, morar na Alemanha, eles ajudariam com o visto e com a mudança. Eu e a minha esposa estávamos querendo morar fora do país já, até tínhamos feito consultoria para imigrar para o Canadá, nunca tínhamos pensado na Alemanha.

## O processo 

Teve uma conversa com a headhunter, que me explicou tudo, e falou que era pra morar em uma cidade do interior da Alemanha, não em Berlin ou Munique, como a maioria das pessoas espera. Eu achei tudo massa demais, inclusive sobre morar em cidade pequena chamada Tettnang, eu venho de uma cidadezinha chamada Coxim, no interior do Mato Grosso do Sul, minúscula, então estou acostumado e gosto das vantagens de morar em cidade pequena.

A conversa foi tudo certo e me mandaram um desafio técnico num [HackerRank](https://www.hackerrank.com/) da vida. Fui bem e me convidaram para ir na Alemanha com tudo pago para conhecer a cidade e fazer a última etapa lá na empresa. Já daria pra conhecer o time e conhecer melhor como que seria morar na cidade. 

Você já deve estar imaginando o que aconteceu, era início de 2020 e eu estava indo viajar pra Alemanha. Foi bom enquanto durou, um ou dois dias depois desse convite, a pessoa do RH me ligou e informou que infelizmente não seria mais possível viajar, por conta do COVID-19, mas me perguntou se eu gostaria de continuar o processo remotamente mesmo assim. 

Aceitei e o processo continuou em uma conversa com o RH da empresa e o gestor do time que eu iria trabalhar, foi mais pra explicar como que era a empresa e o time que eu iria trabalhar.

Próxima etapa, pair programming com o gestor e um outro programador do time, que por coincidência era um Brasileiro também, que trabalhava na empresa fazia uns 4 anos. Foi legal que conseguimos conversar um pouquinho em português, e eu consegui ficar um pouco mais tranquilo para continuar o desafio. Nessa etapa foi onde eu desenvolvi Flutter junto com eles e fui explicando o meu código enquanto implementava. 

Depois dessa etapa teve um fit cultural com uma desenvolvedora de um outro time. Falamos sobre os desafios técnicos e não técnicos que passei durante a minha carreira. A conversa foi boa mas eu ainda não sabia se tinha sido aprovado ou não.

Na semana seguinte o RH me liga falando que eu tinha passado no processo e que eles gostariam de me fazer uma proposta de trabalho. Eu saí correndo avisar a minha esposa e contar as boas novas!

A empresa me transferiu dinheiro pra comprar a máquina, e trabalhei de casa por uns 2 ou 3 meses até conseguir meu visto. Na época, o consulado da Alemanha no Brasil estava fechado.

Visto em mãos, passagens compradas, em agosto de 2020 a gente se mudou para a Alemanha e aqui se iniciou uma nova aventura! 

## Mais detalhes em vídeo

Moro aqui faz quase 2 anos já, fiz um vídeo e postei no youtube logo que cheguei. Lá eu explico um pouco melhor, confira [nesse link](https://www.youtube.com/watch?v=-Npk6Dcfyo4)

## Continua ~~no próximo episódio~~

Durante esses 2 anos de empresa ví a necessidade de mudar de trabalho, pretendo contar em mais detalhes sobre o processo de mudança de emprego em um próximo post. Fiquem ligados!

''',
    imageUrl:
        'https://media2.dev.to/dynamic/image/width=1000,height=420,fit=cover,gravity=auto,format=auto/https%3A%2F%2Fdev-to-uploads.s3.amazonaws.com%2Fuploads%2Farticles%2Fvva21zhft5g0u5h19bhv.jpg',
    readingTime: '5 min de leitura',
    isFeatured: false,
  ),
];
