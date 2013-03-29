$people = array();
$men = array();
$women = array();

foreach ($people as $person) {
  array_push(($person->gender == 'male' ? $men : $women), $person)
}
