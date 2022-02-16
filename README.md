# poc_google_sign

A new Flutter project.

## Android

- Adicionar Android no Firebase

- Gerar o SHA1:

```shell
  cd android
  ./gradlew signingReport
```

- Colar o arquivo google-services.json na pasta android/app

- Instalar google_sign_in como dependencia no pubspec.yaml: `flutter pub add google_sign_in`
- Permissão de tela do OAuth através do [Console Google Cloud](https://console.cloud.google.com/apis/credentials/consent)

## IOS
