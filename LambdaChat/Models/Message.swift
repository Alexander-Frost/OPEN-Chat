//
//  Message.swift
//  LambdaChat
//
//  Created by Alex on 1/23/20.
//  Copyright © 2019 Alex. All rights reserved.
//

import Foundation
import MessageKit

//Enum to determine what is in the message
enum MessageContent {
    case Image(UIImage)
    case Audio(URL)
    case Text(String)
}

struct Message : MessageType{
        
    var senderID : String
    var senderDisplayName : String
    var receiverID : String
    var kind : MessageKind
    var sentDate : Date
    var messageId : String

    init(withMessageContent : MessageContent, senderID : String, senderDisplayName : String, messageID : String, receiverID : String, timeStamp : Date) {
        
        self.senderID = senderID
        self.messageId = messageID
        self.sentDate = timeStamp
        self.receiverID = receiverID
        self.senderDisplayName = senderDisplayName
        
        switch withMessageContent {
        case .Audio(let audioURL) :
            self.kind = MessageKind.video(MessageMedia(mediaURL : audioURL))
        case .Image(let messageImage) :
            self.kind = MessageKind.photo(MessageMedia(photo : messageImage))
        case .Text(let messageBody) :
            self.kind = MessageKind.text(messageBody)
        }
        
    }

    //Variables used for messageKit messageType declaration
    var sender: SenderType {
        return SendingUser(senderId: senderID, displayName: senderDisplayName)
    }
//    var sender: Sender {
//        return Sender(id: senderID, displayName: senderDisplayName)
//    }
}
struct SendingUser: SenderType, Equatable {
    var senderId: String
    var displayName: String
}
