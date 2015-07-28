App.directive('soundcloud',function(){
	return {

		restrict: 'E',
		scope: {},
		templateUrl: '/angularjs/templates/soundcloud.html',
		link: function(scope,element,attrs){

			scope.SC = SC;

			scope.test = 987;

			scope.SC.initialize({
				
				client_id: '4d0e36fdbe21f60751fa33f6c3ab37b9'

			});

			scope.play = function(track){

				JP('PLAY');

				scope.SC.stream('/tracks/'+track.id,function(sound){
					
					sound.play();

				});

			};

			scope.search = function(){

				JP('SEARCH');

				SC.get('/tracks', { q: 'notorious' }, function(tracks) {

					scope.$apply(function(){

						scope.track = tracks[0];

						scope.play(scope.track);

					});

				});

			};

			scope.search();

		}

	}
});