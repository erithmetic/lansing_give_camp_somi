function CheckEmail( emailAddress )
{
	var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
	if (!filter.test(emailAddress)) 
	{
		return false;
	}
	return true;
}

function ValidateBox( element )
{
	var email = element.value;
	if( !CheckEmail(email))
	{
		element.setAttribute("class","emailError");
	}
	else
	{
		element.setAttribute("class", "standard");
	}

}