//
//  podcastInfoViewController.swift
//  podcastApp
//
//  Created by omar arenas landgrave on 12/11/17.
//  Copyright © 2017 omar arenas landgrave. All rights reserved.
//

import UIKit


class podcastInfoViewController: UIViewController , UITableViewDataSource  {
    
    @IBOutlet weak var artisName: UILabel!
    @IBOutlet weak var artisPhoto: UIImageView!
    @IBOutlet weak var tablaList: UITableView!
    
    var imageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "PodcastListTableViewCell", bundle: nil)
        self.tablaList.register(nib, forCellReuseIdentifier: "cellTable")
        
        tablaList.dataSource = self
        tablaList.rowHeight = 90.0
        artisPhoto.image = UIImage.init(named: imageName!)
        artisName.text = imageName!
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = false
  
    }
  
}


extension podcastInfoViewController {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cellT : PodcastListTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellTable") as! PodcastListTableViewCell
        return cellT
        
    }
    
    
}
