angular.module("templates").run(["$templateCache",function(t){t.put("navigation/item_directive.tpl.html",'<a ui-sref="{{ state }}"><span class="{{ icon }} icon"></span>{{ title }}</a>')}]),angular.module("templates").run(["$templateCache",function(t){t.put("navigation/navbar_directive.tpl.html",'<nav><navigation-item title="{{ item.name }}" state="{{ item.sref }}" icon="{{ item.icon }}" ng-repeat="item in items track by $id(item)"></navigation-item></nav>')}]),angular.module("templates").run(["$templateCache",function(t){t.put("posts/create_update/template.tpl.html",'<h1>add new post</h1><form name="newPostForm" ng-submit="onSubmit(newPostForm.$valid, post)" novalidate="novalidate"><ui-form-field type="select" model="post" field="type" label="Type" options="[&quot;regular&quot;, &quot;daily&quot;]"></ui-form-field><ui-form-field type="text" label="Post title" model="post" field="title"></ui-form-field><ui-form-field type="textarea" model="post" field="original_content"></ui-form-field><button type="submit">submit</button></form>')}]),angular.module("templates").run(["$templateCache",function(t){t.put("posts/index/template.tpl.html",'<h1>index</h1><section ng-if="posts.length" class="posts"><ul><li ng-repeat="post in posts">{{ post.title }}<a ui-sref="postsEdit({ postID: post._id })">edit</a><a ng-click="deletePost(post._id)">delete</a></li></ul></section><section ng-if="!posts.length" class="posts"><h2>No posts yet :(</h2></section>')}]),angular.module("templates").run(["$templateCache",function(t){t.put("ui/form/field.tpl.html",'<ng-switch on="type"><div ng-switch-when="text" class="field"><label ng-if="label">{{ label }}</label><input type="{{ type }}" ng-model="model[field]"/></div><div ng-switch-when="textarea" class="field"><label ng-if="label">{{ label }}</label><textarea ng-model="model[field]"></textarea></div><div ng-switch-when="select" class="field"><label ng-if="label">{{ label }}</label><div class="ui selection dropdown"><div class="default-text">Hi!</div><input type="hidden" ng-model="model[field]"/><i class="dropdown-icon"></i><div class="menu"><div data-value="option" ng-repeat="option in options" class="item">{{ option }}</div></div></div></div></ng-switch>')}]);