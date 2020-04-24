#ifndef MANAGER_H
#define MANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QString>

class Manager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool processing READ processing WRITE setProcessing NOTIFY processingChanged)
public:
    explicit Manager(QObject *parent = nullptr);

    Q_INVOKABLE void authorization(const QString &login,
                       const QString &password);

    Q_INVOKABLE void registration(const QString &login,
                      const QString &password);

    bool processing();
    void setProcessing(bool value);


signals:
    void registerFinished(QString error);
    void authFinished(QString error, QString token);
    void processingChanged(bool value);

private:
    QNetworkAccessManager _net;
    bool m_processing;
};

#endif // MANAGER_H
