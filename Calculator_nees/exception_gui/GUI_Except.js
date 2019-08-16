// return true if the char a digital else return false
  function isDigit(aChar)
  {
     var myCharCode = aChar.charCodeAt(0);

     if((myCharCode > 47) && (myCharCode <  58))
     {
        return true;
     }
       return false;
  }

function reverse(s){
    return s.split("").reverse().join("");
}

//repeat function not good will change
function del_num ()
{
        for (var i = element.length; i>0;i--)
        {
            if(element.text.indexOf("+",element.text.length-1) > 0 || element.text.indexOf("-",element.text.length-1) > 0 ||
                    element.text.indexOf("*",element.text.length-1) > 0 || element.text.indexOf("/",element.text.length-1) > 0)
            {
                break;
            }
            if (element.text.charAt(element.text.length-1) === "√")
            {
                return element.text
            }
            element.text = element.text.substring(0,element.text.length-1)
        }
        return
}

function ce()
{
    for (var i = element.length; i>0;i--)
    {

        if(element.text.indexOf("+",element.text.length-1) > 0 || element.text.indexOf("-",element.text.length-1) > 0 ||
                element.text.indexOf("*",element.text.length-1) > 0 || element.text.indexOf("/",element.text.length-1) > 0)
        {
            element.text = element.text.substring(0,element.text.length-1)
            break;
        }
        element.text = element.text.substring(0,element.text.length-1)
    }
    return element.text
}
function except_symbol_twice (add)
{
    if(element.text.indexOf("+",element.text.length-1) < 0 && element.text.indexOf("-",element.text.length-1) < 0 &&
            element.text.indexOf("*",element.text.length-1) < 0 && element.text.indexOf("/",element.text.length-1) < 0
            && element.text.length > 0 && element.text.indexOf("√",element.text.length-1) < 0 && element.text.indexOf(".",element.text.length-1) < 0
            && element.text.indexOf("%",element.text.length-1) < 0)
    {
        element.text += add
    }
}
function incl_dot ()
{
    var s = 0
    for(var i = element.text.length-1 ; i > 0;i--)
    {
               s = element.text.charCodeAt(element.text.length-1)
               if (element.text.charAt(i) === ".")
                 {
                     return false
                 }
               if(element.text.charAt(i) ===  "+" || element.text.charAt(i) ===  "-" ||
                       element.text.charAt(i) ===  "*" || element.text.charAt(i) ===  "/" )
               {
                return true
               }
    }
    return true
}

function select_term ()
{
    var s = ""
    for(var i = element.text.length; i >= 0;i--)
    {
        if(element.text.charAt(i) ===  "+" || element.text.charAt(i) ===  "-" ||
                element.text.charAt(i) ===  "*"  || element.text.charAt(i) ===  "/"
                || element.text.charAt(i) ===  "√" || element.text.charAt(i) ===  "²" || i === 0)
        {
                if (isDigit(element.text.charAt(i)))
                {
                 s += element.text.charAt(i)
                }
                del_num ()
//                if (element.text.charAt(i) ===  "√" && i > 1) //if √ not first symbol and we add new digit
//                {
//                    s += "*"
//                }
                s = reverse(s)
                element.text += s

            return s
        }
        else
        {
           s += element.text.charAt(i)
        }
    }
}


function select_numb ()
{
    var s = ""
    for(var i = element.text.length; i >= 0;i--)
    {
        if(element.text.charAt(i) ===  "+" || element.text.charAt(i) ===  "-" ||
                element.text.charAt(i) ===  "*"  || element.text.charAt(i) ===  "/" || i === 0)
        {


                if (isDigit(element.text.charAt(i)))
                {
                 s += element.text.charAt(i)
                }
                del_num ()
                s = reverse(s)
                element.text +="1/"
                element.text += s

            return
        }
        else
        {
           s += element.text.charAt(i)
        }
    }
}
