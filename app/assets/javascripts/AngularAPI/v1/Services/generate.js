angular.module('GenerateModule',['ApiModelV1Module'])
.service('GenerateSVC',['ApiModelV1','$timeout',function(ApiModelV1,$timeout){

	this.teetimes = function(params,complete){

		var t = this;

		t.loading = true;

		var options = {one: 'teetimes',two: 'generate'};

		var Item = new ApiModelV1({generator: params});

		Item.$create(options,function(data){

			delete t.loading;

			if (complete){complete(data,false);}

		},function(data){

			delete t.loading;

			if (complete){complete(data,true);}

		});

	};

}]);