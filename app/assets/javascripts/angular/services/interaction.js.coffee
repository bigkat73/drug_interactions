App.factory 'Interaction', ['$resource', ($resource) ->
  $resource '/interactions.json?medication_ids=:medication_ids', medication_ids: '@medication_ids'
]