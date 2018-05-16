import { NativeModules } from 'react-native';

const RNCloudPaymentsModule = NativeModules.RNCloudPayments;

export default class RNCloudPayments {
  static async isValidNumber(cardNumber, cardExp, cardCvv) {
    try {
      return await RNCloudPaymentsModule.isValidNumber(cardNumber, cardExp, cardCvv);
    } catch(error) {
      return createError(error);
    }
  }

  static async getType(cardNumber, cardExp, cardCvv) {
    try {
      return await RNCloudPaymentsModule.getType(cardNumber, cardExp, cardCvv);
    } catch(error) {
      return createError(error);
    }
  }

  static async createCryptogram(cardNumber, cardExp, cardCvv, publicId) {
    try {
      return await RNCloudPaymentsModule.createCryptogram(cardNumber, cardExp, cardCvv, publicId);
    } catch(error) {
      return createError(error);
    }
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
