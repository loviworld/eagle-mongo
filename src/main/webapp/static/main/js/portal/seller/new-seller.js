app.config(function($routeProvider) {
	
	//Route Config
	$routeProvider.when('/step-1', {
		controller : 'StepOneCtrl',
		templateUrl : contextPath + '/e/template/portal/seller/step-1'
	}).when('/step-2', {
		controller : 'StepTwoCtrl',
		templateUrl : contextPath + '/e/template/portal/seller/step-2'
	}).when('/step-3', {
		controller : 'StepThreeCtrl',
		templateUrl : contextPath + '/e/template/portal/seller/step-3'
	}).when('/step-4', {
		controller : 'StepFourCtrl',
		templateUrl : contextPath + '/e/template/portal/seller/step-4'
	}).otherwise({
			redirectTo : '/step-1'
	});
});
	

app.service('SellerDataService', function() {

	this.setBusinessCategories = function(businessCategories) {
		this.businessCategories = businessCategories;
	};
	this.getBusinessCategories = function() {
		return this.businessCategories;
	};
	
	this.setDeals = function(deals) {
		this.deals = deals;
	};
	this.getDeals = function() {
		return this.deals;
	};
	
	this.setSelectedBusinessType = function(selectedBusinessType) {
		this.selectedBusinessType = selectedBusinessType;
	};
	this.getSelectedBusinessType = function() {
		return this.selectedBusinessType;
	};
	this.setEmail = function(email){
		this.email = email;
	};
	this.getEmail = function(){
		return this.email;
	};
	this.setInsertedUserId = function(insertedUserId){
		this.insertedUserId = insertedUserId;
	};
	this.getInsertedUserId = function(){
		return this.insertedUserId;
	};
	
});

app.controller('NewSellerCtrl',function($scope,HTTPClientService){	
});
	
app.controller('StepOneCtrl',function($scope,HTTPClientService,SellerDataService){
	
	//BusinessCategory
	function BusinessCategory(key,state,text){
		this.key = key;
		this.state = state;
		this.text = text;
	}
	
	function initBusinessCategories(){
		if(SellerDataService.getBusinessCategories() != undefined)
			$scope.business_categories = SellerDataService.getBusinessCategories();
		else{
			$scope.business_categories = [ new BusinessCategory('isExporter',false,'Exporter'),
			                               new BusinessCategory('isDealer',false,'Dealer'),
				                           new BusinessCategory('isAuctionAgent',false,'AuctionAgent'),
				                           new BusinessCategory('isSupplier',false,'Supplier'),
				                           new BusinessCategory('isDistributor',false,'Distributor')];
		}
			
			
	}
	
	initBusinessCategories();
		
	$scope.toggleBusinessCategory = function(key,index){
			
		if(key == $scope.business_categories[index].key){
			
			var currentState = $scope.business_categories[index].state;
			$scope.business_categories[index].state = !currentState;
			
		}
		SellerDataService.setBusinessCategories($scope.business_categories);
	};
	
	$scope.changeCSSBusinessCategory = function(key,index){
		var currentState = $scope.business_categories[index].state;
		
		if(currentState == true)
			return 'background-color: blue;color:white'
		else
			return '';
		
	}
	
	//Deals
	function Deal(key,state,text){
		this.key = key;
		this.state = state;
		this.text = text;
	}
	
	function initDeals(){
		if(SellerDataService.getDeals() != undefined)
			$scope.deals = SellerDataService.getDeals();
		else{
			$scope.deals = [ new Deal('isDealsCar',false,'Cars'),
			           	     new Deal('isDealsMachinery',false,'Machinery'),
			        	     new Deal('isDealsSpareParts',false,'SpareParts')];
		}
			
	}
	
	initDeals();
		
	$scope.toggleDeal = function(key,index){	
		if(key == $scope.deals[index].key){
			
			var currentState = $scope.deals[index].state;
			$scope.deals[index].state = !currentState;
		}
		
		SellerDataService.setDeals($scope.deals);
	};
	
	$scope.changeCSSDeal = function(key,index){
		var currentState = $scope.deals[index].state;
		
		if(currentState == true)
			return 'background-color: blue;color:white'
		else
			return '';
		
	}
	
	//Business Type 
	function BusinessType(key,text){
		this.key = key;
		this.text = text;
	}
	$scope.business_types = [ new BusinessType('individual','Individual'),
	                 new BusinessType('sole_proprietorship','Sole proprietorship'),
	                 new BusinessType('partnership','Partnership'),
	                 new BusinessType('corporation','Corporation'),
	                 new BusinessType('private_company','Private Company'),
	                 new BusinessType('public_company','Public company')];
	
	function initSelectedBusinessType(){
		if(SellerDataService.getSelectedBusinessType() != undefined)
			$scope.selectedBusinessType = SellerDataService.getSelectedBusinessType();
		else{
			$scope.selectedBusinessType = undefined;
		}
			
	}
	
	initSelectedBusinessType();
	
	$scope.toggleBusinessTypes = function(key,index){
		
		if(key == $scope.business_types[index].key){
			$scope.selectedBusinessType = $scope.business_types[index];
		}
		SellerDataService.setSelectedBusinessType($scope.selectedBusinessType);
	};
	
	$scope.changeCSSSelectedBusinessType = function(key){
		
		if(($scope.selectedBusinessType == undefined) || ($scope.selectedBusinessType.key != key))
			return '';
		else
			return 'background-color: blue;color:white';
	}
		
});
	
app.controller('StepTwoCtrl',function($scope,HTTPClientService,SellerDataService){
	
	$scope.verifyEmail = function(event,emailVerifyForm){
		var url = contextPath + '/e/sellers/email-verification';
		var data = $("#emailVerifyForm").serialize();
		HTTPClientService.post_request(url,data).then(function(data){
			if(data.hasErrors == false){
				SellerDataService.setEmail($scope.email);
				window.location = contextPath + '/e/sellers'+ '/#/step-3';
			}
				
			else
				alert('Fail-Email-Validation');
		});
	};
});

app.controller('StepThreeCtrl',function($scope,HTTPClientService,SellerDataService){
	//setting email for 2nd Step
	function checkEmail(){
		if(SellerDataService.getEmail() == undefined)
			$scope.email = undefined;
		else
			$scope.email = SellerDataService.getEmail();

	}
	checkEmail();
	
	$scope.checkReTypePassword = function(){
		if($scope.reTypePassword != $scope.password){
			$scope.reTypePasswordNotMatch = true;
		}
		else{
			$scope.reTypePasswordNotMatch = false;
		}
	};
	
	$scope.submitData = function(){
		
		var postData = {};
		
		if($scope.email == undefined){
			alert("Please fill email");
			return;
		}
		postData['email'] = $scope.email
		
		if($scope.password == undefined){
			alert("Please fill password");
			return;
		}
		postData['password'] = $scope.password
		
		//process BusinessCategories
		var businessCategories = SellerDataService.getBusinessCategories();
		if(businessCategories == undefined){
			alert("Please select business category");
			return;
		}
		for(var index in businessCategories){
			var key = businessCategories[index].key;
			var state = businessCategories[index].state;
			postData[key] = state;
		}
		
		//process Deals
		var deals = SellerDataService.getDeals();
		if(deals == undefined){
			alert("Please select deals");
			return;
		}
		for(var index in deals){
			var key = deals[index].key;
			var state = deals[index].state;
			postData[key] = state;
		}
		
		//process BusinessType
		var bizType = SellerDataService.getSelectedBusinessType().key;
		if(bizType == undefined){
			alert("Please select bizType");
			return;
		}
		postData['bizType'] = bizType;
		
		var url = contextPath + '/e/sellers/step-1';
		var data = $.param(postData);
		HTTPClientService.post_request(url,data).then(function(data){
			if(data.hasErrors == false){
				var insertedUserId = data.result.id;
				SellerDataService.setInsertedUserId(insertedUserId);
				alert('Successfully submit data');
				window.location = contextPath + '/e/sellers'+ '/#/step-4';
			}
			else
				alert('step-1 Error in data submition');
		});
	};
	
	
	
});

app.controller('StepFourCtrl',function($scope,HTTPClientService,SellerDataService){
	//console.log(SellerDataService.getInsertedUserId());
	//SellerDataService.setInsertedUserId(44);//testing
	
	$scope.getId = function(){
		return	SellerDataService.getInsertedUserId();
	};
	
	function loadCountries(){
		var url = contextPath + '/e/countries';
		HTTPClientService.get_request(url).then(function(data){
			//console.log(data);
			if(data.hasErrors == false){
				$scope.countriesArray = data.result;
			}
			else
				return [];
		});
	};
	loadCountries();
	
	$scope.submitData = function(){
		var url = contextPath + '/e/sellers/step-2';
		var data = $("#stepFourForm").serialize();
		HTTPClientService.post_request(url,data).then(function(data){
			console.log(data);
			if(data.hasErrors == false){
				alert('Successfully submit data');
				window.location = contextPath + '/e/sellers'+ '/#/step-1';
			}
			else
				alert('step-1 Error in data submition');
		});
		console.log(data);
	};
});