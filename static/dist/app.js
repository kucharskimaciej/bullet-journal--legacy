angular.module("templates",[]),angular.module("navigation",[]),angular.module("common.models.post",["restangular"]),angular.module("posts",["common.models.post"]),angular.module("app",["restangular","ui.router","templates","navigation","posts"]);var app;app=angular.module("app"),app.config(["RestangularProvider",function(t){return t.setBaseUrl("http://localhost:3000"),t.setRestangularFields({id:"_id"})}]),app.run(["$rootScope","$state","$stateParams",function(t,e,n){return t.$state=e,t.$stateParams=n}]);var app;app=angular.module("app"),app.config(["$stateProvider","$urlRouterProvider",function(t,e){e.otherwise("/"),t.state("posts",{url:"/",templateUrl:"posts/index/template.tpl.html",controller:"PostsIndexController",controllerAs:"ctrl"}).state("posts.new",{url:"posts/new"})}]),angular.module("navigation").run(["$rootScope",function(t){return t.mainNavigationItems=[{name:"Add Post",icon:"plus",sref:"posts.new"},{name:"Home",icon:"content",sref:"posts"}]}]),angular.module("navigation").directive("navigationItem",function(){return{scope:{title:"@",icon:"@",state:"@"},restrict:"E",require:"^navigationBar",replace:!0,templateUrl:"navigation/item_directive.tpl.html",controller:["$scope",function(t){return t.onSelect=function(e,n){return t.emit("menu:item:selected",n),e.preventDefault()}}]}}),angular.module("navigation").directive("navigationBar",function(){return{scope:{items:"="},restrict:"E",replace:!0,templateUrl:"navigation/navbar_directive.tpl.html"}}),angular.module("common.models.post").provider("Post",function(){var t;t=function(t){return t.addElementTransformer("posts",!1,function(t){return t.created_at=new Date(t.created_at),t})},this.$get=["Restangular",function(e){return e.withConfig(t).service("posts")}]}),angular.module("posts").controller("PostsIndexController",["$scope","Post",function(t,e){return e.getList().then(function(e){return t.posts=e})}]);
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm1vZHVsZXMuY29mZmVlIiwiY29uZmlnLmNvZmZlZSIsInJvdXRlci5jb2ZmZWUiLCJuYXZpZ2F0aW9uL2NvbmZpZy5jb2ZmZWUiLCJuYXZpZ2F0aW9uL2l0ZW1fZGlyZWN0aXZlLmNvZmZlZSIsIm5hdmlnYXRpb24vbmF2YmFyX2RpcmVjdGl2ZS5jb2ZmZWUiLCJjb21tb24vbW9kZWxzL3Bvc3RfbW9kZWwuY29mZmVlIiwicG9zdHMvaW5kZXgvY29udHJvbGxlci5jb2ZmZWUiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUEsUUFBUSxPQUFPLGdEQUFmLFFBQ1EsT0FBTyxzQkFEZiwrREFBQSxRQUVRLE9BQU8scUJBRmYsd0JBQUEsOEJDQUEsS0FBTSxRQUFRLE9BQU8sbUJBQXJCLHNCQUdFLFNBQUEsR0FDeUMsU0FBekMsV0FBb0IseUJBQXlCLEVBQUosc0JBQUEsR0FBQSxvQkFKM0MsYUFPRSx3QkFQRixTQUFBLEVBQUEsRUFBQSxHQ0FBLGtCQUFBLEVBQUEsYUFBQSxZQUFBLEtBRUksUUFBTyxPQUFDLE9BQ1YsSUFBQSxRQUVBLGlCQUVJLHFCQUFBLFNBQ0EsRUFBYSxHQUNiLEVBQVksVUFBQSxLQUNaLEVBQWMsTUFIZCxTQUtELElBQU0sSUFDTCxZQUFLLGdDQVhBLFdBQUEsdUJBRlgsYUFBQSx5RENHVSxPQUFBLGNBQUEsS0FBQSxhQUFBLFNBQ00sR0FETixNQUVBLEdBQU0sc0JBRU4sS0FBTSxXQUNOLEtBQU0sT0FDTixLQUFNLGNBVGhCLEtBQUEsc0JDQVEsS0FBUixhQUdNLFFBRUEsT0FBTyxjQUZQLFVBQUEsaUJBQUEsa0JBR0YsT0FDQSxNQUFTLElBQ1QsS0FBQSxJQUNBLE1BQUEsY0FHRSxJQUNFLFFBQUEsd0NBSFEscUNBQUEsWUFUZSxTQUQvQixTQUFBLG1DQ0VJLE1BRkksR0FBTyxLQUFBLHFCQUNGLEdBQ1QsRUFBQSx1QkFBQSxRQUlBLE9BQUEsY0FBYSxVQUFBLGdCQUpiLGtCQUZKLE9BQUEsTUFBQSxrQkNBQSxTQUFRLEVBRUosWUFBQSwwQ0FFSSxRQUFBLE9BQUssc0JBQTBCLFNBQUMsT0FBaEMsbUJBRk8sU0FBQSxHQUFYLE1BQUEsR0FBQSxzQkFBQSxTQUFBLEVBQUEsU0FBQSxTQU9DLEdBQUQsV0FBUyxHQUFBLE1BQUEsRUFBRCxZQUNOLGdCQ1ZOLHVCQUVTLFNBQ0gsR0FBQSxXQURrQixHQUFBLFFBQUEiLCJmaWxlIjoiYXBwLmpzIiwic291cmNlc0NvbnRlbnQiOlsiYW5ndWxhci5tb2R1bGUoJ3RlbXBsYXRlcycsIFtdKVxuYW5ndWxhci5tb2R1bGUoJ25hdmlnYXRpb24nLCBbXSlcbmFuZ3VsYXIubW9kdWxlKCdjb21tb24ubW9kZWxzLnBvc3QnLCBbJ3Jlc3Rhbmd1bGFyJ10pXG5hbmd1bGFyLm1vZHVsZSgncG9zdHMnLCBbJ2NvbW1vbi5tb2RlbHMucG9zdCddKVxuXG5hbmd1bGFyLm1vZHVsZSAnYXBwJywgW1xuICAncmVzdGFuZ3VsYXInXG4gICd1aS5yb3V0ZXInXG4gICd0ZW1wbGF0ZXMnXG4gICduYXZpZ2F0aW9uJ1xuICAncG9zdHMnXG5dIiwiYXBwID0gYW5ndWxhci5tb2R1bGUoJ2FwcCcpXG5cbmFwcC5jb25maWcgKCBSZXN0YW5ndWxhclByb3ZpZGVyICkgLT5cbiAgUmVzdGFuZ3VsYXJQcm92aWRlci5zZXRCYXNlVXJsICdodHRwOi8vbG9jYWxob3N0OjMwMDAnXG4gIFJlc3Rhbmd1bGFyUHJvdmlkZXIuc2V0UmVzdGFuZ3VsYXJGaWVsZHMgaWQ6ICdfaWQnXG5cbmFwcC5ydW4gKCRyb290U2NvcGUsICRzdGF0ZSwgJHN0YXRlUGFyYW1zKSAtPlxuICAkcm9vdFNjb3BlLiRzdGF0ZSA9ICRzdGF0ZVxuICAkcm9vdFNjb3BlLiRzdGF0ZVBhcmFtcyA9ICRzdGF0ZVBhcmFtcyIsImFwcCA9IGFuZ3VsYXIubW9kdWxlKCdhcHAnKVxuXG5hcHAuY29uZmlnICgkc3RhdGVQcm92aWRlciwgJHVybFJvdXRlclByb3ZpZGVyKSAtPlxuICAkdXJsUm91dGVyUHJvdmlkZXIub3RoZXJ3aXNlKCcvJylcblxuICAkc3RhdGVQcm92aWRlclxuICAgIC5zdGF0ZSAncG9zdHMnLFxuICAgICAgdXJsOiAnLydcbiAgICAgIHRlbXBsYXRlVXJsOiAncG9zdHMvaW5kZXgvdGVtcGxhdGUudHBsLmh0bWwnXG4gICAgICBjb250cm9sbGVyOiAnUG9zdHNJbmRleENvbnRyb2xsZXInXG4gICAgICBjb250cm9sbGVyQXM6ICdjdHJsJ1xuXG4gICAgLnN0YXRlICdwb3N0cy5uZXcnLFxuICAgICAgdXJsOiAncG9zdHMvbmV3J1xuXG4gIHJldHVyblxuIiwiYW5ndWxhci5tb2R1bGUoJ25hdmlnYXRpb24nKVxuICAgLnJ1biAoJHJvb3RTY29wZSkgLT5cbiAgICAgICRyb290U2NvcGUubWFpbk5hdmlnYXRpb25JdGVtcyA9IFtcbiAgICAgICAgICBuYW1lOiAnQWRkIFBvc3QnLFxuICAgICAgICAgIGljb246ICdwbHVzJ1xuICAgICAgICAgIHNyZWY6ICdwb3N0cy5uZXcnXG4gICAgICAgICxcbiAgICAgICAgICBuYW1lOiAnSG9tZScsXG4gICAgICAgICAgaWNvbjogJ2NvbnRlbnQnXG4gICAgICAgICAgc3JlZjogJ3Bvc3RzJ1xuICAgICAgXVxuIiwiYW5ndWxhci5tb2R1bGUgJ25hdmlnYXRpb24nXG4gIC5kaXJlY3RpdmUgJ25hdmlnYXRpb25JdGVtJywgLT5cbiAgICBzY29wZTpcbiAgICAgIHRpdGxlOiAnQCdcbiAgICAgIGljb246ICdAJ1xuICAgICAgc3RhdGU6ICdAJ1xuICAgIHJlc3RyaWN0OiAnRSdcbiAgICByZXF1aXJlOiAnXm5hdmlnYXRpb25CYXInXG4gICAgcmVwbGFjZTogeWVzXG4gICAgdGVtcGxhdGVVcmw6ICduYXZpZ2F0aW9uL2l0ZW1fZGlyZWN0aXZlLnRwbC5odG1sJ1xuICAgIGNvbnRyb2xsZXI6ICgkc2NvcGUpIC0+XG5cbiAgICAgICRzY29wZS5vblNlbGVjdCA9ICgkZXZlbnQsIHNjb3BlKSAtPlxuICAgICAgICAkc2NvcGUuZW1pdCAnbWVudTppdGVtOnNlbGVjdGVkJywgc2NvcGVcbiAgICAgICAgJGV2ZW50LnByZXZlbnREZWZhdWx0KClcbiIsImFuZ3VsYXIubW9kdWxlICduYXZpZ2F0aW9uJ1xuICAuZGlyZWN0aXZlICduYXZpZ2F0aW9uQmFyJywgLT5cbiAgICBzY29wZTpcbiAgICAgIGl0ZW1zOiAnPSdcbiAgICByZXN0cmljdDogJ0UnXG4gICAgcmVwbGFjZTogeWVzXG4gICAgdGVtcGxhdGVVcmw6ICduYXZpZ2F0aW9uL25hdmJhcl9kaXJlY3RpdmUudHBsLmh0bWwnXG4iLCJhbmd1bGFyLm1vZHVsZSAnY29tbW9uLm1vZGVscy5wb3N0J1xuICAucHJvdmlkZXIgJ1Bvc3QnLCAtPlxuICAgIGNvbmZpZ0ZuID0gKGNvbmZpZ3VyZXIpIC0+XG4gICAgICBjb25maWd1cmVyLmFkZEVsZW1lbnRUcmFuc2Zvcm1lciAncG9zdHMnLCBmYWxzZSwgKHBvc3QpIC0+XG4gICAgICAgIHBvc3QuY3JlYXRlZF9hdCA9IG5ldyBEYXRlKHBvc3QuY3JlYXRlZF9hdClcblxuICAgICAgICBwb3N0XG5cblxuICAgIEAkZ2V0ID0gKFJlc3Rhbmd1bGFyKSAtPlxuICAgICAgUmVzdGFuZ3VsYXIud2l0aENvbmZpZyBjb25maWdGblxuICAgICAgICAuc2VydmljZSAncG9zdHMnXG5cblxuICAgIHJldHVyblxuXG5cbiIsImFuZ3VsYXIubW9kdWxlKCdwb3N0cycpXG4gIC5jb250cm9sbGVyICdQb3N0c0luZGV4Q29udHJvbGxlcicsICgkc2NvcGUsIFBvc3QpIC0+XG4gICAgUG9zdC5nZXRMaXN0KCkudGhlbiAocG9zdHMpIC0+XG4gICAgICAkc2NvcGUucG9zdHMgPSBwb3N0c1xuIl0sInNvdXJjZVJvb3QiOiIvc291cmNlLyJ9