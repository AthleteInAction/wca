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
		'plangular'
	]
);
App.value('$anchorScroll',angular.noop);
$(document).on('ready page:load', function(arguments) {
  angular.bootstrap(document.body, ['App'])
});

App.config(function(plangularConfigProvider){
	plangularConfigProvider.clientId = '4d0e36fdbe21f60751fa33f6c3ab37b9';
});