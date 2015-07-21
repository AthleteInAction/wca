angular.module('CommentModule',['ApiModelV1Module'])
.service('CommentSVC',['ApiModelV1','$timeout',function(ApiModelV1,$timeout){

	this.comments = {

		loading: {},

		key: {},

		list: {},

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
				one: 'comments'
			};

			options = $.extend(options,t.input);

			ApiModelV1.query(options,function(data){

				angular.forEach(data.comments,function(val,key){

					if (!t.list[val.section]){t.list[val.section] = [];}
					
					t.list[val.section].push(t.new(val));
					t.key[val.id] = t.new(val);

				});

				t.meta = data.meta;
				
				delete t.loading.get;

				if (complete){complete(t.list[val.section],false);}

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
				one: 'comments',
				id: id
			};

			ApiModelV1.get(options,function(data){

				var u = t.new(data.comment);

				angular.forEach(u,function(val,key){

					obj[key] = val;

				});

				t.key[obj.id] = obj;

				if (complete){complete(data.comment,false);}

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

			var options = {
				one: 'comments'
			};

			options = $.extend(options,params);

			ApiModelV1.query(options,function(data){

				var list = [];

				t.key = {};
				angular.forEach(data.comments,function(val,key){

					if (!t.list[val.section]){t.list[val.section] = [];}

					list[val.section].push(t.new(val));
					t.key[val.id] = t.new(val);

				});

				t.list[val.section] = list;
				
				t.meta = data.meta;

				delete t.loading.get;

				if (complete){complete(t.list[val.section],false);}

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

			api_module.update = function(field,value,complete){

				var new_item = {};
				var new_value = angular.copy(value);
				new_item[field] = new_value;

				if (api_module.x876[field] == new_value){
					return false;
				}

				var ID = api_module.id;

				var options = {
					one: 'comments',
					id: ID
				};

				var Item = new ApiModelV1({comment: new_item});

				api_module.loading = {};
				api_module.loading[field] = 1;

				Item.$save(options,function(data){

					api_module.x876[field] = data.comment[field];
					api_module[field] = data.comment[field];

					api_module.loading[field] = 2;
					$timeout(function(){
						delete api_module.loading[field];
					},2000);

					if (complete){complete(data.comment,false);}

				},function(data){

					JP(data);

					api_module[field] = api_module.x876[field];

					api_module.loading[field] = 3;

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
					one: 'comments'
				};

				var Item = new ApiModelV1({comment: new_item});

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

						angular.forEach(data.comment,function(val,key){

							api_module[key] = val;

						});

						if (complete){complete(data.comment,false);}

					},function(data){

						JP(data);

						api_module.loading = 3;

						if (complete){complete(data,true);}

					});


				} else {

					api_module.loading = true;

					Item.$create(options,function(data){

						angular.forEach(data.comment,function(val,key){

							api_module[key] = val;

						});

						delete api_module.loading;

						if (!t.list[api_module.section]){t.list[api_module.section] = [];}

						t.list[api_module.section].unshift(api_module);
						t.key[api_module.id] = api_module;

						if (complete){complete(data.comment,false);}

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
					one: 'comments',
					id: api_module.id
				};

				ApiModelV1.destroy(options,function(data){

					if (!t.list[val.section]){t.list[val.section] = [];}

					t.list[val.section].removeWhere('id',api_module.id);

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