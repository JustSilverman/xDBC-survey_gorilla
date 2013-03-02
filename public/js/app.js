$(document).ready(function(){
  var questionCount = 3;
  var $node = "";
  for (count=0; count < questionCount; count++){
      var displayCount = count+1;
      $node += '<p><label for="question'+displayCount+'">Question '+displayCount+': </label><input type="text" name="question'+displayCount+'" id="question'+displayCount+'"><span class="removeQuestion">Remove Question</span></p>';
  }
    //add them to the DOM
    $('#survey-create-form').append($node);  
    //remove a textfield    
    $('#survey-create-form').on('click', '.removeQuestion', function(){
       $(this).parent().remove();
       count--;
    });
    //add a new node
    $('#addQuestion').on('click', function(){
      count++;
      //I don't get why count and not displayCount here
      $node = '<p><label for="question'+count+'">Question '+count+':</label><input type="text" name="question'+count+'" id="question'+count+'"><span class="removeQuestion">Remove Question</span></p>';
      $(this).parent().before($node); //I don't get this line 
    });
  });
