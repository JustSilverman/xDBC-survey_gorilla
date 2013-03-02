$(document).ready(function(){
  var questionCount = 1;
  //add a question with 3 answers
  $('#add_question').click(function(){
    questionCount++;
    var questionAnswers = '<p><label for="question'+questionCount+'">Question '+questionCount+': </label><input type="text" name="question'+questionCount+'" placeholder="Enter your Question" id="question'+questionCount+'"><span class="removeQuestion"> Remove Question</span><br><input type="text" name="answer1" placeholder="answer 1"><br><input type="text" name="answer2" placeholder="answer 2"><br><input type="text" name="answer3" placeholder="answer 3"></p>'
    $(this).parent().before(questionAnswers); 
  });
  //remove a question and its answers  
  $(this).on("click", '.removeQuestion', function(){
    
     $(this).parent().remove();
     questionCount--;
  });
});
