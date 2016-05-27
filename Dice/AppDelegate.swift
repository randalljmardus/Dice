//
//  AppDelegate.swift
//  Dice
//
//  Created by Randall Mardus on 5/26/16.
//  Copyright © 2016 Randall Mardus. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainWindowController: MainWindowController?
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        //Create a window controller
        let mainWindowController = MainWindowController()
        
        //Put the window of the window controller on screen
        mainWindowController.showWindow(self)
        
        //Set the property to point to the window controller
        self.mainWindowController = mainWindowController
    }
}

