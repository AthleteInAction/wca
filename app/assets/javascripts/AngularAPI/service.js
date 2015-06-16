// GET CSRF-Token
// ======================================================================
// ======================================================================
var csrf;
App.config(['$httpProvider',function($httpProvider){
		$httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
		csrf = $('meta[name=csrf-token]').attr('content');
	}
]);
// ======================================================================
// ======================================================================


// API
// ======================================================================
// ======================================================================
angular.module('APIModule',['BlankModule','InstagramModule','ScoreModule','TeetimeModule','GenerateModule','CourseModule','RoundModule','UserModule','Event_userModule','EventModule'])
.service('API',['BlankSVC','InstagramSVC','ScoreSVC','TeetimeSVC','GenerateSVC','CourseSVC','RoundSVC','UserSVC','Event_userSVC','EventSVC',function(BlankSVC,InstagramSVC,ScoreSVC,TeetimeSVC,GenerateSVC,CourseSVC,RoundSVC,UserSVC,Event_userSVC,EventSVC){

	// INSERT HERE
	this.instagrams = InstagramSVC.instagrams;
	this.scores = ScoreSVC.scores;
	this.teetimes = TeetimeSVC.teetimes;
	this.generate = GenerateSVC;
	this.courses = CourseSVC.courses;
	this.rounds = RoundSVC.rounds;
	this.users = UserSVC.users;
	this.event_users = Event_userSVC.event_users;
	this.events = EventSVC.events;

}]);
// Placemarker
angular.module('BlankModule',[])
.service('BlankSVC',[function(){}]);
// ======================================================================
// ======================================================================