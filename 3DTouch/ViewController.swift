//
//  ViewController.swift
//  3DTouch
//
//  Created by Vijendra  on 25/12/18.
//  Copyright © 2018 Vijendra . All rights reserved.
//

import UIKit
import EventKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        setUpForceTouch()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let date = Date()
        createReminder(reminderTitle: "Test Reminder", timeInterval: date)
    }
    
    func setUpForceTouch() {
        if traitCollection.forceTouchCapability == .available {
            registerForPreviewing(with: self, sourceView: self.view)
            
        }
    }
    
    func createReminder(reminderTitle: String? = "", timeInterval: Date?) {
        let eventStore = EKEventStore()
        
        eventStore.requestAccess(to: .reminder) { (granted, error) in
            if granted && error == nil {
                let reminder: EKReminder = EKReminder(eventStore: eventStore)
                reminder.title = reminderTitle
                reminder.priority = 2
                reminder.notes = "This is sample notes created by vijendra yadav"
                
                let alarmTime = Date().addingTimeInterval(1*60*24*3)
                let alarm = EKAlarm(absoluteDate: alarmTime)
                reminder.addAlarm(alarm)
                
                reminder.calendar = eventStore.defaultCalendarForNewReminders()
                
                do {
                    try eventStore.save(reminder, commit: true)
                } catch {
                    return
                }
            }
        }
    }
}

extension ViewController: UIViewControllerPreviewingDelegate {
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        
        return self
    }
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
    }
}


