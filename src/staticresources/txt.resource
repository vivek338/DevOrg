String str='{'+
'  "messageHeader": {'+
'    "responseCode": 0,'+
'    "consumerId": "SFDC",'+
'    "targetId": "",'+
'    "transactionCode": "BYPD",'+
'    "consumerType": "",'+
'    "salesDistrict": 0,'+
'    "userId": "",'+
'    "userInfoDetail": "",'+
'    "correlationId": "",'+
'    "transactionId": "",'+
'    "maxWaitTime": 0,'+
'    "maxRetryCount": 0,'+
'    "abortOnErrorFlag": "",'+
'    "replyErrorNumber": "",'+
'    "replyErrorText": "",'+
'    "replyErrorType": "",'+
'    "replyErrorSeverity": "",'+
'    "processCenter": "",'+
'    "divisionNumber": 3190,'+
'    "divisionName": "",'+
'    "customerNumber": 20371951,'+
'    "customerName": "",'+
'    "warehouseNumber": 0,'+
'    "warehouseName": "",'+
'    "appDefinedText": ""'+
'  },'+
'  "messageDetail": {'+
'    "departmentNumber": 0,'+
'    "pricingDate": 0,'+
'    "pricingTime": 0,'+
'    "lastPricingDate": 0,'+
'    "lastPricingTime": 0,'+
'    "getDeptLevelInfoFlag": "N",'+
'    "productListCount": 1,'+
'    "productList": ['+
'      {'+
'        "productNumber": 99978,'+
'        "getPriceFlag": "Y",'+
'        "getLastPriceFlag": "Y",'+
'        "getLastFourBuyFlag": "Y",'+
'        "getProductStatusFlag": "Y"'+
'      }'+
'    ]'+
'  }'+
'}';
CustomerItemWSUtil ws = new CustomerItemWSUtil();
HttpResponse ht = ws.callOAGRestWebservice(str);