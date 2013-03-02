$(document).ready(function(){
  var questionCount = 1;
  //add a question
  $('#add_question').on('click', function(){
    questionCount++;
    var $node = '<p><label for="question'+questionCount+'">Question '+questionCount+':</label><input type="text" name="question'+questionCount+'" id="question'+questionCount+'"><span class="removeQuestion"> Remove Question</span></p>';
    $(this).parent().before($node);
  });
  //remove a question
  $('.removeQuestion').click(function(){
     $(this).parent().remove();
     questionCount--;
  });
});
