function CheckEmail( emailAddress )
{
	var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
	if (!filter.test(emailAddress)) 
	{
		return false;
	}
	return true;
}

function Change()
{
	
	var textFieldElement = document.getElementById("user_email");
	var email = textFieldElement.value;
	if( !CheckEmail(email))
	{
		textFieldElement.setAttribute("class","fieldWithErrors");
	}
	else
	{
		textFieldElement.removeAttribute("class");
	}

}