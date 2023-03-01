//
//  ViewController.swift
//  basic-story
//
//  Created by Sahna Melly Marselina on 27/02/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var nameTextfield: UITextField!
    @IBOutlet var extraLabel: UILabel!

    // MARK: Life Cycle

    override func loadViewIfNeeded() {
        debugPrint("LifeCycle: loadViewIfNeeded")
        super.loadViewIfNeeded()
    }

    override func viewDidLoad() {
        debugPrint("LifeCycle: viewDidLoad")
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        populateUnwind()
        view.backgroundColor = .lightGray
    }

    override func viewWillAppear(_ animated: Bool) {
        debugPrint("LifeCycle: viewWillAppear")
        super.viewWillAppear(animated)
    }

    override func viewWillLayoutSubviews() {
        debugPrint("LifeCycle: viewWillLayoutSubviews")
        super.viewWillLayoutSubviews()
    }

    override func viewDidLayoutSubviews() {
        debugPrint("LifeCycle: viewDidLayoutSubviews")
        super.viewDidLayoutSubviews()
    }

    override func viewDidAppear(_ animated: Bool) {
        debugPrint("LifeCycle: viewDidAppear")
        super.viewDidAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        debugPrint("LifeCycle: viewWillDisappear")
        super.viewWillDisappear(animated)
    }

    override func viewDidDisappear(_ animated: Bool) {
        debugPrint("LifeCycle: viewDidDisappear")
        super.viewDidDisappear(animated)
    }

    @IBAction func enterWithoutParam(_ sender: UIButton) {
        debugPrint("enterWithoutParam")
    }

    @IBAction func enterWithParam(_ sender: Any) {
        // string interpolation
        if let name = nameTextfield.text, name != "" {
            debugPrint("enterWithParam \(name)")
            performSegue(withIdentifier: "gotoplayertableview", sender: name)
        } else {
            let alert = UIAlertController(title: "Warning", message: "You should fill your name!", preferredStyle: .alert)
            let action = UIAlertAction(title: "Mengerti!", style: .cancel)
            alert.addAction(action)
            present(alert, animated: true)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if let vc = segue.destination as? PlayerListTableViewController, let value = sender as? String {
//            vc.nameLabel.text = value
            vc.name = value // nameTextfield.text
        }
    }

    @IBAction func unwindToHome(_ sender: UIStoryboardSegue) {
        debugPrint("masuk unwindToHome")
    }

    @IBAction func unwindReset(_ sender: UIStoryboardSegue) {
        debugPrint("masuk unwindReset")
        extraLabel.isHidden = true
//        extraLabel.isHidden = true
    }
}
