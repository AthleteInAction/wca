angular.module('PlayerModule',['ApiModelV1Module'])
.service('PlayerSVC',['ApiModelV1','$timeout',function(ApiModelV1,$timeout){

	this.player = {

		meta: {},

		data: {},

		get: function(complete){

			var t = this;

			t.meta = {};

			t.meta.loading = true;

			var options = {
				one: 'player'
			};

			ApiModelV1.query(options,function(data){

				t.data = data;

				delete t.meta.loading;

				if (complete){complete(data,false);}

			},function(data){

				JP(data);

				delete t.meta.loading;

				if (complete){complete(data,true);}

			});

		},

		save: function(complete){

			var t = this;

			var Item = new ApiModelV1({player: t.data});

			t.meta.loading = true;

			var options = {
				one: 'player'
			};

			Item.$save(options,function(data){

				delete t.meta.loading;

				if (complete){complete(data,false);}

			},function(data){

				JP(data);

				delete t.meta.loading;

				if (complete){complete(data,true);}

			});

		}

	};

}]);