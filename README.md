# renner_coatings

Renner Coatigns

Documentação código-fonte do projeto Renner Coatigns em Flutter.

## Compilação do Projeto

Versão recomendada do Flutter: `v2.2.3`. Para chavear o ambiente para essa versão execute o comando abaixo:

``` shell
> flutter version v2.2.3
```

## Run do Projeto

O camando abaixo permite o download dos pacotes contidos no pubspeck.yaml.

``` shell
> flutter packages get
```

O camando abaixo permite a execução do app mediante um dispositivo conectado.

``` shell
> flutter run
```

### Android

``` shell
> flutter build apk --target-platform android-arm,android-arm64 --split-per-abi
```

#### Android com perfil de publicação QA e Produção
``` shell
> flutter build apk --target-platform android-arm,android-arm64 --split-per-abi -t lib/main_dev.dart
```
``` shell
> flutter build apk --target-platform android-arm,android-arm64 --split-per-abi -t lib/main_prod.dart
```

### iOS

``` shell
> flutter build ios
```

#### iOS Android com perfil de publicação QA e Produção

``` shell
> flutter build ios --no-codesign -t lib/main_dev.dart
```

``` shell
> flutter build ios --no-codesign -t lib/main_prod.dart
```

## Instalação nos Devices

``` shell
> flutter install
```

Caso haja mais de um device (ex: emulador e smartphone) conectado simultaneamente ao computador, é necessário especificar o Id do device destinatário usando o parâmetro `-d`.

``` shell
> flutter install -d [ID DO DEVICE]
```

## Problema com Geração no iOS

Eventualmente pode aparecer um problema `` ao alternar as versões do Flutter. Para solucioná-lo basta executar o seguinte comando na raíz do projeto.

``` shell
> cd ios && rm -rf Podfile.lock Podfile Pods
```

## Exportação dos Ícones

É necessário instalar o pacote [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) para a geração dos ícones.

``` shell
> flutter pub run flutter_launcher_icons:main
```
