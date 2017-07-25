var app=angular.module("CozyApp",[]);
app.controller("RegController",function($scope){
	
});
app.controller("LoginController",function($scope,$http){
	
	$scope.showResp=false;
	$scope.showForm=true;
	$scope.GetFogotPassResponse=function(){
		$scope.showResp=true;
		$scope.ResponseContent="Loading Data...";
		$scope.showResetBtn=true;
		$http({
			method:"POST",
			url:"/CozyHomes1/account/forgotpassword",
			data:{"forgot_email":$scope.username}
		}).then(function success(response){
			 $scope.ResponseContent=response.data.message;
			 $scope.showResetBtn=false;
			 $scope.username="";
			 $scope.showForm=false;
		     },function error(response){
		    	 $scope.username="";
		    	 $scope.showResetBtn=false;
		    	 $scope.ResponseContent=response.data.errorMessage;
		     });
	}
})
	app.controller("RecoverPController",function($scope,$http,$timeout,$location){
		$scope.showResp=false;
		$scope.setNewPassword=function(){	
			$scope.ResponseContent="Loading Data...";
			$scope.showResp=true;
			$http({
				method:"POST",
				url:"/CozyHomes1/account/recoverpassword",
				data:{"newPassword":$scope.confpass}
			}).then(function success(response){
				 $scope.ResponseContent=response.data.message; 
				 $timeout(function(){window.location.href="http://localhost:9090/CozyHomes1/account/login"},2000);
			     },function error(response){	
			    	 $scope.ResponseContent=response.data.errorMessage;
			     });
		}

})


app.controller("MyPropertyController",function($scope,$http,$timeout,$window){
	$scope.isLoaded=false;
	$scope.deleteProperty=function(propertyId){
		$http({
			method:"POST",
			url:"/CozyHomes1/owner/deleteProperty",
			data:{"propId":propertyId}
		}).then(function success(response){
			$scope.response=response.data.message;
			$scope.isLoaded=true;
			$timeout(function(){$scope.isLoaded=false;$window.location.reload();},1000);
		},
        function error(response){
			$scope.response=response.data.errorMessage;
			$scope.isLoaded=true;
			$timeout(function(){$scope.isLoaded=false;},3000);
		});
		
	};
	
	$scope.updateProperty=function(propertyId){
		$scope.deposite10="1234";
		$http({
			method:"POST",
			url:"/CozyHomes1/owner/updateProperty",
			data:{"propId":propertyId,"rent":$scope.rent+propertyId}
		}).then(function success(response){
			$scope.response=response.data.message;
			$scope.isLoaded=true;
			$timeout(function(){$scope.isLoaded=false;$window.location.reload();},1000);
		},
        function error(response){
			$scope.response=response.data.errorMessage;
			$scope.isLoaded=true;
			$timeout(function(){$scope.isLoaded=false;},3000);
		});
		
	};
	
	$scope.compareString=function(value1,value2){
	
		if (value1 == value2) 
        {
          return true;
        }		
		 return false;
	};
	  $scope.PropertyTypes = [
	  				        {type : " HK"},
	  				        {type : "1BHK"},
	  				        {type : "2BHK"},
	  				        {type : "3BHK"},
	  				        {type : "Banglo"}
	  				        ];
	  				    
	  					    $scope.FurnishingTypes = [
	  					        {type : "Full Furnished"},
	  					        {type : "Semi Furnished"},
	  					        {type : "Without Furnished"}
	  			            ];
	  					    $scope.AccomodationTypes = [
	  					        {type : "Shared"},
	  					        {type : "Private"},
	  					        {type : "Entire"}
	  					        ];
	  					    $scope.Acc_For_Types = [
	  					        {type : "boy"},
	  					        {type : "girl"},
	  					        {type : "family"}
	  			            ];
	  					    $scope.Beds_Rooms = [
	  						    {type : "0"},
	  					        {type : "1"},
	  					        {type : "2"},
	  					        {type : "3"}
	  					        ];
});














































/*add property*/
var app = angular.module('myApp', []);
				app.controller('myCtrl', function($scope) {
					    $scope.PropertyTypes = [
					    {type : "Select Property Type"},
				        {type : " HK"},
				        {type : "1BHK"},
				        {type : "2BHK"},
				        {type : "3BHK"},
				        {type : "Banglo"}
				        ];
				    
					     $scope.FurnishingTypes = [
						    {type : "Select Furnish Type"},
					        {type : "Full Furnished"},
					        {type : "Semi Furnished"},
					        {type : "Without Furnished"}
			            ];
					    $scope.AccomodationTypes = [
						    {type : "Select Accomodation Type"},
					        {type : "Shared"},
					        {type : "Private"},
					        {type : "Entire"}
					        ];
					    $scope.Beds_Rooms = [
						    {type : "0"},
					        {type : "1"},
					        {type : "2"},
					        {type : "3"}
					        ];
				});			