angular.module('TeetimeModule',['ApiModelV1Module'])
.service('TeetimeSVC',['ApiModelV1','$timeout',function(ApiModelV1,$timeout){

	this.teetimes = {

		loading: {},

		key: {},

		list: [],

		meta: {},

		input: {},

		nextPage: function(complete){

			var t = this;

			if (!t.meta.next_page){
				return false;
			}

			t.input.page = t.meta.next_page;

			var t = this;

			t.meta = {};

			t.loading.get = true;

			var options = {
				one: 'teetimes'
			};

			options = $.extend(options,t.input);

			ApiModelV1.query(options,function(data){

				angular.forEach(data.teetimes,function(val,key){

					t.list.push(t.new(val));
					t.key[val.id] = t.new(val);

				});

				t.meta = data.meta;
				
				delete t.loading.get;

				if (complete){complete(t.list,false);}

			},function(data){

				JP(data);

				delete t.loading.get;

				if (complete){complete(data,true);}

			});

		},

		find: function(id,complete){

			var t = this;
			
			if (t.key[id]){
				if (complete){complete(t.key[id],false);}
				return false;
			}

			var obj = t.new({id: id});

			obj.loading = true;

			var options = {
				one: 'teetimes',
				id: id
			};

			ApiModelV1.get(options,function(data){

				var u = t.new(data.teetime);

				angular.forEach(u,function(val,key){

					obj[key] = val;

				});

				t.key[obj.id] = obj;

				if (complete){complete(data.teetime,false);}

				delete obj.loading;

			},function(data){

				JP(data);

				if (complete){complete(data,true);}

				delete obj.loading;

			});

			return obj;

		},

		get: function(params,complete){

			var t = this;

			t.meta = {};

			t.input = params;

			t.loading.get = true;
			JP(t.loading.get);

			var options = {
				one: 'teetimes'
			};

			options = $.extend(options,params);

			ApiModelV1.query(options,function(data){

				var list = [];

				t.key = {};
				angular.forEach(data.teetimes,function(val,key){

					list.push(t.new(val));
					t.key[val.id] = t.new(val);

				});

				t.list = list;
				
				t.meta = data.meta;

				delete t.loading.get;

				if (complete){complete(t.list,false);}

			},function(data){

				JP(data);

				delete t.loading.get;

				if (complete){complete(data,true);}

			});

		},

		new: function(api_module){

			var t = this;

			if (!api_module){api_module = {};}

			var log = {};
			angular.forEach(api_module,function(val,key){

				log[key] = val;

			});

			api_module.x876 = log;

			api_module.update = function(params,complete){

				var new_params = angular.copy(params);

				var i = 0;
				angular.forEach(new_params,function(val,key){

					if (api_module.x876[key] != val){
						i++;
					}

				});

				if (i==0){return false;}

				var ID = api_module.id;

				var options = {
					one: 'teetimes',
					id: ID
				};

				var Item = new ApiModelV1({teetime: new_params});

				api_module.loading = {};
				angular.forEach(new_params,function(val,key){
					api_module.loading[key] = 1;
				});

				Item.$save(options,function(data){

					angular.forEach(new_params,function(val,key){

						api_module.x876[key] = data.teetime[key];
						api_module[key] = data.teetime[key];

						api_module.loading[key] = 2;

					});

					$timeout(function(){
						angular.forEach(new_params,function(val,key){
							delete api_module.loading[key];
						});
					},2000);

					if (complete){complete(data.teetime,false);}

				},function(data){

					JP(data);
					angular.forEach(new_params,function(val,key){
						
						api_module[key] = api_module.x876[key];
						api_module.loading[key] = 3;

					});

					if (complete){complete(data,true);}

				});

			};

			api_module.save = function(complete){

				var new_item = angular.copy(api_module);
				delete new_item.x876;

				var ID = null;
				if (new_item.id){
					ID = new_item.id;
					delete new_item.id;
				}

				var options = {
					one: 'teetimes'
				};

				var Item = new ApiModelV1({teetime: new_item});

				if (ID){

					api_module.loading = 1;

					options.id = ID;

					Item.$save(options,function(data){

						api_module.loading = 2;
						$timeout(function(){
							delete api_module.loading;
						},2000);

						t.key[api_module.id] = api_module;
						t.key[ID].id = ID;

						angular.forEach(data.teetime,function(val,key){

							api_module[key] = val;

						});

						if (complete){complete(data.teetime,false);}

					},function(data){

						JP(data);

						api_module.loading = 3;

						if (complete){complete(data,true);}

					});


				} else {

					api_module.loading = true;

					Item.$create(options,function(data){

						angular.forEach(data.teetime,function(val,key){

							api_module[key] = val;

						});

						delete api_module.loading;

						t.list.unshift(api_module);
						t.key[api_module.id] = api_module;

						if (complete){complete(data.teetime,false);}

					},function(data){

						JP(data);

						delete api_module.loading;

						if (complete){complete(data,true);}

					});

				}

			};

			api_module.delete = function(complete){

				api_module.loading = true;

				var options = {
					one: 'teetimes',
					id: api_module.id
				};

				ApiModelV1.destroy(options,function(data){

					t.list.removeWhere('id',api_module.id);

					delete api_module.loading;

					if (complete){complete(data,false);}

				},function(data){

					JP(data);

					delete api_module.loading;

					if (complete){complete(data,true);}

				});

			};

			return api_module;

		}

	};

}]);