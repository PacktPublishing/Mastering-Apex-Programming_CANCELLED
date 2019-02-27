/*
    @name: BusinessHoursServices
    @description: This class is used for BusinessHour related calculations.
    @author: Santanu Boral
    @date: 14 FEB 2019
    
    CopyRight (c) 2019  
*/
public with sharing class BusinessHoursServices {
    //retrieves & assign the Organization level Business Hours to defaultBH 
    static BusinessHours defaultBH {
        get {
            if (defaultBH == null)
                defaultBH = [SELECT Id FROM BusinessHours 
                            WHERE IsDefault = true];
            return defaultBH;
        }
        private set;
    }
    
    //it takes the input date and SLA value and return the calcuated date
    public static Datetime getSLATimeByBusinessHour (DateTime input, 
                                Integer SLAhours) {
        return BusinessHours.add(defaultBH.Id,input, 
                            SLAhours* 60 * 60 * 1000L);
    }
}