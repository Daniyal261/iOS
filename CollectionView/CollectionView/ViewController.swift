//
//  ViewController.swift
//  CollectionView
//
//  Created by Raja Adeel Ahmed on 7/2/20.
//  Copyright © 2020 Raja Adeel Ahmed. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var txlInput: UITextField!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    let reuseableId = "MenuCollectionViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        txlInput.delegate = self
        menuCollectionView.delegate  = self
        menuCollectionView.dataSource = self
        //menuCollectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: reuseableId)
        menuCollectionView.register(UINib.init(nibName: "MenuCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseableId)
        // Do any additional setup after loading the view.
        self.activityIndicator.startAnimating()
        NetworkManager.shared().loadImage { images in
            if let data: Data = images as? Data{
                self.topImage.image = UIImage(data: data)
            }
            self.activityIndicator.stopAnimating()
        }
        
        self.activityIndicator.startAnimating()
        NetworkManager.shared().fetchFilms { films in
            if let data: [String] = films  as? [String] {
                debugPrint(data)
            }
            self.activityIndicator.stopAnimating()
        }
        
        let message = NetworkManager.shared().closure("Bob")
         print(message)
        
        //webView.load(URLRequest(url: URL(string: "https://www.youtube.com/watch?v=GfSZtaoc5bw")!))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //
    }
    
    override func viewDidAppear(_ animated: Bool) {
    // Notificagtion listner add
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //
    }
    
    override func viewDidDisappear(_ animated: Bool) {
      // Notificagtion listner remove

    }
    
}

extension ViewController {
    
}

extension ViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 3.1, height: UIScreen.main.bounds.width/3)
    }}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseableId, for: indexPath) as? MenuCollectionViewCell
        cell?.lblName.text = "\(indexPath.row)"
        cell?.delegate = self
        cell?.btnDelete.tag = indexPath.row
        return cell ?? UICollectionViewCell()
    }
}

extension ViewController:MenuCollectionProtocol {
    func shareClickedProtocol(index: Int) {
        print("share at \(index)")
        //API////
        
    }
    
    func deleteClickedProtocol(index:Int) {
        print("delete at \(index)")

        //Func delete API Call
        //let obj = array[index]
    }
    
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        lblName.text = textField.text
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        lblName.text = textField.text
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        lblName.text = textField.text
    }
}

