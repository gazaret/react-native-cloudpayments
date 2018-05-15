import { NativeModules } from 'react-native';

const RNCloudPaymentsModule = NativeModules.RNCloudPayments;

export default class RNCloudPayments {
  static isValidNumber(cardNumber, cardExp, cardCvv) {
    return new Promise((resolve, reject) => {
      RNCloudPaymentsModule.isValidNumber(
        cardNumber,
        cardExp,
        cardCvv,
        error => reject(createError(error)),
        numberStatus => resolve(numberStatus),
      )
    });
  }

  static getType(cardNumber, cardExp, cardCvv) {
    return new Promise((resolve, reject) => {
      RNCloudPaymentsModule.getType(
        cardNumber,
        cardExp,
        cardCvv,
        error => reject(createError(error)),
        type => resolve(type),
      )
    });
  }

  static createCryptogram(cardNumber, cardExp, cardCvv, publicId) {
    return new Promise((resolve, reject) => {
      RNCloudPaymentsModule.createCryptogram(
        cardNumber,
        cardExp,
        cardCvv,
        publicId,
        error => reject(createError(error)),
        cryptogram => resolve(cryptogram),
      )
    });
  }
}

class RNCloudPaymentsError extends Error {
  constructor(details) {
    super();

    this.name = 'RNCloudPaymentsError';
    this.message = typeof details === 'string' ? details : details.message;
  }
}

function createError(error) {
  return new RNCloudPaymentsError(error);
}
