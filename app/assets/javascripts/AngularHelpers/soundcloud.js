App.directive('soundcloud',function(API,$interval){
	return {

		restrict: 'E',
		scope: {},
		templateUrl: '/angularjs/templates/soundcloud.html',
		link: function(scope,element,attrs){

			var client_id = '4d0e36fdbe21f60751fa33f6c3ab37b9';

			scope.API = API;

			scope.API.playlists.get({order: 'priority'},function(data){

				scope.audio.load(scope.API.playlists.list);

			});

			SC.initialize({
				
				client_id: client_id

			});

			scope.search = function(val){

				if (!val || val == ''){
					delete scope.tracks;
					return false;
				}

				SC.get('/tracks',{q: val},function(tracks){

					scope.$apply(function(){

						scope.tracks = tracks;

					});

					JP('Searched: '+val);

				});

			};

			scope.addToPlaylist = function(track){

				var track = API.playlists.new({
					key: 'wca_queue',
					title: track.title,
					username: track.user.username,
					track_id: track.id,
					user_id: current_user.id
				});

				track.save(function(data,error){

					if (!error){

						JP(data);

						delete scope.tracks;

						scope.search_val = null;

						window.location = '#track_'+data.track_id;

					}

				});

			};

			scope.next = function(){

				JP('NEXT');
				scope.audio.next();

			};

			scope.update = $interval(function(){
				
				scope.track();

			},500);

			scope.track = function(){

				JP('TRACK: '+new Date());

				if (current_user.id == 1){

					scope.current_track = API.playlists.list[scope.audio.currentTrack-1];

				// current_track.seek_time = 4324;
				var st = Math.round(angular.copy(scope.audio.currentTime)*1000);

				scope.API.player.data.seek_time = st;
				var m = new Date().getTime();

				scope.API.player.data.playing = scope.audio.playing;
				scope.API.player.data.track_id = scope.audio.currentTrack-1;
				scope.API.player.data.clock_time = m;

				scope.API.player.save();

				} else {

					scope.master = false;

					scope.API.player.get(function(data){

						var m = new Date().getTime();
						var stm = m - data.offset;
						var st = stm / 1000;

						if (data.playing){

							if (!scope.audio.playing || data.track_id != scope.audio.currentTrack-1){
								scope.audio.play(data.track_id);
								scope.audio.seek(st);
							}

						} else {

							if (scope.audio.playing){scope.audio.playPause(data.track_id);}

						}

					});

				}

			};

			scope.API.player.get();

		}

	}

});