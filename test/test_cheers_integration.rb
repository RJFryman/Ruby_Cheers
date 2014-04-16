require_relative 'helper'

class TestCheersIntegration < MiniTest::Unit::TestCase

  def test_01_a_name_with_no_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "BRT"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... B
Give me a... R
Give me a... T
BRT's just Grand!
EOS
    assert_equal expected_output, shell_output
  end

  def test_02_a_name_with_only_vowels
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "AIU"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me an... A
Give me an... I
Give me an... U
AIU's just Grand!
EOS
    assert_equal expected_output, shell_output
  end

  def test_03_a_name_with_normal_rules_all_caps
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "ROBERT"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... R
Give me an... O
Give me a... B
Give me an... E
Give me a... R
Give me a... T
ROBERT's just Grand!
EOS
    assert_equal expected_output, shell_output
  end

  def test_04_a_name_with_normal_rules_all_lowercase
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "robert"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... R
Give me an... O
Give me a... B
Give me an... E
Give me a... R
Give me a... T
ROBERT's just Grand!
EOS
    assert_equal expected_output, shell_output
  end

  def test_05_a_name_with_normal_rules_all_mixed_cases
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "RoBeRt"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... R
Give me an... O
Give me a... B
Give me an... E
Give me a... R
Give me a... T
ROBERT's just Grand!
EOS
    assert_equal expected_output, shell_output
  end

  def test_06_a_name_with_normal_spaces
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts "robert fryman"
      pipe.close_write
      shell_output = pipe.read
    end
    expected_output = <<EOS
What's your name?
Give me a... R
Give me an... O
Give me a... B
Give me an... E
Give me a... R
Give me a... T
Give me a... F
Give me a... R
Give me a... Y
Give me a... M
Give me an... A
Give me a... N
ROBERT FRYMAN's just Grand!
EOS
    assert_equal expected_output, shell_output
  end

  def test_07_no_name
    shell_output = ""
    IO.popen('ruby cheers.rb', 'r+') do |pipe|
      pipe.puts("")
      pipe.close_write
      shell_output = pipe.read
    end
    assert_raises(NameError) do
      pipe.puts("")
    end
  end

end
