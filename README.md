# React Native CloudPayments

[React Native](http://facebook.github.io/react-native/) library for accepting payments with [CloudPayments](https://cloudpayments.ru) SDK

# Install
Download package:
```shell
npm install --save react-native-cloudpayments
```

or

```shell
yarn add react-native-cloudpayments
```

Link dependencies:
```shell
react-native link react-native-cloudpayments
```

# Methods
### isValidCard()
Validate card.
Returns a `Promise` that resolve card status (`Boolean`).

__Arguments__
- `cardNumber` - `String` Number of payment card.
- `cardExp` - `String` Expire date of payment card.
- `cardCvv` - `String` CVV code of payment card.

__Examples__
```js
import RNCloudPayment from 'react-native-cloudpayment';

const demoCard = {
  number: '5105105105105100',
  extDate: '10/18',
  cvvCode: '123',
};

RNCloudPayment.isValidCard(demoCard.number, demoCard.extDate, demoCard.cvvCode)
  .then(cardStatus => {
    console.log(cardStatus); // true
  });
```

### getType()
Retrive card type.
Returns a `Promise` that resolve card type (`String`).

Card types:
- Unknown
- Visa
- MasterCard
- Maestro
- Mir
- JCB

__Arguments__
- `cardNumber` - `String` Number of payment card.
- `cardExp` - `String` Expire date of payment card.
- `cardCvv` - `String` CVV code of payment card.

__Examples__
```js
import RNCloudPayment from 'react-native-cloudpayment';

const demoCard = {
  number: '5105105105105100',
  extDate: '10/18',
  cvvCode: '123',
};

RNCloudPayment.getType(demoCard.number, demoCard.extDate, demoCard.cvvCode)
  .then(cardType => {
    console.log(getType); // MasterCard
  });
```

### createCryptogram()
Create cryptogram. Used in CloudPayment [API](https://cloudpayments.ru/Docs/Api#payWithCrypto).
Returns a `Promise` that resolve cryptogram (`String`).

__Arguments__
- `cardNumber` - `String` Number of payment card.
- `cardExp` - `String` Expire date of payment card.
- `cardCvv` - `String` CVV code of payment card.
- `publicId` - `String` Your Public ID, you need to get it in your [personal account](https://merchant.cloudpayments.ru/).

__Examples__
```js
import RNCloudPayment from 'react-native-cloudpayment';

const demoCard = {
  number: '5105105105105100',
  extDate: '10/18',
  cvvCode: '123',
};

const publicId = 'pk_xxxxxxxxxxxxxxxxxxxxxxxxxxxxx';

RNCloudPayment.createCryptogram(demoCard.number, demoCard.extDate, demoCard.cvvCode, publicId)
  .then(cryptogram => {
    console.log(cryptogram); // 025105105100/11004bpp9ltxt6c0jpdk8ErH+N33N9jZBm9Gr0jO7SVslLg/RdWYyjG5wiLrzmrUserhfblFVydij4wpjDvHH4kRnOskjnbn1XrPI8X9LMkvlR5Pkc63U5puXtnS0rkswS6JYaSErcKMq4TazimKY4rGobvhhYfg45LWdLlX0602t7ZybbaBTMff6wtta870/244s65GTbCI1zt6odDMckpEuiczwM68m6j0Rn2IuKpK8kR58x7tFFc7fWrrW0RHvLNxQIW9P+SpsySoiA4xaZfC7lXL57O80Ye6JDi6PWAim5dENNxIc81T1kmXnKn94x8h2+XS83yMHHfTUOeDb7J1fLg==
  });
```

# License
Licensed under the MIT License.
