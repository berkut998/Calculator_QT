#include <QtTest>
#include "../Calculator_nees/calculate_result.h"

// add necessary includes here

class Test : public QObject
{
    Q_OBJECT

public:
    Test();
    ~Test();

private slots:
    void test_infix_expressio();
    void polska_test();
    void Parsing_test();
    void polska_calculating();

};

Test::Test()
{

}

Test::~Test()
{

}

void Test::Parsing_test()
{
    Calculate_Result calc;
    QCOMPARE(calc.Parsing_Priority("5"),0);
    QCOMPARE(calc.Parsing_Priority("6.1"),0);
    QCOMPARE(calc.Parsing_Priority("+"),1);
    QCOMPARE(calc.Parsing_Priority("-"),1);
    QCOMPARE(calc.Parsing_Priority("*"),2);
    QCOMPARE(calc.Parsing_Priority("/"),2);

}

void Test::test_infix_expressio()
{
    Calculate_Result caclc;
    QList<QString> list;
    list = caclc.infix_expressio("5+3*7");
    QCOMPARE(list.at(0),"5");
    QCOMPARE(list.at(1),"+");
    QCOMPARE(list.at(2),"3");
    QCOMPARE(list.at(3),"*");
    QCOMPARE(list.at(4),"7");
}

void Test::polska_test()
{
    Calculate_Result caclc;
    QList<QString> list,polska_list;
    list = caclc.infix_expressio("3+4*2/5*2-3");
    polska_list = caclc.polska_zapis(list);
    QCOMPARE(polska_list.at(0),"3");
    QCOMPARE(polska_list.at(1),"4");
    QCOMPARE(polska_list.at(2),"2");
    QCOMPARE(polska_list.at(3),"*");
    QCOMPARE(polska_list.at(4),"5");
    QCOMPARE(polska_list.at(5),"/");
    QCOMPARE(polska_list.at(6),"2");
    QCOMPARE(polska_list.at(7),"*");
    QCOMPARE(polska_list.at(8),"+");
    QCOMPARE(polska_list.at(9),"3");
    QCOMPARE(polska_list.at(10),"-");
}

void Test::polska_calculating()
{
    Calculate_Result caclc;
    QList<QString> list,polska_list;
    list = caclc.infix_expressio("3+4*2/5*2-3");
    polska_list = caclc.polska_zapis(list);
    caclc.polska_calc(polska_list);
    QCOMPARE(caclc.getResult(),"3.2");
}


QTEST_APPLESS_MAIN(Test)

#include "tst_test.moc"
