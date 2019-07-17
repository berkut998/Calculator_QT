#include "calculating.h"


Calculat::Calculat(QObject *parent):
    QObject(parent)
{
}


void Calculat::set_result(QString res)
{
     emit ResultChanged();
     select_term(res);

}

QString Calculat::getResult()
{
    return QString::number(result);
}


int Calculat::get_oper()
{
     return operation;
}
void Calculat::set_oper(int oper)
{
    emit operationChanged();
    operation = oper;
}

QList<QString> infix_expressio (const QString &expressio)
{   QString tmp;
    QList<QString>expressio_list;
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
       }
    }
    return expressio_list;
}

void Calculat::select_term(QString term)
{
    QString postfix, term2 ="";
    QList<QString>postfix_list;
    QStack<QString> stack_operation;
   for (int i = 0; i < term.length(); i++)
   {


      /* работает но не правильно т.к нет приоретета у операций они просто выполняються слева на право
       * if ( (term.at(i).isDigit() || term.at(i) == ".") && (operand ==' '))
       {
            term1 += term.at(i);
       }
       else if (operand == ' ' && !term.at(i).isDigit() && term1 != "")
        {
            operand = term.at(i);

        }
      else if ((term.at(i).isDigit() || term.at(i) == ".") && (operand != ' ') )
       {
           term2 += term.at(i);
       }
       if((operand!=' ' && !term.at(i).isDigit() && term2 != "" && term.at(i) != ".") || i == term.length()-1)
       {
           result =  calculation(term1,term2,operand);
           term1 = QString::number(result);
           term2 ="";
           operand =term.at(i);;
       }*/

       //Select number and add it to postfix_list else this is symbol of operation then add him to stac_operation
       //if new symbol operation have more priority then push srack to prefix list
       if (term.at(i).isDigit() || term.at(i) == ".")
       {
           postfix += term.at(i);
       }
       else
       {
            postfix_list.append(postfix);
            postfix = "";
            if (stack_operation.isEmpty()|| stack_operation.top() != '*' || stack_operation.top() != '/')
            {
                stack_operation.push(term.at(i));
            }
            else
            {
                while (!stack_operation.isEmpty())
                {
                    postfix_list.append(stack_operation.top());
                    stack_operation.pop();
                }

            }
       }



       if (i == term.length()-1)
       {
            postfix_list.append(postfix);
            while (!stack_operation.isEmpty())
            {
                postfix_list.append(stack_operation.top());
                stack_operation.pop();
            }
       }
    }

   for (int i = 0 ; i < postfix_list.length(); i++)
   {
       if (postfix_list.at(i) == "+" || postfix_list.at(i) == "-" || postfix_list.at(i) == "*" ||
               postfix_list.at(i) == "/")
       {

           result = calculation(postfix_list.at(i-2),postfix_list.at(i-1),postfix_list.at(i).at(0));
           postfix_list.replace(i-2,QString::number(result));
           postfix_list.removeAt(i);
           postfix_list.removeAt(i-1);
           i = 0;
       }
   }
}




double Calculat::calculation(QString a, QString b, QChar operand)
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
        return a.toDouble() / b.toDouble();
    }
    return 1;
}
