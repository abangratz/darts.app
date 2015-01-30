playerService = angular.module('playerService', ['ngResource'])

playerService.factory('Players', ['$resource', ($resource) ->
	$resource('players.json', {}, {
		query: {method: 'GET', isArray: true},
		create: {method: 'POST'},
	})
])
playerService.factory('Player', ['$resource', ($resource) ->
	$resource('players/:id.json', {id: '@id'}, {
		delete: {method: 'DELETE'},
	})
])

darts = angular.module('darts', ['ngMaterial', 'templates', 'ngRoute', 'playerService'])
	.config(['$mdThemingProvider', ($mdThemingProvider) ->
		$mdThemingProvider.theme('default')
		.primaryColor('green')
		.accentColor('light-green')
	])

darts.controller('EntryController', ['$scope', 'Players', 'Player', ($scope, Players, Player) ->
	$scope.entries = Players.query()
	$scope.save = () ->
		if $scope.playerform.$valid
			Players.create({player: $scope.player}, () ->
				$scope.entries =  Players.query())
	$scope.delete = (entry) ->
		Player.delete({id: entry.id}, () ->
				$scope.entries =  Players.query())
])

