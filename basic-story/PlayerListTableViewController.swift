//
//  PlayerListTableViewController.swift
//  basic-story
//
//  Created by Sahna Melly Marselina on 27/02/23.
//

import UIKit

class PlayerListTableViewController: UIViewController {
    var name: String?
    var data: [Player]?

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabelName()
        setupTableView()
        populateData()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        if isMovingFromParent {
            debugPrint("YES")
            performSegue(withIdentifier: "unwindBack", sender: nil)
        }
    }

    private func setupLabelName() {
        if let nm = name, nm != "" {
            nameLabel.text = "Welcome \(nm)!"
        } else {
            nameLabel.text = "Welcome user!"
        }
    }

    private func setupTableView() {
        // related sama action
        tableView.delegate = self

        // related sama data
        tableView.dataSource = self

        // register xib
        registerTabelViewCell()
    }

    private func populateData() {
        data = [
            Player(id: 0, name: "Andre Iguodala", imageName: "andre", team: goldenState, age: 35, height: "6' 6\"", weight: 215),
            Player(id: 1, name: "Danny Green", imageName: "danny", team: toronto, age: 31, height: "6' 6\"", weight: 215),
            Player(id: 2, name: "DeMarcus Cousins", imageName: "demarc", team: goldenState, age: 28, height: "6' 11\"", weight: 270),
            Player(id: 3, name: "Draymond Green", imageName: "dray", team: goldenState, age: 29, height: "6' 7\"", weight: 230),
            Player(id: 4, name: "Kawhi Leonard", imageName: "kawhi", team: toronto, age: 27, height: "6' 7\"", weight: 230),
            Player(id: 5, name: "Klay Thompson", imageName: "klay", team: goldenState, age: 29, height: "6' 7\"", weight: 215),
            Player(id: 6, name: "Kyle Lowry", imageName: "kyle", team: toronto, age: 33, height: "6' 1\"", weight: 196),
            Player(id: 7, name: "Marc Gasol", imageName: "marc", team: toronto, age: 34, height: "7' 1\"", weight: 255),
            Player(id: 8, name: "Pascal Siakam", imageName: "siak", team: toronto, age: 25, height: "6' 9\"", weight: 230),
            Player(id: 9, name: "Stephen Curry", imageName: "steph", team: goldenState, age: 31, height: "6' 3\"", weight: 190),
            Player(id: 10, name: "Guard", imageName: "man", team: toronto, age: 0, height: "", weight: 0),
        ]
    }

    private func registerTabelViewCell() {
        let nib = UINib(nibName: "PlayerListTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "playercell")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if let vc = segue.destination as? PlayerDetailViewController, let player = sender as? Player {
            vc.data = player
        }
        
//        if segue.identifier == "unwindBack", let vc = segue.destination as? ViewController {
//            vc.extraLabel.isHidden = true
//        }
    }
}

extension PlayerListTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint("DATA KE \(indexPath.item)")
        performSegue(withIdentifier: "gotodetail", sender: data?[indexPath.item])
    }
}

extension PlayerListTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playercell", for: indexPath) as! PlayerListTableViewCell
        cell.label.text = data?[indexPath.item].name

        if let imgName = data?[indexPath.item].imageName {
            cell.img.image = UIImage(named: imgName)
        }

        cell.backgroundColor = data?[indexPath.item].team.color

        return cell
    }
}
