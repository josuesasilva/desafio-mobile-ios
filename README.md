## Instruções para instalação

1. Instalação do cocoapods assumindo que já possua instalação do Ruby e do Xcode 8.3.+:
```
# Xcode 7 + 8
$ sudo gem install cocoapods
```

2. Configurações do projeto

```
$ git clone https://github.com/josuesasilva/desafio-mobile-ios.git
$ cd desafio-mobile-ios/
$ pod install
```

3. Abrindo o projeto

```
$ open desafio-mobile-ios.xcworkspace
```

## Descrição do projeto

O aplicativo deve exibir inicialmente uma lista paginada dos repositórios, ordenados por popularidade decrescente (exemplo de chamada da API: `https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1`).

Cada repositório deve exibir Nome do repositório, Descrição do Repositório, Nome / Foto do autor, Número de Stars, Número de Forks.

Ao tocar em um item, deve levar a lista de Pull Requests do repositório. Cada item da lista deve exibir Nome / Foto do autor do PR, Título do PR, Data do PR e Body do PR.

Ao tocar em um item, deve abrir no browser a página do Pull Request em questão.

![mockup](https://raw.githubusercontent.com/myfreecomm/desafio-mobile-ios/master/mockup-ios.png)
