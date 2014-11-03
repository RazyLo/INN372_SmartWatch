function loginerror(errorType)
{
    if (errorType == "noneUser")
    {
        alert("No such user, please check your ID");
    }
    if (errorType == "detailErroe")
    {
        alert("Invalid Password or Role");
    }

}