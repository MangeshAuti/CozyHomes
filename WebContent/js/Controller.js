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
				$scope.confpass="";
		    	 $scope.mainpass="";
				 $scope.ResponseContent=response.data.message; 
				 $timeout(function(){window.location.href="http://localhost:9090/CozyHomes1/account/login"},2000);
			     },function error(response){
			    	 $scope.confpass="";
			    	 $scope.mainpass="";
			    	 $scope.ResponseContent=response.data.errorMessage;
			     });
		}

})

app.controller("ProfileController",function($scope,$http,$timeout,$location){
		$scope.showResp=false;
		
		//Password change
		$scope.changePassword=function(){	
			$scope.ResponseContent="Loading Data...";
			$scope.showResp=true;
			$http({
				method:"POST",
				url:"/CozyHomes1/user/changePassword",
				data:{"oldPassword":$scope.oldpass,"newPassword":$scope.confpass}
			}).then(function success(response){
				 	$scope.ResponseContent=response.data.message; 
				 	$scope.oldpass="";
			 		$scope.mainpass="";
			 		$scope.confpass="";
				 $scope.showForm=false;
			     },function error(response){
			    	$scope.oldpass="";
			 		$scope.mainpass="";
			 		$scope.confpass="";
			    	$scope.ResponseContent=response.data.errorMessage;
			     });
		}
		
})
	app.controller("MyPropertyController",function($scope,$http,$timeout,$window){
	$scope.isLoaded=false;
	var today=new Date();
	$scope.today = today.toISOString();
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
		var PropDataForId = {};
		   PropDataForId["propId"]=propertyId;
		   var content=	$(".prop_info"+propertyId).each(function() {
			   if(this.id == "rent")
				   PropDataForId[this.id]=parseInt(this.innerText);
			   else
				   PropDataForId[this.id]=this.innerText;
		   });
		   
		$http({
			method:"POST",
			url:"/CozyHomes1/owner/updateProperty",
			data:PropDataForId
		}).then(function success(response){
			$scope.response=response.data.message;
			$scope.isLoaded=true;
			$timeout(function(){$scope.isLoaded=false;$window.location.reload();},3000);
		},
        function error(response){
			$scope.response=response.data.errorMessage;
			$scope.isLoaded=true;
			$timeout(function(){$scope.isLoaded=false;},3000);
		});
		
	};
	
	
	$scope.changePropertyStatus=function(propertyId){
		$http({
			method:"POST",
			url:"/CozyHomes1/owner/propertyStatus",
			data:{"propId":propertyId,"status":$scope.modelvalue[propertyId] }
		}).then(function success(response){
			$scope.response=response.data.message;
			$scope.isLoaded=true;
			$timeout(function(){$scope.isLoaded=false;},3000);
		},
        function error(response){
			$scope.response=response.data.errorMessage;
			$scope.isLoaded=true;
			$timeout(function(){$scope.isLoaded=false;},3000);
		});
		
	};
	
	/*Book Visit*/
	
	$scope.sendMessage=function(propertyId){
		$scope.isLoaded=false;
		$http({
			method:"POST",
			url:"/CozyHomes1/user/bookVisit",
			data:{"propId":propertyId,"msg":$scope.message,"booktime":$scope.booktime }
		}).then(function success(response){
			$scope.response=response.data.message;
			$scope.message='';
			$scope.booktime='';
			$scope.isLoaded=true;
			$timeout(function(){$scope.isLoaded=false;},3000);
		},
        function error(response){
			$scope.response=response.data.errorMessage;
			$scope.message='';
			$scope.booktime='';
			$scope.isLoaded=true;
			$timeout(function(){$scope.isLoaded=false;},3000);
		});
		
	};
	
});

/*Admin Controller*/
app.controller("AdminController",function($scope,$http,$timeout,$window){
	$scope.isLoaded=false;
	$scope.deleteProperty=function(propertyId){
		$http({
			method:"POST",
			url:"/CozyHomes1/admin/deleteProperty",
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
		var PropDataForId = {};
		   PropDataForId["propId"]=propertyId;
		   var content=	$(".prop_info"+propertyId).each(function() {   
			   if(this.id == "rent")
				   PropDataForId[this.id]=parseInt(this.innerText);
			   else
				   PropDataForId[this.id]=this.innerText;
		   });
		   
		$http({
			method:"POST",
			url:"/CozyHomes1/admin/updateProperty",
			data:PropDataForId
		}).then(function success(response){
			$scope.response=response.data.message;
			$scope.isLoaded=true;
			$timeout(function(){$scope.isLoaded=false;$window.location.reload();},3000);
		},
        function error(response){
			$scope.response=response.data.errorMessage;
			$scope.isLoaded=true;
			$timeout(function(){$scope.isLoaded=false;},3000);
		});
		
	};
	
	
	$scope.changePropertyStatus=function(propertyId){
		$http({
			method:"POST",
			url:"/CozyHomes1/admin/propertyVerification",
			data:{"propId":propertyId,"status":$scope.modelvalue[propertyId] }
		}).then(function success(response){
			$scope.response=response.data.message;
			$scope.isLoaded=true;
			$timeout(function(){$scope.isLoaded=false;},3000);
		},
        function error(response){
			$scope.response=response.data.errorMessage;
			$scope.isLoaded=true;
			$timeout(function(){$scope.isLoaded=false;},3000);
		});
		
	};
	
});
/*Search Property*/
app.controller("SearchPropController",function($scope,$http,$timeout){
	$scope.getPropListBySearchPara=function(){	
		$http({
			method:"POST",
			url:"/CozyHomes1/user/search/0",
			data:{"accomFor":$scope.AccomFor,"accomType":$scope.AccomType,"propType":$scope.PropType,"rent":$scope.rent,"city":$scope.city,"searchText":$scope.searchtext}
		}).then(function success(response){
			 $scope.ResponseContent=response.data; 
		     },function error(response){	
		    	 $scope.ResponseContent=response.data.errorMessage;
		     });
	}

})





/*add property*/
var app = angular.module('myApp', []);
				app.controller('myCtrl', function($scope) {
					    $scope.PropertyTypes = [
				        {type : "HK"},
				        {type : "1BHK"},
				        {type : "2BHK"},
				        {type : "3BHK"},
				        {type : "4BHK"},
				        {type : "5BHK"}
				        ];
				    
					     $scope.FurnishingTypes = [
					        {type : "Full Furnished"},
					        {type : "Semi Furnished"},
					        {type : "Un Furnished"}
			            ];
					    $scope.AccomodationTypes = [
					        {type : "Shared"},
					        {type : "Private"},
					        {type : "Entire House"}
					        ];
					    $scope.Beds_Rooms = [
						    {type : "0"},
					        {type : "1"},
					        {type : "2"},
					        {type : "3"},
					        {type : "4"},
					        {type : "5"},
					        {type : "6"},
					        {type : "7"},
					        ];
					    });			