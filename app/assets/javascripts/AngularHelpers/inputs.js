App.directive('onstop',function(){
    return function (scope, element, attrs) {
        element.bind('keyup', function (event) {

        	if (attrs.delay){
        		this.delay = attrs.delay;
        	} else {
        		this.delay = 300;
        	}

        	if (this.timer){clearTimeout(this.timer);}
        	
        	this.timer = setTimeout(function(){scope.$eval(attrs.onstop);},this.delay);

        });
    };
});

App.directive('onenter',function(){
    return {

        restrict: 'A',
        link: function(scope,element,attrs){

            element.bind('keydown',function(event){

                if(event.which === 13 && !event.shiftKey){

                    scope.$apply(function (){
                        scope.$eval(attrs.onenter);
                    });

                    event.preventDefault();

                }

            });

        }

    }
});

App.directive('shiftnewline',function(){
    return {

        link: function(scope,element){

            element.bind('keyup',function(event){

                if (event.keyCode == 13 && event.shiftKey){
                    var content = this.value;
                    var caret = getCaret(this);
                    this.value = content.substring(0,caret)+""+content.substring(caret,content.length);
                    event.stopPropagation();
                }

            });

        }

    }
});

App.directive('animate',function(){
    return {

        restrict: 'C',
        link: function(scope,element,attrs){

            element.bind('mouseover',function(event){



            });

        }

    }
});

App.directive('soundcloud',function(){
    return {

        restrict: 'E',
        scope: {},
        link: function(scope,element,attrs){

            

        }

    }
});


App.directive('comments',['ApiModelV1',function(ApiModelV1){
    return {

        restrict: 'E',
        scope: {
            section: '@',
            addon: '='
        },
        templateUrl: '/angularjs/templates/comments.html',
        link: function(scope,element,attrs){

            scope.current_user = current_user;

            scope.comment = {};

            scope.comments = [];

            scope.getComments = function(){

                JP('GET COMMENTS: '+scope.section);

                this.options = {
                    one: 'comments',
                    section: scope.section,
                    order: '-id'
                };

                var tmp = [];

                ApiModelV1.query(this.options,function(data){

                    angular.forEach(data.comments,function(val,key){

                        tmp.push(val);

                    });

                    scope.comments = tmp;

                });

            };
            scope.getComments();

            scope.submitComment = function(section){

                if (!scope.comment.body){return false;}

                scope.loading = true;

                this.options = {
                    one: 'comments'
                };

                var c = angular.copy(scope.comment);
                c.section = section;

                var Comment = new ApiModelV1({comment: c});

                Comment.$create(this.options,function(data){

                    JP(data);
                    scope.comments.unshift(data.comment);
                    scope.comment.body = null;
                    delete scope.loading;

                    scope.getComments();

                },function(data){

                    JP({e: data});
                    delete scope.loading;

                });

            };

            scope.deleteComment = function(comment){

                if (!confirm('Are you sure you wish to delete this comment?\n\n'+comment.body)){return false;}

                scope.loading = true;

                var options = {
                    one: 'comments',
                    id: comment.id
                };

                ApiModelV1.destroy(options,function(data){

                    scope.comments.removeWhere('id',comment.id);

                    delete scope.loading;

                },function(data){

                    JP(data);

                    delete scope.loading;

                });

            };

        }

    }
}]);