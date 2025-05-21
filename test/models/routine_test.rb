require "test_helper"

class RoutineTest < ActiveSupport::TestCase
  def setup
    @user = User.create!(email: "test@example.com", password: "123456")
  end

  test "debe guardar rutina válida" do
    rutina = Routine.new(title: "Rutina de pecho", context: "Entrenamiento intenso", user: @user)
    assert rutina.save
  end

  test "no debe guardar rutina sin título" do
    rutina = Routine.new(context: "Falta título", user: @user)
    assert_not rutina.save
    assert_includes rutina.errors[:title], "can't be blank"
  end

  test "no debe guardar rutina sin contexto" do
    rutina = Routine.new(title: "Sin contexto", user: @user)
    assert_not rutina.save
    assert_includes rutina.errors[:context], "can't be blank"
  end

  test "no debe guardar rutina sin usuario" do
    rutina = Routine.new(title: "Sin usuario", context: "Falta user")
    assert_not rutina.save
    assert_includes rutina.errors[:user], "must exist"
  end
end
