#ifndef CALCULATING_H
#define CALCULATING_H
#include <QObject>
#include <QString>
#include <QChar>
#include <QList>
#include <QStack>

class Calculat :public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString add READ getResult WRITE set_result NOTIFY ResultChanged)
   // Q_PROPERTY(int qqq READ get_oper WRITE set_oper NOTIFY operationChanged)

public:
    explicit Calculat(QObject *parent = nullptr);
    QString getResult();
    qreal add (qreal a, qreal b);
    void set_result (QString res);

    void select_term (QString term);
    double calculation (QString a, QString b, QChar operand);

    int get_oper ();
    void set_oper (int oper);
    QList<QString> infix_expressio (const QString &expressio);


signals:
    void ResultChanged();
    void operationChanged();
private:
    double result;

    int operation ;





};
#endif // CALCULATING_H
