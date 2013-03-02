$(document).ready(function(){
  var questionCount = 1;
  //add a question with 3 choices
  $(this).on("click", '#add_question', function(){
    questionCount++;
    var questionchoices = '<p><label for="question">Question: </label><input type="text" name="questions[][content]" placeholder="Enter your Question"><span class="removeQuestion"> Remove Question</span><br><input type="text" name="questions[]choices[]" placeholder="choice 1"><br><input type="text" name="questions[]choices[]" placeholder="choice 2"><br><input type="text" name="questions[]choices[]" placeholder="choice 3"></p>'
    $(this).parent().before(questionchoices);
  });
  //remove a question and its choices
  $(this).on("click", '.removeQuestion', function(){
     $(this).parent().remove();
     questionCount--;
  });
});



