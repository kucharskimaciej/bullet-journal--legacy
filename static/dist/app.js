angular.module("templates",[]),angular.module("navigation",[]),angular.module("ui.form",[]),angular.module("common.models.post",["restangular"]),angular.module("posts",["common.models.post"]),angular.module("app",["restangular","ui.router","templates","navigation","posts","ui.form"]);var app;app=angular.module("app"),app.config(["RestangularProvider",function(t){return t.setBaseUrl("http://localhost:3000"),t.setRestangularFields({id:"_id"})}]),app.run(["$rootScope","$state","$stateParams",function(t,e,o){return t.$state=e,t.$stateParams=o}]);var app;app=angular.module("app"),app.config(["$stateProvider","$urlRouterProvider",function(t,e){t.state("posts",{url:"/",templateUrl:"posts/index/template.tpl.html",controller:"PostsIndexController"}).state("postsNew",{url:"/posts/new",templateUrl:"posts/new/template.tpl.html",controller:"PostsNewController"}),e.otherwise("/")}]),angular.module("navigation").run(["$rootScope",function(t){return t.mainNavigationItems=[{name:"Add Post",icon:"plus",sref:"postsNew"},{name:"Home",icon:"content",sref:"posts"}]}]),angular.module("navigation").directive("navigationItem",function(){return{scope:{title:"@",icon:"@",state:"@"},restrict:"E",require:"^navigationBar",replace:!0,templateUrl:"navigation/item_directive.tpl.html",controller:["$scope",function(t){return t.onSelect=function(e,o){return t.emit("menu:item:selected",o),e.preventDefault()}}]}}),angular.module("navigation").directive("navigationBar",function(){return{scope:{items:"="},restrict:"E",replace:!0,templateUrl:"navigation/navbar_directive.tpl.html"}}),angular.module("common.models.post").provider("Post",function(){var t;t=function(t){return t.addElementTransformer("posts",!1,function(t){return t.created_at=new Date(t.created_at),t})},this.$get=["Restangular",function(e){return e.withConfig(t).service("posts")}]}),angular.module("posts").controller("PostsIndexController",["$scope","Post",function(t,e){return e.getList().then(function(e){return t.posts=e})}]),angular.module("posts").controller("PostsNewController",["$scope","Post",function(t,e){return t.post={},t.onSubmit=function(o,r){return o?e.post(r).then(function(){return t.post={}}):void 0}}]),angular.module("ui.form").directive("uiFormField",function(){return{scope:{label:"@",type:"@",model:"=",options:"=?"},restrict:"E",require:"^ngForm",replace:!0,templateUrl:"ui/form/field.tpl.html",controller:["$scope",function(){}]}});
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIm1vZHVsZXMuY29mZmVlIiwiY29uZmlnLmNvZmZlZSIsInJvdXRlci5jb2ZmZWUiLCJuYXZpZ2F0aW9uL2NvbmZpZy5jb2ZmZWUiLCJuYXZpZ2F0aW9uL2l0ZW1fZGlyZWN0aXZlLmNvZmZlZSIsIm5hdmlnYXRpb24vbmF2YmFyX2RpcmVjdGl2ZS5jb2ZmZWUiLCJjb21tb24vbW9kZWxzL3Bvc3RfbW9kZWwuY29mZmVlIiwicG9zdHMvaW5kZXgvY29udHJvbGxlci5jb2ZmZWUiLCJwb3N0cy9uZXcvY29udHJvbGxlci5jb2ZmZWUiLCJ1aS9mb3JtL2ZpZWxkLmNvZmZlZSJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUFBQSxRQUFRLE9BQU8sZ0RBQWYsUUFDUSxPQUFPLG1FQURmLFFBRVEsT0FBTyxTQUFmLDZDQUZBLDBCQUFBLHlCQUFBLDJCQ0FBLEtBQU0sUUFBUSxPQUFPLG1CQUFyQixzQkFHRSxTQUFBLEdBQ3lDLFNBQXpDLFdBQW9CLHlCQUF5QixFQUFKLHNCQUFBLEdBQUEsb0JBSjNDLGFBT0Usd0JBUEYsU0FBQSxFQUFBLEVBQUEsR0NBQSxrQkFBQSxFQUFBLGFBQUEsWUFBQSxLQUVJLFFBQU8sT0FBQyxPQUdWLElBQUEsUUFFSSxpQkFBQSxxQkFBQSxTQUVBLEVBQVksR0FFZCxFQUFPLE1BQ0wsU0FBQSxJQUFLLElBQ0wsWUFBYSxnQ0FDYixXQUFZLHlCQVRoQixNQUFBLFlBV0EsSUFBQSxhQWhCRixZQUFBLGtFQ0VpQixVQUFBLFFBQ1AsUUFDQSxPQUFNLGNBRE4sS0FBQSxzQkFJQSxHQUFBLE1BQUEsR0FBQSxzQkFFQSxLQUFNLFdBUHVCLEtBQUEsT0FEL0IsS0FBQSxhQ0RBLEtBQVIsWUFFSSxVQUFBLEtBQ0UsYUFERixRQUlBLE9BQVUsY0FKVixVQUFBLGlCQUFBLFdBQUEsT0FNQSxPQUNBLE1BQUEsSUFDQSxLQUFBLFVBRUUsMEJBRlUsaUJBQUEsU0FSWixFQUQyQixZQUFBLHFDQUQvQixxQkNBQSxTQUFlLFNBRVgsR0FBQSxTQUFBLFNBQUEsRUFBQSxHQUNFLE1BREYsR0FDRSxLQUFBLHFCQUFBLEdBQUEsRUFBQSx1QkFGd0IsUUFEOUIsT0FBQSxjQUFBLFVBQUEsZ0JBQUEsa0JDQUEsT0FBUSxNQUFPLEtBRVgsU0FBQSxJQUFBLFNBQVcsY0FDVCxrREFEUyxPQUFBLHNCQUFBLFNBQUEsT0FBQSxXQUFBLEdBQVgsRUFPQSxHQUFBLFNBQVMsU0FDUCxHQUFXLHNCQUNSLFNBQVEsRUFEWCxTQURNLEdBVFosTUFDb0IsR0FBQSxXQUFBLEdBQUEsTUFBQSxFQUFBLFlBRHBCLDhCQ0VJLFNBRGtDLEdBRHRDLE1BQUEsR0FBQSxXQUFBLEdBQUEsUUFBQSw0QkNHVSxTQUFOLFdBQWtCLHdCQUNoQiwyQkFFSSxTQUZKLEdBQUEsVUFBQSxLQUFBLFNBQUEsR0FEZ0IsTUFBQSxHQUFBLE1BQUEsT0NIdEIsUUFBUSxPQUFPLFNBQWYsV0FBQSwrQkFFSSxPQUNFLFNBQUEsRUFBQSxHQUFBLE1BQUEsR0FDQSxRQUNBLEVBRkEsU0FBQSxTQUFBLEVBQUEsR0FHQSxNQUFBLEdBSkYsRUFBQSxLQUFBLEdBQUEsS0FBQSxXQUtBLE1BTEEsR0FBQSxVQUlFLFdBTHNCLFFBRDVCLE9BQUEsV0FBQSxVQUFBLGNBQUEiLCJmaWxlIjoiYXBwLmpzIiwic291cmNlc0NvbnRlbnQiOlsiYW5ndWxhci5tb2R1bGUoJ3RlbXBsYXRlcycsIFtdKVxuYW5ndWxhci5tb2R1bGUoJ25hdmlnYXRpb24nLCBbXSlcbmFuZ3VsYXIubW9kdWxlKCd1aS5mb3JtJywgW10pXG5hbmd1bGFyLm1vZHVsZSgnY29tbW9uLm1vZGVscy5wb3N0JywgWydyZXN0YW5ndWxhciddKVxuYW5ndWxhci5tb2R1bGUoJ3Bvc3RzJywgWydjb21tb24ubW9kZWxzLnBvc3QnXSlcblxuYW5ndWxhci5tb2R1bGUgJ2FwcCcsIFtcbiAgJ3Jlc3Rhbmd1bGFyJ1xuICAndWkucm91dGVyJ1xuICAndGVtcGxhdGVzJ1xuICAnbmF2aWdhdGlvbidcbiAgJ3Bvc3RzJ1xuICAndWkuZm9ybSdcbl0iLCJhcHAgPSBhbmd1bGFyLm1vZHVsZSgnYXBwJylcblxuYXBwLmNvbmZpZyAoIFJlc3Rhbmd1bGFyUHJvdmlkZXIgKSAtPlxuICBSZXN0YW5ndWxhclByb3ZpZGVyLnNldEJhc2VVcmwgJ2h0dHA6Ly9sb2NhbGhvc3Q6MzAwMCdcbiAgUmVzdGFuZ3VsYXJQcm92aWRlci5zZXRSZXN0YW5ndWxhckZpZWxkcyBpZDogJ19pZCdcblxuYXBwLnJ1biAoJHJvb3RTY29wZSwgJHN0YXRlLCAkc3RhdGVQYXJhbXMpIC0+XG4gICRyb290U2NvcGUuJHN0YXRlID0gJHN0YXRlXG4gICRyb290U2NvcGUuJHN0YXRlUGFyYW1zID0gJHN0YXRlUGFyYW1zIiwiYXBwID0gYW5ndWxhci5tb2R1bGUoJ2FwcCcpXG5cbmFwcC5jb25maWcgKCRzdGF0ZVByb3ZpZGVyLCAkdXJsUm91dGVyUHJvdmlkZXIpIC0+XG5cblxuICAkc3RhdGVQcm92aWRlclxuICAgIC5zdGF0ZSAncG9zdHMnLFxuICAgICAgdXJsOiAnLydcbiAgICAgIHRlbXBsYXRlVXJsOiAncG9zdHMvaW5kZXgvdGVtcGxhdGUudHBsLmh0bWwnXG4gICAgICBjb250cm9sbGVyOiAnUG9zdHNJbmRleENvbnRyb2xsZXInXG5cbiAgICAuc3RhdGUgJ3Bvc3RzTmV3JyxcbiAgICAgIHVybDogJy9wb3N0cy9uZXcnXG4gICAgICB0ZW1wbGF0ZVVybDogJ3Bvc3RzL25ldy90ZW1wbGF0ZS50cGwuaHRtbCdcbiAgICAgIGNvbnRyb2xsZXI6ICdQb3N0c05ld0NvbnRyb2xsZXInXG5cbiAgJHVybFJvdXRlclByb3ZpZGVyLm90aGVyd2lzZSgnLycpXG5cbiAgcmV0dXJuXG4iLCJhbmd1bGFyLm1vZHVsZSgnbmF2aWdhdGlvbicpXG4gICAucnVuICgkcm9vdFNjb3BlKSAtPlxuICAgICAgJHJvb3RTY29wZS5tYWluTmF2aWdhdGlvbkl0ZW1zID0gW1xuICAgICAgICAgIG5hbWU6ICdBZGQgUG9zdCcsXG4gICAgICAgICAgaWNvbjogJ3BsdXMnXG4gICAgICAgICAgc3JlZjogJ3Bvc3RzTmV3J1xuICAgICAgICAsXG4gICAgICAgICAgbmFtZTogJ0hvbWUnLFxuICAgICAgICAgIGljb246ICdjb250ZW50J1xuICAgICAgICAgIHNyZWY6ICdwb3N0cydcbiAgICAgIF1cbiIsImFuZ3VsYXIubW9kdWxlICduYXZpZ2F0aW9uJ1xuICAuZGlyZWN0aXZlICduYXZpZ2F0aW9uSXRlbScsIC0+XG4gICAgc2NvcGU6XG4gICAgICB0aXRsZTogJ0AnXG4gICAgICBpY29uOiAnQCdcbiAgICAgIHN0YXRlOiAnQCdcbiAgICByZXN0cmljdDogJ0UnXG4gICAgcmVxdWlyZTogJ15uYXZpZ2F0aW9uQmFyJ1xuICAgIHJlcGxhY2U6IHllc1xuICAgIHRlbXBsYXRlVXJsOiAnbmF2aWdhdGlvbi9pdGVtX2RpcmVjdGl2ZS50cGwuaHRtbCdcbiAgICBjb250cm9sbGVyOiAoJHNjb3BlKSAtPlxuXG4gICAgICAkc2NvcGUub25TZWxlY3QgPSAoJGV2ZW50LCBzY29wZSkgLT5cbiAgICAgICAgJHNjb3BlLmVtaXQgJ21lbnU6aXRlbTpzZWxlY3RlZCcsIHNjb3BlXG4gICAgICAgICRldmVudC5wcmV2ZW50RGVmYXVsdCgpXG4iLCJhbmd1bGFyLm1vZHVsZSAnbmF2aWdhdGlvbidcbiAgLmRpcmVjdGl2ZSAnbmF2aWdhdGlvbkJhcicsIC0+XG4gICAgc2NvcGU6XG4gICAgICBpdGVtczogJz0nXG4gICAgcmVzdHJpY3Q6ICdFJ1xuICAgIHJlcGxhY2U6IHllc1xuICAgIHRlbXBsYXRlVXJsOiAnbmF2aWdhdGlvbi9uYXZiYXJfZGlyZWN0aXZlLnRwbC5odG1sJ1xuIiwiYW5ndWxhci5tb2R1bGUgJ2NvbW1vbi5tb2RlbHMucG9zdCdcbiAgLnByb3ZpZGVyICdQb3N0JywgLT5cbiAgICBjb25maWdGbiA9IChjb25maWd1cmVyKSAtPlxuICAgICAgY29uZmlndXJlci5hZGRFbGVtZW50VHJhbnNmb3JtZXIgJ3Bvc3RzJywgZmFsc2UsIChwb3N0KSAtPlxuICAgICAgICBwb3N0LmNyZWF0ZWRfYXQgPSBuZXcgRGF0ZShwb3N0LmNyZWF0ZWRfYXQpXG5cbiAgICAgICAgcG9zdFxuXG5cbiAgICBAJGdldCA9IChSZXN0YW5ndWxhcikgLT5cbiAgICAgIFJlc3Rhbmd1bGFyLndpdGhDb25maWcgY29uZmlnRm5cbiAgICAgICAgLnNlcnZpY2UgJ3Bvc3RzJ1xuXG5cbiAgICByZXR1cm5cblxuXG4iLCJhbmd1bGFyLm1vZHVsZSgncG9zdHMnKVxuICAuY29udHJvbGxlciAnUG9zdHNJbmRleENvbnRyb2xsZXInLCAoJHNjb3BlLCBQb3N0KSAtPlxuICAgIFBvc3QuZ2V0TGlzdCgpLnRoZW4gKHBvc3RzKSAtPlxuICAgICAgJHNjb3BlLnBvc3RzID0gcG9zdHNcbiIsImFuZ3VsYXIubW9kdWxlKCdwb3N0cycpXG4gIC5jb250cm9sbGVyICdQb3N0c05ld0NvbnRyb2xsZXInLCAoJHNjb3BlLCBQb3N0KSAtPlxuICAgICRzY29wZS5wb3N0ID0ge31cbiAgICAkc2NvcGUub25TdWJtaXQgPSAoaXNWYWxpZCwgZGF0YSkgLT5cbiAgICAgIGlmIGlzVmFsaWRcbiAgICAgICAgUG9zdC5wb3N0KGRhdGEpLnRoZW4gLT5cbiAgICAgICAgICAkc2NvcGUucG9zdCA9IHt9XG5cblxuIiwiYW5ndWxhci5tb2R1bGUgJ3VpLmZvcm0nXG4gIC5kaXJlY3RpdmUgJ3VpRm9ybUZpZWxkJywgLT5cbiAgICBzY29wZTpcbiAgICAgIGxhYmVsOiAnQCdcbiAgICAgIHR5cGU6ICdAJ1xuICAgICAgbW9kZWw6ICc9J1xuICAgICAgb3B0aW9uczogJz0/J1xuICAgIHJlc3RyaWN0OiAnRSdcbiAgICByZXF1aXJlOiAnXm5nRm9ybSdcbiAgICByZXBsYWNlOiB5ZXNcbiAgICB0ZW1wbGF0ZVVybDogJ3VpL2Zvcm0vZmllbGQudHBsLmh0bWwnXG4gICAgY29udHJvbGxlcjogKCRzY29wZSkgLT5cbiJdLCJzb3VyY2VSb290IjoiL3NvdXJjZS8ifQ==