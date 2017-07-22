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