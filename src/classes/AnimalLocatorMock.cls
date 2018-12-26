@isTest
global class AnimalLocatorMock implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest request) {
         HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        string str = '{'+
'    "OutreachMembers": {'+
'        "OutreachMembers": {'+
'            "Member": ['+
'                {'+
'                    "CompanyID": "AHP",'+
'                    "MemberID": "00000100012",'+
'                    "LastName": "ARANDA",'+
'                    "FirstName": "JONATHAN",'+
'                    "CampaignCategory": "JSA",'+
'                    "CampaignName": "CA-LA&OC-New-Welcome-2018",'+
'                    "OutreachAttemptDate1": "2018-01-18 12:18:00",'+
'                    "OutreachAgentName1": "Crystal Rodriguez",'+
'                    "OutreachOutcome1": "Wrng/Bad Contct Inf",'+
'                    "RequestCallBackDate1": "",'+
'                    "WrapCode1": "255",'+
'                    "OutreachAttemptDate2": null,'+
'                    "OutreachAgentName2": null,'+
'                    "OutreachOutcome2": null,'+
'                    "RequestCallBackDate2": null,'+
'                    "WrapCode2": null,'+
'                    "OutreachAttemptDate3": null,'+
'                    "OutreachAgentName3": null,'+
'                    "OutreachOutcome3": null,'+
'                    "RequestCallBackDate3": null,'+
'                    "WrapCode3": null,'+
'                    "OutreachAttemptDate4": null,'+
'                    "OutreachAgentName4": null,'+
'                    "OutreachOutcome4": null,'+
'                    "RequestCallBackDate4": null,'+
'                    "WrapCode4": null,'+
'                    "OutreachAttemptDate5": null,'+
'                    "OutreachAgentName5": null,'+
'                    "OutreachOutcome5": null,'+
'                    "RequestCallBackDate5": null,'+
'                    "WrapCode5": null,'+
'                    "OutreachAttemptDate6": null,'+
'                    "OutreachAgentName6": null,'+
'                    "OutreachOutcome6": null,'+
'                    "RequestCallBackDate6": null,'+
'                    "WrapCode6": null,'+
'                    "IsMaxAttemptCompleted": "Y",'+
'                    "LatestOutreachOutcome": "Wrng/Bad Contct Inf",'+
'                    "LatestOutreachDate": "Jan 18 2018 12:18PM",'+
'                    "FinalOutcome": "Wrng/Bad Contct Inf"'+
'                },'+
'                {'+
'                    "CompanyID": "AHP",'+
'                    "MemberID": "00000100189",'+
'                    "LastName": "HERNANDEZ ORTEGA",'+
'                    "FirstName": "LEOCADIO",'+
'                    "CampaignCategory": "JSA",'+
'                    "CampaignName": "CA-RIV&SB-New-Welcome-2018",'+
'                    "OutreachAttemptDate1": "2018-01-12 09:45:00",'+
'                    "OutreachAgentName1": "Valeria Ibarra",'+
'                    "OutreachOutcome1": "Mmbr Outrch/JSA Unt",'+
'                    "RequestCallBackDate1": "",'+
'                    "WrapCode1": "351",'+
'                    "OutreachAttemptDate2": null,'+
'                    "OutreachAgentName2": null,'+
'                    "OutreachOutcome2": null,'+
'                    "RequestCallBackDate2": null,'+
'                    "WrapCode2": null,'+
'                    "OutreachAttemptDate3": null,'+
'                    "OutreachAgentName3": null,'+
'                    "OutreachOutcome3": null,'+
'                    "RequestCallBackDate3": null,'+
'                    "WrapCode3": null,'+
'                    "OutreachAttemptDate4": null,'+
'                    "OutreachAgentName4": null,'+
'                    "OutreachOutcome4": null,'+
'                    "RequestCallBackDate4": null,'+
'                    "WrapCode4": null,'+
'                    "OutreachAttemptDate5": null,'+
'                    "OutreachAgentName5": null,'+
'                    "OutreachOutcome5": null,'+
'                    "RequestCallBackDate5": null,'+
'                    "WrapCode5": null,'+
'                    "OutreachAttemptDate6": null,'+
'                    "OutreachAgentName6": null,'+
'                    "OutreachOutcome6": null,'+
'                    "RequestCallBackDate6": null,'+
'                    "WrapCode6": null,'+
'                    "IsMaxAttemptCompleted": "Y",'+
'                    "LatestOutreachOutcome": "Mmbr Outrch/JSA Unt",'+
'                    "LatestOutreachDate": "Jan 12 2018  9:45AM",'+
'                    "FinalOutcome": "Scheduled"'+
'                }'+
'   ]'+
'        }'+
'    },'+
'    "ProcessingStatusList": ['+
'        {'+
'            "StatusCode": "200",'+
'            "StatusDescription": "Success"'+
'        }'+
'    ]'+
'}';

        response.setBody(str);
        response.setStatusCode(200);
        return response;
    }
}