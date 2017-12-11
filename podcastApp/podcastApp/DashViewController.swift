//
//  DashViewController.swift
//  podcastApp
//
//  Created by omar arenas landgrave on 12/11/17.
//  Copyright © 2017 omar arenas landgrave. All rights reserved.
//

import UIKit

class DashViewController: UIViewController, UICollectionViewDataSource , UICollectionViewDelegate{
    
    var preview: UIImageView!
    var collection:UICollectionView!
    var flow : UICollectionViewFlowLayout!
    var names: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "MainArtistCollectionViewCell", bundle: nil)
        self.collection.register( nib , forCellWithReuseIdentifier: "cell")
        names = ["Bang","flop", "HDTGM", "LaurenLapkus" , "night" , "U2" ,"Bang" ]
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func loadView() {
        title = "Podcasts"
        self.view =  UIView.init(frame: UIScreen.main.bounds)
        preview = UIImageView.init()
        preview.translatesAutoresizingMaskIntoConstraints = false
        flow = UICollectionViewFlowLayout.init()
        collection = UICollectionView.init(frame: CGRect.zero , collectionViewLayout: flow)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        flow.itemSize = CGSize.init(width: (UIScreen.main.bounds.width-20)/2, height:  (UIScreen.main.bounds.width-20)/2)
        
        collection.dataSource = self
        collection.delegate = self
        
        collection.backgroundColor = UIColor.clear
        
        self.view.addSubview(collection)
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[collection]|", options:[], metrics: nil, views: ["collection" : collection]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[collection]|", options:[], metrics: nil, views: ["collection" : collection]))
        self.view.backgroundColor = UIColor.blue
        
        
        
    }
    
    func cgColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> CGColor {
        return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0).cgColor
    }
    
}

extension DashViewController {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell : MainArtistCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MainArtistCollectionViewCell;
        cell.artistPhoto.image = UIImage.init(named: names[indexPath.item])
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool
    {
        
        let podcastIn = podcastInfoViewController()
        podcastIn.imageName = names[indexPath.item]
        self.navigationController?.pushViewController( podcastIn, animated: true)
        return true
    }
    
    override func viewWillLayoutSubviews() {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    
}

