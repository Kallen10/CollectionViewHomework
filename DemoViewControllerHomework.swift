//
//  demoViewController.swift
//  Homework DemoTable
//
//  Created by Consultant on 11/1/22.
//

import UIKit

class DemoViewController: UIViewController {

    
    @IBOutlet weak var DemoViewController: UITableView!
    
     
    @IBOutlet weak var swapButton: UIButton!
      
    var    data1: [String] = ["Beanie", "Baseball Cap", "Snapback", "Fitted", "Top Hat", "No Hat", "Hoodie", "Jacket", "V-Neck", "Tee Shirt", "Long Sleeve Tee", "Collar Shirt","No Shirt", "Jeans", "Khakis","Corduroy","Sweatpants","Shorts","Running Pants","No Pants","Athletic Socks","Ankle   Socks","Dress Socks","Compression Socks","No   Socks","Crocs","Sneakers","Boots","Sandals","Heels","Running Shoes","No Shoes"]
//      true -> XIB, false -> storyboard
    var cellAppearanceState: Bool = false
    
    
      
    override func viewDidLoad() {
          super.viewDidLoad()
        self.setupUI()
         // Do any additional setup after loading the view.
      }
   
    
    
    func setupUI(){
        self.swapButton.setTitle("My Digital Closet XIB", for: .normal)
        self.DemoViewController.dataSource = self
        self.DemoViewController.delegate = self
        self.DemoViewController.register(UINib(nibName: "DemoXIBTableViewCell", bundle: nil), forCellReuseIdentifier: "DemoXIBTableViewCell")
    }

    
    
    @IBAction func swapButtonPressed(_ sender: Any) {
        self.cellAppearanceState.toggle()
        let title = (self.cellAppearanceState) ? " My Digital Closet StoryBoard": "My Digital Closet XIB"
        self.swapButton.setTitle(title, for: .normal)
        self.DemoViewController.reloadData()
    }
    
}

extension DemoViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    func tableView(_ tableVIew: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.data1.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if self.cellAppearanceState {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DemoXIBTableViewCell", for: indexPath) as? DemoXIBTableViewCell else {
                fatalError("You did not use the correct cell identifier")
            }
            
            cell.demoImageView.image = UIImage(named: "Beanie")
            cell.topLabel.text = "Beanie"
            
            return cell
        } else {
            
        }
        
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"DemoTableCell", for: indexPath) as? DemoStoryBoardTableViewCell else {
            return UITableViewCell()
            
           
                    
        }
        
        cell.topLabel.text = self.data1[indexPath.row]
        cell.demoImageView.image = UIImage(named: "\(self.data1[indexPath.row])")
        
        return cell
    }
    
    
    
}

extension DemoViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected zRow at: \(indexPath)")
    }
    
}
