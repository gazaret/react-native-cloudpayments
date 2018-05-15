package com.rncloudpayments;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import ru.cloudpayments.cpcard.CPCard;
import ru.cloudpayments.cpcard.CPCardFactory;

public class CloudPayments extends ReactContextBaseJavaModule {
  public CloudPayments(ReactApplicationContext reactContext) {
    super(reactContext);
  }

  @Override
  public String getName() {
    return "RNCloudPayments";
  }

  @ReactMethod
  public void isValidNumber(String cardNumber, String cardExp, String cardCvv, Callback reactErrorCallback, Callback reactSuccessCallback) {
    try {
      CPCard card = CPCardFactory.create(cardNumber, cardExp, cardCvv);

      boolean numberStatus = card.isValidNumber();

      reactSuccessCallback.invoke(numberStatus);
    } catch (Exception e) {
      reactErrorCallback.invoke(e.getMessage());
    }
  }

  @ReactMethod
  public void getType(String cardNumber, String cardExp, String cardCvv, Callback reactErrorCallback, Callback reactSuccessCallback) {
    try {
      CPCard card = CPCardFactory.create(cardNumber, cardExp, cardCvv);

      String cardType = card.getType();

      reactSuccessCallback.invoke(cardType);
    } catch (Exception e) {
      reactErrorCallback.invoke(e.getMessage());
    }
  }

  @ReactMethod
  public void createCryptogram(String cardNumber, String cardExp, String cardCvv, String publicId, Callback reactErrorCallback, Callback reactSuccessCallback) {
    try {
      CPCard card = CPCardFactory.create(cardNumber, cardExp, cardCvv);

      String cryptoprogram = card.cardCryptogram(publicId);

      reactSuccessCallback.invoke(cryptoprogram);
    } catch (Exception e) {
      e.printStackTrace();
      reactErrorCallback.invoke(e.getMessage());
    }
  }
}