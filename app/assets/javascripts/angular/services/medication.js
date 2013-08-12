angular.module('medicationServices', ['ngResurce']).factory('Medication', function($resource){
  return $resource('medications/:id.json', {}, {
    query: {method: 'GET', params{id: 'medications'}, isArray: true}
  });
});