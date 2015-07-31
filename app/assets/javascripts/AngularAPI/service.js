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
angular.module('APIModule',['BlankModule','PlayerModule','PlaylistModule','SoundcloudModule','CommentModule','UserModule'])
.service('API',['BlankSVC','PlayerSVC','PlaylistSVC','SoundcloudSVC','CommentSVC','UserSVC',function(BlankSVC,PlayerSVC,PlaylistSVC,SoundcloudSVC,CommentSVC,UserSVC){

	// INSERT HERE
	this.player = PlayerSVC.player;
	this.playlists = PlaylistSVC.playlists;
	this.soundclouds = SoundcloudSVC.soundclouds;
	this.comments = CommentSVC.comments;
	this.users = UserSVC.users;

}]);
// Placemarker
angular.module('BlankModule',[])
.service('BlankSVC',[function(){}]);
// ======================================================================
// ======================================================================