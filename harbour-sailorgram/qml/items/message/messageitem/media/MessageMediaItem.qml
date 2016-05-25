import QtQuick 2.1
import Sailfish.Silica 1.0
import harbour.sailorgram.TelegramQml 2.0
import "../../../../models"
import "../../../../js/TelegramMedia.js" as TelegramMedia
import "../../../../js/TelegramConstants.js" as TelegramConstants

Item
{
    property alias downloadHandler: downloadhandler

    property Context context
    property var messageModelItem
    property Message message
    property real maxWidth
    property real contentWidth
    property real contentHeight

    readonly property real progressPercent: {
        if(downloadhandler.downloading)
            return (downloadhandler.downloadedSize / downloadhandler.downloadTotal) * 100.0;

        return 0.0;
    }

    function cancelTransfer() {
        downloadhandler.stop();
    }

    function download() {
        downloadhandler.download();
    }

    id: messagemediaitem
    visible: messageModelItem ? messageModelItem.mediaItem : false
    width: Math.min(contentWidth, maxWidth)
    height: contentHeight

    DownloadHandler
    {
        id: downloadhandler
        engine: context.engine
        source: messageModelItem ? messageModelItem.mediaItem : null
    }
}
