//
//  EditnGaleryVC.swift
//  3DTouch
//
//  Created by Vijendra  on 25/12/18.
//  Copyright © 2018 Vijendra . All rights reserved.
//

import UIKit

class EditnGaleryVC: UIViewController {
    @IBOutlet weak var lblTitleType: UILabel!
    var titleStr : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    func setUI() {
        if let titles = titleStr{
            lblTitleType.text = titles
        } else {
            lblTitleType.text = "Others"
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
