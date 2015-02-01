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
	$scope.player = {name: '', at: new Date()} unless $scope.player and $scope.player.at isnt null
	$scope.reload = () ->
		$scope.entries = Players.query({at: $scope.player.at})
	$scope.save = () ->
		if $scope.playerform.$valid
			Players.create({player: $scope.player}, (data) ->
				new_player =
					id: data.id
					name: data.name
					at: data.at
				$scope.entries.push new_player
				$scope.player.name = ''
			)
	$scope.delete = (entry) ->
		Player.delete({id: entry.id}, () ->
			$scope.entries = $scope.entries.filter (e) -> e isnt entry
		)
	$scope.reload()
])

