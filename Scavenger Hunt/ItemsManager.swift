//
//  ItemsManager.swift
//  Scavenger Hunt
//
//  Created by Christina Karolewicz on 2/4/16.
//  Copyright © 2016 Christina Karolewicz. All rights reserved.
//

import UIKit
class ItemsManager {
    var itemsList = [ScavengerHuntItem] ()
    
    func archivePath() ->String? {
        let directoryList = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        if let documentsPath = directoryList.first {
            return documentsPath + "/ScavengerHuntItems"
        
        }
        assertionFailure("Could not determine where to save.")
        return nil
    }
    func save() {
        if let theArchivePath = archivePath() {
            if NSKeyedArchiver.archiveRootObject(itemsList, toFile:theArchivePath) {
                print("Saved successfully.")
            } else {
                assertionFailure("Could Not Save File")
        
            }
            
        }
    }
        init() {
            if let theArchivePath = archivePath() {
                if NSFileManager.defaultManager().fileExistsAtPath(theArchivePath) {
                    itemsList = NSKeyedUnarchiver.unarchiveObjectWithFile(theArchivePath) as!
                    [ScavengerHuntItem]
                }
            }
        }
}
