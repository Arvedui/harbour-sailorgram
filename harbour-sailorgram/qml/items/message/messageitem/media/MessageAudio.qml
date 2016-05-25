import QtQuick 2.1
import Sailfish.Silica 1.0
import harbour.sailorgram.TelegramQml 2.0
import "../../../../components"
import "../../../../components/message"
import "../../../../components/mediaplayer/mediacomponents"
import "../../../../js/TelegramHelper.js" as TelegramHelper
import "../../../../js/ColorScheme.js" as ColorScheme

MessageMediaItem
{
    id: messageaudio
    contentWidth: imgpreview.width + Math.max(lblinfo.calculatedWidth, Math.max(lblsize.calculatedWidth, lblduration.calculatedWidth)) + Theme.paddingMedium
    contentHeight: row.height

    MediaPlayerTimings { id: mediaplayertimings }

    Row
    {
        id: row
        width: parent.width
        height: info.height
        spacing: Theme.paddingMedium

        MessageThumbnail
        {
            id: imgpreview
            height: Theme.iconSizeMedium
            width: Theme.iconSizeMedium
            anchors.verticalCenter: info.verticalCenter
            source: "image://theme/icon-m-sounds"

            Rectangle {
                border.width: 1
                border.color: ColorScheme.colorizeLink(message, context)
                anchors { fill: parent; margins: -Theme.paddingSmall }
                color: "transparent"
            }
        }

        Column
        {
            id: info
            width: parent.width - imgpreview.width

            ResizableLabel
            {
                id: lblinfo
                width: parent.width
                verticalAlignment: Text.AlignTop
                horizontalAlignment: Text.AlignLeft
                font.pixelSize: Theme.fontSizeExtraSmall
                color: ColorScheme.colorizeTextItem(messageModelItem, context)
                text: qsTr("Audio recording")
                wrapMode: Text.NoWrap
                elide: Text.ElideRight
            }

            ResizableLabel
            {
                id: lblsize
                width: parent.width
                color: ColorScheme.colorizeTextItem(messageModelItem, context)
                font.pixelSize: Theme.fontSizeExtraSmall
                text: messageModelItem ? qsTr("Size: %1").arg(TelegramHelper.formatBytes(messageModelItem.fileSize, 2)) : ""
                wrapMode: Text.NoWrap
                elide: Text.ElideRight
            }

            ResizableLabel
            {
                id: lblduration
                width: parent.width
                color: ColorScheme.colorizeTextItem(messageModelItem, context)
                font.pixelSize: Theme.fontSizeExtraSmall
                text: messageModelItem ? qsTr("Duration: %1").arg(mediaplayertimings.displayDuration(messageModelItem.fileDuration)) : ""
                wrapMode: Text.NoWrap
                elide: Text.ElideRight
            }

            MessageMediaProgressBar
            {
                id: progressbar
                width: parent.width - Theme.paddingSmall
                barHeight: Theme.paddingSmall
                color: ColorScheme.colorizeTextItem(messageModelItem, context)
                border { color: ColorScheme.colorizeLink(messageModelItem, context); width: 1 }
                visible: downloadHandler.downloading
                value: messageaudio.progressPercent
            }
        }
    }
}
