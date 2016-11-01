import QtQuick 2.1
import Sailfish.Silica 1.0
import "../../js/TextElaborator.js" as TextElaborator

Label
{
    readonly property real calculatedWidth: txthidden.contentWidth

    property bool openUrls: true
    property string emojiPath
    property string rawText

    Text { id: txthidden; visible: false; text: messagetext.text; font: messagetext.font; wrapMode: Text.NoWrap }

    id: messagetext
    textFormat: Text.StyledText
    text: TextElaborator.elaborate(rawText, emojiPath, font.pixelSize, "red", openUrls)
    verticalAlignment: Text.AlignTop

    onLinkActivated: {
        if(!openUrls)
            return;

        Qt.openUrlExternally(link);
    }
}
