app = angular.module('indexApp', [ 'ngRoute' ]);

app.service('HTTPClientService', function($http) {

	this.get_request = function(url, headersData) {
		var request = undefined;
		if (headersData == undefined)
			request = $http.get(url);
		else
			request = $http.get(url, {
				headers : headersData
			});

		return request.then(handleSuccess, handleError);
	};

	this.post_request = function(url, data, headersData) {
		var request = undefined;
		if (headersData == undefined) {
			request = $http.post(url, data, {
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				}
			});
		} else {
			request = $http.post(url, data, {
				headers : headersData
			});
		}

		return request.then(handleSuccess, handleError);
	};

	function handleError(responce) {
		console.log(responce);
	}

	function handleSuccess(responce) {
		return responce.data;
	}

});