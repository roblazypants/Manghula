(function(angular) {
  'use strict';
angular.module('subscriptionApp', [])
  .controller('emailCtrl', ['$scope', function($scope) {
    $scope.email = '';

    $scope.subscribe = function() {
      $scope.email = '';
    };
  }]);
})(window.angular);
