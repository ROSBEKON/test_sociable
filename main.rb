if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/result_print'
require_relative 'lib/test'
result_print = ResultPrint.new
test = Test.new

puts "Тест содержит возможность определить уровень коммуникабельности человека.\n" \
     "Отвечать на вопросы следует используя три варианта ответа \n" \
     "да = 1, иногда = 2 и нет = 3"

current_path = File.dirname(__FILE__)
file_answer = current_path + "/data/anser.txt"
file_question = current_path + "/data/question.txt"

result_print.result_print(test.test_questions(File.readlines(file_question, encoding: "UTF-8")),
                          File.readlines(file_answer, encoding: "UTF-8"))
