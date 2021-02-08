module TestPassagesHelper
  def test_result(test_passage)
    if test_passage.success?
      "<p class=\"result--success\">You Passed! Your result: #{test_passage.percents}%</p>".html_safe
    else
      "<p class=\"result--fail\">You Failed! Your result: #{test_passage.percents}%</p>".html_safe
    end
  end
end
