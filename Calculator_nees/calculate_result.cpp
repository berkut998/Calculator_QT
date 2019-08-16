#include "calculate_result.h"

Calculate_Result::Calculate_Result(QObject *parent):
    QObject(parent)
{
}


void Calculate_Result::set_result(QString res)
{
     emit ResultChanged();
     select_term(res);

}

QString Calculate_Result::getResult()
{
    return QString::number(result);
}

bool Calculate_Result::Digit(QString a)
{
    if (a == "+" ||a == "-" ||a == "/" ||a == "²" ||a == "√" ||a == "*")
        return false;
    return true;

}
double Calculate_Result::get_r()
{
     return result;
}
void Calculate_Result::set_r(double r)
{
    emit operationChanged();
    result = r;
}
//return list of items which are selected  numbers and  operations
QList<QString> Calculate_Result::infix_expressio (QString expressio)
{
    QString tmp;
    QList<QString> expressio_list;
    for (int i = 0; i < expressio.length(); i++)
    {
       if (expressio.at(i).isDigit() || expressio.at(i) == ".")
       {
           tmp += expressio.at(i);
       }
       else
       {
           expressio_list.append(tmp);
           expressio_list.append(expressio.at(i));
           tmp = "";
       }
    }
    expressio_list.append(tmp);
    return expressio_list;
}
//return number priorety the operation
int Calculate_Result::Parsing_Priority (QString String_express)
{
        if (String_express.toDouble() != 0.0)
        {
            return 0;
        }
        else if (String_express == "+")
        {
            return 1;
        }
        else if (String_express == "-")
        {
            return 1;
        }
        else if (String_express == "*")
        {
            return 2;
        }
        else if (String_express == "/")
        {
            return 2;
        }
        else if (String_express == "²")
        {
            return 3;
        }
        else if (String_express == "√")
        {
            return 3;
        }
    return -1;
}
//return list in kind of reverse polska notation
QList<QString> Calculate_Result::polska_zapis (QList<QString> &List_express)
{
    QStack<QString> myStack;
    QList<QString>Polska_List;
    for (int i = 0 ; i < List_express.length(); i++)
    {
       if (Parsing_Priority(List_express.at(i)) == 0)
       {
           Polska_List.append(List_express.at(i));
       }
       else if (myStack.isEmpty() || Parsing_Priority(List_express.at(i)) > Parsing_Priority(myStack.top()))
       {
           myStack.push(List_express.at(i));
       }
       else if (Parsing_Priority(List_express.at(i)) == Parsing_Priority(myStack.top()))
       {
           Polska_List.append(myStack.top());
           myStack.pop();
           myStack.push(List_express.at(i));
       }
       else if (Parsing_Priority(List_express.at(i)) < Parsing_Priority(myStack.top()) )
       {
           while (!myStack.isEmpty())
           {
               Polska_List.append(myStack.top());
               myStack.pop();
           }
               myStack.push(List_express.at(i));
       }
    }
    while (!myStack.isEmpty())
    {
        Polska_List.append(myStack.top());
        myStack.pop();
    }
    return Polska_List;
}

void Calculate_Result::polska_calc(QList<QString> List_express)
{
    QStack <QString> stack;
    QString first = "";
    QString second = "";
    QString operation = "";
    for (int i = 0; i <= List_express.length() - 1; i++)
    {
        if (!Digit(List_express.at(i)))
        {
            if (stack.isEmpty() == false)
            {
            operation = List_express.at(i);
            second = stack.top();
            stack.pop();
            if (stack.isEmpty() == false)
            {
            first =stack.top();
            stack.pop();
            }
            result = calculation(first,second,operation);
            stack.push(getResult());
            }
        }
        else
        {
//             if (Digit(List_express.at(i)))
//                 {
//                     set_r(List_express.at(i).toDouble());
//                 }
             stack.push(List_express.at(i));

        }
    }
}

void Calculate_Result::select_term(QString term)
{
    QString postfix, term2 = term;
    QList<QString>postfix_list, polska_list;
    QStack<QString> stack_operation;
    postfix_list = infix_expressio(term2);
    polska_list = polska_zapis(postfix_list);
    polska_calc(polska_list);



//   for (int i = 0; i < term.length(); i++)
//   {
//       //Select number and add it to postfix_list else this is symbol of operation then add him to stac_operation
//       //if new symbol operation have more priority then push srack to prefix list
//       if (term.at(i).isDigit() || term.at(i) == ".")
//       {
//           postfix += term.at(i);
//       }
//       else
//       {
//            postfix_list.append(postfix);
//            postfix = "";
//            if (stack_operation.isEmpty()|| stack_operation.top() != '*' || stack_operation.top() != '/')
//            {
//                stack_operation.push(term.at(i));
//            }
//            else
//            {
//                while (!stack_operation.isEmpty())
//                {
//                    postfix_list.append(stack_operation.top());
//                    stack_operation.pop();
//                }

//            }
//       }



//       if (i == term.length()-1)
//       {
//            postfix_list.append(postfix);
//            while (!stack_operation.isEmpty())
//            {
//                postfix_list.append(stack_operation.top());
//                stack_operation.pop();
//            }
//       }
//    }

//   for (int i = 0 ; i < postfix_list.length(); i++)
//   {
//       if (postfix_list.at(i) == "+" || postfix_list.at(i) == "-" || postfix_list.at(i) == "*" ||
//               postfix_list.at(i) == "/")
//       {

//           result = calculation(postfix_list.at(i-2),postfix_list.at(i-1),postfix_list.at(i).at(0));
//           postfix_list.replace(i-2,QString::number(result));
//           postfix_list.removeAt(i);
//           postfix_list.removeAt(i-1);
//           i = 0;
//       }
//   }
}




double Calculate_Result::calculation(QString a, QString b, QString operand)
{
    if (operand == '+')
    {
        return a.toDouble() + b.toDouble();
    }
    else if (operand == '-')
    {
        return a.toDouble() - b.toDouble();
    }
    else if (operand == '*')
    {
        return a.toDouble() * b.toDouble();
    }
    else if (operand == '/')
    {
        if (b == "0")
            return 0;
        return a.toDouble() / b.toDouble();
    }
    else if (operand == '%')
    {
        return a.toDouble() / 100;
    }
    else if (operand == "²")
    {
        return  qPow(b.toDouble(),2);
    }
    else if (operand == "√")
    {
        return qSqrt(b.toDouble());
    }
    return 1;
}

//this good variantt but  need refactoring code to this work
double Calculate_Result::calculation(QString a, QString operand)
{
    if (operand == "²")
    {
        return  qPow(a.toDouble(),2);
    }
    else if (operand == "√")
    {
        return qSqrt(a.toDouble());
    }
    return 1;
}
