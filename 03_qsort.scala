def qsort[T <% Ordered[T]](list:List[T]):List[T] = {
  list match {
  case Nil => Nil
  case x::xs =>
    val (before,after) = xs partition (_ < x)
    qsort(before) ++ (x :: qsort(after))
  }
}
