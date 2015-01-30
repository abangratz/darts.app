playerService = angular.module('playerService', ['ngResource'])

playerService.factory('Player', ['$resource', ($resource) ->
	$resource('players.json', {}, {query: {method: 'GET', isArray: true}})
])

darts = angular.module('darts', ['ngMaterial', 'templates', 'ngRoute', 'playerService'])
	.config(['$mdThemingProvider', ($mdThemingProvider) ->
		$mdThemingProvider.theme('default')
		.primaryColor('green')
		.accentColor('light-green')
	])

darts.controller('EntryController', ['$scope', 'Player', ($scope, Player) ->
	$scope.entries = Player.query()
])


