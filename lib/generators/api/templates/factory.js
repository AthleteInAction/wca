angular.module('ApiModelV<%= version %>Module',[])
.factory('ApiModelV<%= version %>',[
	'$resource',function($resource){
		return $resource("/api/v<%= version %>/:one/:two/:three/:id/:a/:b/:c.json",
			{
				one: '@one',
				two: '@two',
				three: '@three',
				id: '@id',
				a: '@a',
				b: '@b',
				c: '@c'
			},
			{
				get: {method: 'GET'},
				query: {method: 'GET'},
				create: {method: 'POST'},
				save: {method: 'PUT'},
				destroy: {method: 'DELETE'}
			}
		);
	}
]);