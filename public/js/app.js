$(document).ready(function(){
  var questionCount = 1;
  //add a question with 3 choices
  $(this).on("click", '.add-question', function(){
    questionCount++;
    var questionchoices = '<p class="question-tile"><label> Question: </label><input class="question-field" type="text" name="questions[][content]" placeholder="Enter your Question"><br><input class="choice-field" type="text" name="questions[]choices[]" placeholder="question choice"><br><input class="choice-field" type="text" name="questions[]choices[]" placeholder="question choice"><br><input class="choice-field"  type="text" name="questions[]choices[]" placeholder="question choice"><br><br><span class="remove-question"> Remove Question</span></p>'
    $(this).parent().before(questionchoices);
  });

  //remove a question and its choices
  $(this).on("click", '.remove-question', function(){
     $(this).parent().remove();
     questionCount--;
  });
});



