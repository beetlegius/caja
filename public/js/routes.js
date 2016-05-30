angular.module('caja').config(function($stateProvider, $urlRouterProvider) {

// For any unmatched url, redirect to /moves
$urlRouterProvider.otherwise("/");

//
// Now set up the states
$stateProvider
  .state('root', {
    url: "/",
    templateUrl: "partials/root.html",
    resolve: {
      cashs: function($http) {
        return $http({ method: 'GET', url: '/api/cashs' });
      }
    },
    controller: function($scope, cashs) {
      $scope.cashs = cashs.data;
    }
  })
  .state('root.moves', {
    url: "moves",
    templateUrl: "partials/moves.html",
    resolve: {
      moves: function($http) {
        return $http({ method: 'GET', url: '/api/moves' });
      }
    },
    controller: function($scope, moves) {
      $scope.moves = moves.data;
    }
  })
  .state('root.cash', {
    url: "cashs/:cash_id/moves",
    templateUrl: "partials/cash.html",
    resolve: {
      cash: function($http, $stateParams) {
        return $http({ method: 'GET', url: "/api/cashs/" + $stateParams.cash_id });
      },
      moves: function($http, $stateParams) {
        return $http({ method: 'GET', url: '/api/cashs/' + $stateParams.cash_id + '/moves' });
      }
    },
    controller: function($scope, cash, moves) {
      $scope.cash = cash.data;
      $scope.moves = moves.data;
    }
  })
});
