# CloudPayments SDK for iOS 

CloudPayments SDK позволяет интегрировать прием платежей в мобильные приложение для платформы iOS.

### Схема работы мобильного приложения:
![Схема проведения платежа](https://cloudpayments.ru/storage/SNbUKmXtE1XgZoL7ypOSJBTFKvRpfMaWtWiNI51U.png)
1. В приложении необходимо получить данные карты: номер, срок действия, имя держателя и CVV;
2. Создать криптограмму карточных данных при помощи SDK;
3. Отправить криптограмму и все данные для платежа с мобильного устройства на ваш сервер;
4. С сервера выполнить оплату через платежное API CloudPayments. 

### Требования
Для работы CloudPayments SDK необходим iOS версии 8.0 и выше.

### Подключение
Для подключения SDK мы рекомендуем использовать Cocoa Pods. Добавьте в файл Podfile зависимость:

```
pod 'SDK-iOS', :git =>  "https://github.com/cloudpayments/SDK-iOS", :branch => "master"
```
### Структура проекта:

* **api/** - Пример файлов для проведения платежа через ваш сервер
* **demo/** - Пример реализации приложения с использованием SDK
* **sdk/** - Исходный код SDK


### Подготовка к работе

Для начала приема платежей через мобильные приложения вам понадобятся:

* Public ID;
* Пароль для API (**Важно:** Не храните пароль для API в приложении, выполняйте запросы через сервер согласно Схемы работы мобильного приложения).

Эти данные можно получить в личном кабинете: [https://merchant.cloudpayments.ru/](https://merchant.cloudpayments.ru/) после подключения к [CloudPayments](https://cloudpayments.ru/).

### Возможности CloudPayments SDK:

* Проверка карточного номера на корректность

```
Card.isCardNumberValid(cardNumber)

```

* Определение типа платежной системы

```
Card.cardType(toString: Card.cardType(fromCardNumber: textField.text))

```

* Шифрование карточных данных и создание криптограммы для отправки на сервер

```
let card = Card()
let cardCryptogramPacket = card.makeCryptogramPacket(cardNumber, andExpDate: expDate, andCVV: cvv, andMerchantPublicID: Constants.merchantPulicId)

```

* Отображение 3DS формы и получении результата 3DS аутентификации

```
var d3ds: D3DS = D3DS.init()
d3ds.make3DSPayment(with: self, andAcsURLString: acsUrl, andPaReqString: paReq, andTransactionIdString: transactionId)
```

### Пример проведения платежа:

#### 1) Создание криптограммы

```
// Обязательно проверяйте входящие данные карты (номер, срок действия и cvc код) на корректность, иначе при попытке создания объекта CPCard мы получим исключение.
let card = Card()
let cardCryptogramPacket = card.makeCryptogramPacket(cardNumber, andExpDate: expDate, andCVV: cvv, andMerchantPublicID: Constants.merchantPulicId)

```

#### 2) Выполнение запроса на проведения платежа через  API CloudPayments

Платёж - [оплата по криптограмме](https://cloudpayments.ru/wiki/integration/instrumenti/api#pay_with_crypto).

Для привязки карты (платёж "в один клик")  используйте метод
[оплату по токену](https://cloudpayments.ru/wiki/integration/instrumenti/api#paywithtoken).  

Токен можно получить при совершении оплаты по криптограмме, либо при получении  [уведомлений](https://cloudpayments.ru/wiki/integration/instrumenti/notice).


#### 3) Если необходимо, показать 3DS форму для подтверждения платежа

```
var d3ds: D3DS = D3DS.init()
d3ds.make3DSPayment(with: self, andAcsURLString: acsUrl, andPaReqString: paReq, andTransactionIdString: transactionId)
```

Для получения результатов прохождения 3DS аутентификации реализуйте делигат D3DSDelegate в ViewController из которого происходит создание и отображение 3DS формы.

```
class CheckoutViewController: UIViewController, D3DSDelegate {
...
	func authorizationCompleted(withMD md: String!, andPares paRes: String!) {
        post3ds(transactionId: md, paRes: paRes)
    }
    
    func authorizationFailed(withHtml html: String!) {
        self.showAlert(title: .errorWord, message: html)
        print("error: \(html)")
    }
```

### Подключение Apple Pay для клиентов CloudPayments

[О Apple Pay](https://cloudpayments.ru/docs/applepay)

[https://www.raywenderlich.com/87300/apple-pay-tutorial](https://www.raywenderlich.com/87300/apple-pay-tutorial) \- туториал, по подключению Apple Pay в приложение.

#### ВАЖНО:

При обработке успешного ответа от Apple Pay, необходимо выполнить переобразование объекта PKPayment в криптограмму для передачи в платежное API CloudPayments

```
let cryptogram = PKPaymentConverter.convert(toString: payment) 
```
После успешного преобразования криптограмму можно использовать для проведения оплаты.

### Поддержка

По возникающим вопросам техничечкого характера обращайтесь на support@cloudpayments.ru
