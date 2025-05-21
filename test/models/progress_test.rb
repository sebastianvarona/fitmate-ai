require "test_helper"

class ProgressTest < ActiveSupport::TestCase
  fixtures :users, :progresses, :routines


  test "debe guardar progreso con todos los datos válidos" do
    progress = progresses(:one)
    assert progress.valid?
  end

  test "no debe guardar progreso sin datos" do
    progress = Progress.new
    assert_not progress.valid?
  end
end
