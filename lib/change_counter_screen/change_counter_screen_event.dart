abstract class ChangeCounterScreenEvent {}

class CreateCounter extends ChangeCounterScreenEvent {}

class IncrementCounter extends ChangeCounterScreenEvent {}

class DecrementCounter extends ChangeCounterScreenEvent {}