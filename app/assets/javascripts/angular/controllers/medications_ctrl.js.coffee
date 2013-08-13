App.controller 'MedicationsCtrl', ['$scope', 'Medication', 'Interaction', ($scope, Medication, Interaction) ->
  $scope.selected_medications = []
  $scope.selected_ids = []
  $scope.interaction_text = "Choose meds"

  $scope.medications = Medication.query()

  $scope.addMedication = (med) ->
    $scope.selected_medications.push(med)
    $scope.selected_ids.push(med.id)

    response = Interaction.get({medication_ids: $scope.selected_ids.toString()})
    $scope.interaction_text = response
]