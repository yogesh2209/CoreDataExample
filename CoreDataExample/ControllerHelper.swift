//
//  ControllerHelper.swift
//  CoreDataExample
//
//  Created by Yogesh Kohli on 5/2/18.
//  Copyright © 2018 Yogesh Kohli. All rights reserved.
//

import UIKit

//Model Objects
class Friend: NSObject {
    var name: String?
    var profileImageName: String?
}

class Message: NSObject {
    var text: String?
    var date: NSDate?
    var friend: Friend?
}

extension ViewController {
    func setupData(){
        let mark = Friend()
        mark.name = "Mark Zuckerberg"
        mark.profileImageName = "zuckprofile"
        
        let messageMark = Message()
        messageMark.friend = mark
        messageMark.text = "Hello, I am the CEO of Facebook! Nice to meet you!"
        messageMark.date = NSDate()
        
        let yogesh = Friend()
        yogesh.name = "Yogesh Kohli"
        yogesh.profileImageName = "kohli"
        
        let messageYogesh = Message()
        messageYogesh.friend = yogesh
        messageYogesh.text = "Hello, My name is Yogesh! Nice to meet you as well!"
        messageYogesh.date = NSDate()
        
        messages = [messageMark, messageYogesh]
    }
}
