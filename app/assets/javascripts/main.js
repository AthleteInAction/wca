var App = angular.module('App',
	[
		'APIModule',
		'ngRoute',
		'ngResource',
		'ngSanitize',
		'ui.bootstrap',
		'angularFileUpload',
		'angularNumberPicker',
		'ui.calendar',
		'mediaPlayer'
	]
);

App.value('$anchorScroll',angular.noop);

$(document).on('ready page:load',function(arguments){

	angular.bootstrap(document.body,['App']);

});