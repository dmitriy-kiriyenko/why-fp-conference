actor {
  receive {
    case people: Set[Person] =>
      val (men, women) = people partition (_.gender == 'male')
      Cosmopolitan ! women
      Playboy      ! men
  }
}
