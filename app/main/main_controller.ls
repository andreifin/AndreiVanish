angular.module 'AndreiVanish-main',['ngRoute']

.config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'main/main.html'
        controller: 'MainCtrl'

.controller 'MainCtrl', ($scope) ->
  $scope.startingNums = [2,3,4,6]
  $scope.started = false    
  $scope.numbers = $scope.startingNums.concat([])
  $scope.winFlag = false
  $scope.loseFlag = false
  $scope.prev = -1

  $scope.positions = [
    [[]],
    [[]],
    [[10,10],[100,100]],
    [[10,10],[10,100],[50,50]],
    [[10,10],[10,100],[100,10],[100,100]]
  ]

  comDiv = (a, b) -> 
    if a > b 
      comDiv(b, a)
    else
      best = a
      for i from Math.floor(a/2) to 2 by -1
        if a%i == 0 && b%i == 0
          best = i
      if best == a and b%a != 0 
        best = 1
      best

  endCheck = ->
    if (unique numbers).length == 1 && numbers[0] == 1 
      $scope.winFlag = true
    else 
      $scope.loseFlag = true

  $scope.clickEvent = (index) ->
    if (!$scope.started)
      $scope.prev = index
      $scope.started = true
    else
      curr = index
      if curr != $scope.prev  
        div = comDiv($scope.numbers[$scope.prev], $scope.numbers[curr])
        $scope.numbers[$scope.prev] /= div
        $scope.numbers[curr] /= div
        if div != 1
          $scope.prev = curr
    if $scope.numbers[$scope.prev] == 1
      endCheck!

  console.debug comDiv(4, 2)
  console.debug comDiv(2, 4)
  console.debug comDiv(5, 6)
  console.debug comDiv(18, 12)
  
  $scope.reset = ->
    $scope.winFlag = false
    $scope.loseFlag = false
    $scope.started = false
    $scope.numbers = $scope.startingNums.concat([])
