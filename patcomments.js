function checkForSuggest(element_to_check, suggest_item_type) {
  styleObj = document.getElementById("suggest_category_div").style;
  if (element_to_check.value == suggest_item_type)
    styleObj.display='block';
  else
    styleObj.display='none';
}

function checkType() {
  var returnVal = true;
  var TypeID = document.getElementById("edit-ty-id").value;

  if (TypeID == '') {
    alert("Please select a Comment Type");
    returnVal = false;
  }

  return returnVal;
}
