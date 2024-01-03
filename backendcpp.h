#ifndef BACKENDCPP_H
#define BACKENDCPP_H

#include <QObject>

class BackendCpp : public QObject
{
    Q_OBJECT
public:
    explicit BackendCpp(QObject *parent = nullptr);

    Q_PROPERTY(QString userName READ userName WRITE setUserName NOTIFY userNameChanged)
    Q_PROPERTY(QString passWord READ passWord WRITE setpassWord NOTIFY passWordChanged)

    Q_INVOKABLE void accountVerify(const QString &user, const QString &password);

    QString userName() const;
    void setUserName(const QString &newUserName);

    QString passWord() const;
    void setpassWord(const QString &newPassWord);

signals:
    void userNameChanged();
    void passWordChanged();
    void userVerification(const bool &status);

private:
    QString m_userName;
    QString m_passWord;
    bool m_UserStatus = false;
};

#endif // BACKENDCPP_H
