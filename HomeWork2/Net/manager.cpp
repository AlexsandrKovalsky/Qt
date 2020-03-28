#include "manager.h"
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>
#include <QJsonObject>
#include <QJsonDocument>
#include <QDebug>

Manager::Manager(QObject *parent) : QObject(parent)
{

}

void Manager::authorization(const QString &login, const QString &password)
{
    QUrl url("http://127.0.0.1:59249/auth");

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
        if(reply->error()!= QNetworkReply::NoError)
        {
            qDebug() <<"Error:" << reply->errorString();
        }
        else{
            QJsonObject obj= QJsonDocument::fromJson(reply->readAll()).object();
            QString token=obj.value("token").toString();
            qDebug() <<token;
        }
        reply->deleteLater();
     });

}

void Manager::registration(const QString &login, const QString &password)
{
    QUrl url("http://127.0.0.1:59249/register");

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
        if(reply->error()!= QNetworkReply::NoError)
        {
            qDebug() <<"Error:" << reply->errorString();
        }
        else{
            qDebug() <<"ok";
        }
        reply->deleteLater();
     });
}

