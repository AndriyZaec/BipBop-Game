//
//  ViewController.swift
//  BipBop Game
//
//  Created by Andrew Zaiets on 03.03.18.
//

import UIKit

class StartViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var explanationView: UIView!
    
    @IBOutlet weak var bipBopView: UIView!
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Actions
    
    @IBAction func playBipBopAction(_ sender: Any) {
        showBipBopContainer()
    }
    
    @IBAction func showExplanationAction(_ sender: Any) {
        showExplanationContainer()
    }
    
    //MARK: - Privates
    
    private func showBipBopContainer() {
        UIView.animate(withDuration: 0.5) {
            self.bipBopView.layer.opacity = 1.0
            self.explanationView.layer.opacity = 0.0
        }
    }
    
    private func showExplanationContainer() {
        UIView.animate(withDuration: 0.5) {
            self.bipBopView.layer.opacity = 0.0
            self.explanationView.layer.opacity = 1.0
        }
    }
    
    //MARK: - Navigation
    
    //MARK: - UI
    
    private func setupUI() {
        
    }
    
}

