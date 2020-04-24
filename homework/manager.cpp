#include "manager.h"
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QJsonObject>
#include <QJsonDocument>
#include <QDebug>

Manager::Manager(QObject *parent) : QObject(parent)
{
    setProcessing(false);
}

void Manager::authorization(const QString &login, const QString &password)
{
    setProcessing(true);
    QUrl url("http://127.0.0.1:58165/auth");

    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader,
                      "application/json");
    QJsonObject body;
    body["login"] = login;
    body["password"]= password;
    QByteArray bodyData= QJsonDocument(body).toJson();
    QNetworkReply *reply= _net.post(request, bodyData);

    connect(reply, &QNetworkReply::finished,[this,reply]()
    {    
        QString error;
        if(reply->error()!= QNetworkReply::NoError)
        {
            error= reply->errorString();
        }
        QJsonObject obj= QJsonDocument::fromJson(reply->readAll()).object();
        QString token=obj.value("token").toString();
        emit authFinished(error,token);
        setProcessing(false);
        reply->deleteLater();
    });

}

void Manager::registration(const QString &login, const QString &password)
{
    setProcessing(true);
    QUrl url("http://127.0.0.1:58165/register");

    QNetworkRequest request(url);
    request.setHeader(QNetworkRequest::ContentTypeHeader,
                      "application/json");
    QJsonObject body;
    body["login"] = login;
    body["password"]= password;

    QByteArray bodyData= QJsonDocument(body).toJson();

    QNetworkReply *reply= _net.post(request, bodyData);

    connect(reply, &QNetworkReply::finished,[this,reply]()
    {
        QString error;
        if(reply->error()!= QNetworkReply::NoError)
        {
            error= reply->errorString();
        }
        emit registerFinished(error);
        setProcessing(false);
        reply->deleteLater();
    });
}

bool Manager::processing()
{
    return m_processing;
}

void Manager::setProcessing(bool value)
{
    if(m_processing==value)
        return;
    m_processing=value;
    emit processingChanged(value);
}





