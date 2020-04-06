#include <QCoreApplication>
#include "Manager.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    Manager auth;
    auth.registration("Kova-mova@gmail.com","qwerty");


    return a.exec();
}
