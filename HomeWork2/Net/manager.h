#ifndef MANAGER_H
#define MANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QString>

class Manager : public QObject
{
    Q_OBJECT
public:
    explicit Manager(QObject *parent = nullptr);

    void authorization(const QString &login,
                       const QString &password);

    void registration(const QString &login,
                      const QString &password);

signals:

private:
    QNetworkAccessManager _net;

};

#endif // MANAGER_H
