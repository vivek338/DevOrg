@isTest private class TestVerifyDate {
    
    static testMethod void method1(){
        Date day1 = Date.newInstance(2016, 12, 11);
        Date day2 = Date.newInstance(2016, 12, 18);
        VerifyDate.CheckDates(day1, day2);
    }
    static testMethod void method2(){
        Date day1 = Date.newInstance(2016, 12, 11);
        Date day2 = Date.newInstance(2017, 02, 18);
        VerifyDate.CheckDates(day1, day2);
    }
    static testMethod void method3(){
        Date day1 = Date.newInstance(2016, 12, 11);
        Date day2 = Date.newInstance(2016, 11, 18);
        VerifyDate.CheckDates(day1, day2);
    }
}