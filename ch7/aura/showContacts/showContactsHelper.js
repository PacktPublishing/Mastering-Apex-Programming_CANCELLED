/*helper.js*/
({
	performShowingContacts : function(component, event, helper) {
		
		var action = component.get("c.getContactRecords");
        action.setParams({
			"accountName": component.get("v.accountName")			
		});
        action.setCallback(this, function(response){
        	
            var responseState = response.getState();
			var responseError = response.getError();
			var responseValue = response.getReturnValue();

            switch(responseState){
    
                default: break;
                case 'NEW': break;
                case 'RUNNING': break;
    
                case 'SUCCESS':
    
                    component.set('v.contactColumns', 
                    [
                        {label: 'Name', fieldName: 'Name', type: 'text'},
                        {label: 'Email', fieldName: 'Email', type: 'email'},
                        {label: 'Phone', fieldName: 'MobilePhone', type: 'phone'},
                        {label: 'LastModifiedDate', fieldName: 'LastModifiedDate', type: 'date'}                        
                    ]);
                    if(typeof responseValue != undefined)
                    	component.set("v.contact", responseValue);
                    	
                   	//console.log('Contacts-->'+JSON.stringify(component.get("v.contact")));
                    break;
    
                case 'INCOMPLETE': break;
                case 'ERROR': 
                    console.log('Response Error-->'+JSON.stringify(responseError));
                    var errorMsg = responseError[0].message;
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        title: 'Error',
                        type: 'error',
                        message: errorMsg
                    });
                    toastEvent.fire();

                    break;
    
            } 
        });	       
        $A.enqueueAction(action);
	}
})