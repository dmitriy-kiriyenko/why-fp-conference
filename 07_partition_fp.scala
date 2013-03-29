val people: Array[Person]
val (men, women) = people partition (_.gender == "male")

val people: Array[Person]
val (men, women) = people.par partition (_.gender == "male")

val people: Array[Person]
val (men, women) = people.par map (_.money) reduce (_+_)

