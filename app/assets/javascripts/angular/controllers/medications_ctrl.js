function MedicationsCtrl($scope, $http){
  $http.get('medications.json').success(function(data) {
    $scope.medications = data;
  });
}