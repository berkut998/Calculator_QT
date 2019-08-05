#ifndef CALCULATE_RESULT_H
#define CALCULATE_RESULT_H
#include <QObject>
#include <QString>
#include <QChar>
#include <QList>
#include <QStack>
#include <QtCore/QtMath>


class Calculate_Result:public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString add READ getResult WRITE set_result NOTIFY ResultChanged)
   // Q_PROPERTY(int qqq READ get_oper WRITE set_oper NOTIFY operationChanged)
public:
    explicit Calculate_Result(QObject *parent = nullptr);
    QString getResult();
    qreal add (qreal a, qreal b);
    void set_result (QString res);
    void select_term (QString term);
    double calculation (QString a, QString b, QString operand);
    double calculation (QString a,QString operand);
    bool Digit (QString a);
    int get_oper ();
    void set_oper (int oper);
    QList<QString> infix_expressio (QString expressio);
    QList<QString> polska_zapis (QList<QString> &List_express);
    int Parsing_Priority (QString String_express);
    void polska_calc (QList<QString> List_express);
signals:
    void ResultChanged();
    void operationChanged();
private:
    double result;
    int operation ;
};
#endif // CALCULATE_RESULT_H
