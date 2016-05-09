app.config(function ($routeProvider) {

    //Route Config
    $routeProvider
        .when('/step-1', {
            controller: 'StepOneCtrl',
            templateUrl: contextPath + '/e/template/portal/buyer/step-1'
        })
        .when('/step-2/individualBuyer', {
            controller: 'StepTwoCtrlIndividualBuyer',
            templateUrl: contextPath + '/e/template/portal/buyer/individualBuyer'
        })
        .when('/step-2/corporateBuyer', {
            controller: 'StepTwoCtrlCorporateBuyer',
            templateUrl: contextPath + '/e/template/portal/buyer/corporateBuyer'
        })
        .otherwise({
            redirectTo: '/step-1'
        });
});
app.service("BuyerDataService", function () {

    this.setBuyerType = function (selectedBuyerType) {
        this.selectedBuyerType = selectedBuyerType;
    }
    this.getBuyerType = function () {
        return this.selectedBuyerType;
    }
});

app.controller('NewBuyerCtrl', function ($scope, HTTPClientService) {
});

app.controller("StepOneCtrl", function ($location, $scope, HTTPClientService, BuyerDataService) {

    function buyerType(key, state, text) {
        this.key = key;
        this.state = state;
        this.text = text;
    }

    function initBuyerType() {
        if (BuyerDataService.getBuyerType() != undefined)
            $scope.buyer_types = BuyerDataService.getBuyerType();
        else {
            $scope.buyer_types = [
                new buyerType('isIndividualBuyer', false, 'IndividualBuyer'),
                new buyerType('isCorporateBuyer', false, 'CorporateBuyer')];
        }


    }

    initBuyerType();

    $scope.toggleBuyerType = function (key, index) {
        if (key == $scope.buyer_types[index].key) {

            var currentState = $scope.buyer_types[index].state;
            $scope.buyer_types[index].state = !currentState;

        }
        BuyerDataService.setBuyerType($scope.buyer_types);
        if ($scope.buyer_types[index].key == 'isIndividualBuyer') {
            $location.path('/step-2/individualBuyer');
        } else {
            $location.path('/step-2/corporateBuyer');
        }

    };

    $scope.changeCSSBuyerType = function (key, index) {
        var currentState = $scope.buyer_types[index].state;

        if (currentState == true)
            return 'background-color: blue;color:white'
        else
            return '';

    }
});

app.controller("StepTwoCtrlIndividualBuyer", function ($scope, HTTPClientService) {

    $scope.submitData = {};
    function individualBuyerForm(key, text, fieldType) {
        this.key = key;
        this.text = text;
        this.fieldType = fieldType;
    }

    function initFormData() {

        HTTPClientService.get_request("/e/countries").then(function (data) {
            console.log(data.result);
            $scope.countries = data.result;
        });
        $scope.individualBuyerFormData = [
            new individualBuyerForm("firstName", "First Name", "text"),
            new individualBuyerForm("lastName", "Last Name", "text"),
            new individualBuyerForm("email", "Email", "text"),
            new individualBuyerForm("password", "Password", "password"),
            new individualBuyerForm("address1", "Address Line 1", "text"),
            new individualBuyerForm("address2", "Address Line 2", "text"),
            new individualBuyerForm("city", "City", "text"),
            new individualBuyerForm("stateProvince", "State / Province", "text"),
            new individualBuyerForm("postalCode", "Postal Code", "text"),
            new individualBuyerForm("mobile", "Mobile Number", "text"),
            new individualBuyerForm("Phone", "Phone Number", "text"),
            new individualBuyerForm("fax", "Fax", "text"),
            new individualBuyerForm("hotline", "Hot Line", "text"),
            new individualBuyerForm("websiteUrl", "Website Url", "text"),
            new individualBuyerForm("receiveNewsLetter", "Receive News Letter", "checkbox"),
            new individualBuyerForm("country", "Country", "select")
        ];
        /*$scope.submitData['firstName'] = "Harshana";
        $scope.submitData['lastName'] = "Samaranayake";
        $scope.submitData['email'] = "awharshana@gmail.com";
        $scope.submitData['password'] = "1234";
        $scope.submitData['address1'] = "No 46/2";
        $scope.submitData['address2'] = "Kabulumulla";
        $scope.submitData['city'] = "Ruwanwela";
        $scope.submitData['stateProvince'] = "Sabaragamuwa";
        $scope.submitData['postalCode'] = "71300";
        $scope.submitData['mobile'] = "0719339036";
        $scope.submitData['Phone'] = "0362265512";
        $scope.submitData['fax'] = "0362265512";
        $scope.submitData['hotline'] = "0362265512";
        $scope.submitData['websiteUrl'] = "www.freethemalloc.blogspot.com";
        $scope.submitData['country'] = "";
        $scope.submitData['receiveNewsLetter'] = true;*/
    }

    initFormData();
    $scope.formSubmit = function () {
        var submittedData = {
            'firstName': $scope.submitData['firstName'],
            'lastName': $scope.submitData['lastName'],
            'email': $scope.submitData['email'],
            'password': $scope.submitData['password'],
            'contactInfo.address1': $scope.submitData['address1'],
            'contactInfo.address2': $scope.submitData['address2'],
            'contactInfo.city': $scope.submitData['city'],
            'contactInfo.stateProvince': $scope.submitData['stateProvince'],
            'contactInfo.postalCode': $scope.submitData['postalCode'],
            'contactInfo.mobile': $scope.submitData['mobile'],
            'contactInfo.Phone': $scope.submitData['Phone'],
            'contactInfo.fax': $scope.submitData['fax'],
            'contactInfo.hotline': $scope.submitData['hotline'],
            'contactInfo.websiteUrl': $scope.submitData['websiteUrl'],
            'contactInfo.country.id': $scope.submitData['country'][0],
            'contactInfo.country.name': $scope.submitData['country'][1],
            'contactInfo.email': $scope.submitData['email'],
            'receiveNewsLetter': $scope.submitData['receiveNewsLetter']
        };

        console.log(submittedData);
        var url = contextPath + '/e/buyer/individual-buyer';
        var data = $.param(submittedData);
        HTTPClientService.post_request(url, data).then(function (data) {
            console.log("response : " + data);
        });
        alert("Submmit");
    };
});

app.controller("StepTwoCtrlCorporateBuyer", function ($scope, HTTPClientService,$location) {

    $scope.submitData = {};
    function corporateBuyerForm(key, text, fieldType) {
        this.key = key;
        this.text = text;
        this.fieldType = fieldType;
    }

    function initFormData() {

        HTTPClientService.get_request(contextPath + "/e/countries").then(function (data) {
            console.log(data.result);
            $scope.countries = data.result;
        });
        $scope.corporateBuyerFormData = [
            new corporateBuyerForm("companyName", "Company  Name", "text"),
            new corporateBuyerForm("companyType", "Type Of Company", "text"),
            new corporateBuyerForm("email", "Email", "text"),
            new corporateBuyerForm("password", "Password", "password"),
            new corporateBuyerForm("address1", "Address Line 1", "text"),
            new corporateBuyerForm("address2", "Address Line 2", "text"),
            new corporateBuyerForm("city", "City", "text"),
            new corporateBuyerForm("stateProvince", "State / Province", "text"),
            new corporateBuyerForm("postalCode", "Postal Code", "text"),
            new corporateBuyerForm("mobile", "Mobile Number", "text"),
            new corporateBuyerForm("Phone", "Phone Number", "text"),
            new corporateBuyerForm("fax", "Fax", "text"),
            new corporateBuyerForm("hotline", "Hot Line", "text"),
            new corporateBuyerForm("websiteUrl", "Website Url", "text"),
            new corporateBuyerForm("receiveNewsLetter", "Receive News Letter", "checkbox"),
            new corporateBuyerForm("country", "Country", "select")
        ];
        /*$scope.submitData['companyName'] = "FTM";
        $scope.submitData['companyType'] = "IT Service";
        $scope.submitData['email'] = "ftm@gmail.com";
        $scope.submitData['password'] = "1234";
        $scope.submitData['address1'] = "No 46/2";
        $scope.submitData['address2'] = "Kabulumulla";
        $scope.submitData['city'] = "Ruwanwela";
        $scope.submitData['stateProvince'] = "Sabaragamuwa";
        $scope.submitData['postalCode'] = "71300";
        $scope.submitData['mobile'] = "0719339036";
        $scope.submitData['Phone'] = "0362265512";
        $scope.submitData['fax'] = "0362265512";
        $scope.submitData['hotline'] = "0362265512";
        $scope.submitData['websiteUrl'] = "www.freethemalloc.blogspot.com";
        $scope.submitData['country'] = "Sri Lanka";
        $scope.submitData['receiveNewsLetter'] = "true";*/
    }

    initFormData();
    $scope.formSubmit = function () {
        var submittedData = {
            'companyName': $scope.submitData['companyName'],
            'companyType': $scope.submitData['companyType'],
            'email': $scope.submitData['email'],
            'password': $scope.submitData['password'],
            'contactInfo.address1': $scope.submitData['address1'],
            'contactInfo.address2': $scope.submitData['address2'],
            'contactInfo.city': $scope.submitData['city'],
            'contactInfo.stateProvince': $scope.submitData['stateProvince'],
            'contactInfo.postalCode': $scope.submitData['postalCode'],
            'contactInfo.mobile': $scope.submitData['mobile'],
            'contactInfo.Phone': $scope.submitData['Phone'],
            'contactInfo.fax': $scope.submitData['fax'],
            'contactInfo.hotline': $scope.submitData['hotline'],
            'contactInfo.websiteUrl': $scope.submitData['websiteUrl'],
            'contactInfo.country.id': $scope.submitData['country'][0],
            'contactInfo.country.name': $scope.submitData['country'][1],
            'contactInfo.email': $scope.submitData['email'],
            'receiveNewsLetter': $scope.submitData['receiveNewsLetter']
        };

        console.log(submittedData);
        var url = contextPath + '/e/buyer/corporate-buyer';
        var data = $.param(submittedData);
        HTTPClientService.post_request(url, data).then(function (data) {
            console.log("response : " + data);
        });
        alert("Submmited");
    };
});