// This file generated by libqtelegram-code-generator.
// You can download it from: https://github.com/Aseman-Land/libqtelegram-code-generator
// DO NOT EDIT THIS FILE BY HAND -- YOUR CHANGES WILL BE OVERWRITTEN

#ifndef LQTG_TYPE_WEBPAGE
#define LQTG_TYPE_WEBPAGE

#include "telegramtypeobject.h"
#include <QString>
#include <QtGlobal>
#include "photo.h"

class LIBQTELEGRAMSHARED_EXPORT WebPage : public TelegramTypeObject
{
public:
    enum WebPageType {
        typeWebPageEmpty = 0xeb1477e8,
        typeWebPagePending = 0xc586da1c,
        typeWebPage = 0xa31ea0b5
    };

    WebPage(WebPageType classType = typeWebPageEmpty, InboundPkt *in = 0);
    WebPage(InboundPkt *in);
    virtual ~WebPage();

    void setAuthor(const QString &author);
    QString author() const;

    void setDate(qint32 date);
    qint32 date() const;

    void setDescription(const QString &description);
    QString description() const;

    void setDisplayUrl(const QString &displayUrl);
    QString displayUrl() const;

    void setDuration(qint32 duration);
    qint32 duration() const;

    void setEmbedHeight(qint32 embedHeight);
    qint32 embedHeight() const;

    void setEmbedType(const QString &embedType);
    QString embedType() const;

    void setEmbedUrl(const QString &embedUrl);
    QString embedUrl() const;

    void setEmbedWidth(qint32 embedWidth);
    qint32 embedWidth() const;

    void setFlags(qint32 flags);
    qint32 flags() const;

    void setId(qint64 id);
    qint64 id() const;

    void setPhoto(const Photo &photo);
    Photo photo() const;

    void setSiteName(const QString &siteName);
    QString siteName() const;

    void setTitle(const QString &title);
    QString title() const;

    void setType(const QString &type);
    QString type() const;

    void setUrl(const QString &url);
    QString url() const;

    void setClassType(WebPageType classType);
    WebPageType classType() const;

    bool fetch(InboundPkt *in);
    bool push(OutboundPkt *out) const;

    bool operator ==(const WebPage &b);

private:
    QString m_author;
    qint32 m_date;
    QString m_description;
    QString m_displayUrl;
    qint32 m_duration;
    qint32 m_embedHeight;
    QString m_embedType;
    QString m_embedUrl;
    qint32 m_embedWidth;
    qint32 m_flags;
    qint64 m_id;
    Photo m_photo;
    QString m_siteName;
    QString m_title;
    QString m_type;
    QString m_url;
    WebPageType m_classType;
};

#endif // LQTG_TYPE_WEBPAGE