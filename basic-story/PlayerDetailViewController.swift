//
//  PlayerDetailViewController.swift
//  basic-story
//
//  Created by Sahna Melly Marselina on 28/02/23.
//

import UIKit

class PlayerDetailViewController: UIViewController {
    var data: Player?

    @IBOutlet var imageHeight: NSLayoutConstraint!
    @IBOutlet var teamBackground: UIImageView!
    @IBOutlet var playerImage: UIImageView!
    @IBOutlet var label: UILabel!

    @IBOutlet var ageLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!

    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupData()
        setupUI()
        setupCollectionView()
    }

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        perfor
    }

    private func setupData() {
        label.text = data?.name
        if let age = data?.age {
            ageLabel.text = String(age)
        }

        if let weight = data?.weight {
            weightLabel.text = String(weight)
        }

        heightLabel.text = data?.height
    }

    private func setupUI() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            imageHeight.constant = 300
            playerImage.roundedImage()
        } else {
            playerImage.roundedImage()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        if let vc = segue.destination as? ViewController {
            debugPrint(sender.debugDescription)
            vc.extraLabel.text = "Hello from detail"
            vc.extraLabel.isHidden = false
        } else if let vc = segue.destination as? PlayerScrollViewController, let dt = sender as? String {
            vc.imageName = dt
        }
    }
}

extension PlayerDetailViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        debugPrint("DATA KE-\(indexPath.item)")
        performSegue(withIdentifier: "goToScroll", sender: data?.imageName)
    }
}

extension PlayerDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectioncell", for: indexPath) as! PlayerCollectionViewCell
        cell.image.image = UIImage(named: "andre")
//        cell.image.backgroundColor = .gray
//        cell.image.contentMode = .scaleAspectFit
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "reusableplayer", for: indexPath) as! PlayerCollectionReusableView

            header.label.text = "Gallery"
            header.backgroundColor = data?.team.color

            return header

        default:
            return UICollectionReusableView()
        }
    }
}
