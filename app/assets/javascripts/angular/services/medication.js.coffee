App.factory 'Medication', ['$resource', ($resource) ->
  $resource '/medications/:id', id: '@id'
]