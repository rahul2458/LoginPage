#include "backendcpp.h"

BackendCpp::BackendCpp(QObject *parent)
    : QObject{parent}
{

}

QString BackendCpp::userName() const
{
    return m_userName;
}

void BackendCpp::setUserName(const QString &newUserName)
{
    if (m_userName == newUserName)
        return;
    m_userName = newUserName;
    emit userNameChanged();
}


QString BackendCpp::passWord() const
{
    return m_passWord;
}

void BackendCpp::setpassWord(const QString &newPassWord)
{
    if(m_passWord == newPassWord) return;

    m_passWord = newPassWord;
    emit passWordChanged();
}


// Accound verification function

void BackendCpp::accountVerify(const QString &user, const QString &password)
{
    if(user == "Shetty" && password == "123456")
    {
        m_UserStatus = true;
    }

    else
    {
        m_UserStatus =  false;
    }

    userVerification(m_UserStatus);
}

