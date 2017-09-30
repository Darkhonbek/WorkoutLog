//
//  MusclesTableViewController.swift
//  WorkoutLog 0.2
//
//  Created by Darkhonbek Mamataliev on 914//17.
//  Copyright © 2017 Darkhonbek Mamataliev. All rights reserved.
//

import UIKit

class MusclesTableViewController: UITableViewController {
    
    public var dayLog: DayLog? {
        didSet {
            updateUI()
        }
    }
    
    var muscleList: [String] = [String()]
    
    func updateUI() {
        reloadMuscleList()
    }
    
    func reloadMuscleList() {
        muscleList.removeAll()
        if let arr = dayLog?.getMuscleArray() {
            for muscle in arr {
                if let name = muscle.name {
                    muscleList.append(name)
                }
            }
        }
        muscleList.sort()        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return muscleList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "muscleLog", for: indexPath)
        let muscleName = muscleList[indexPath.row]
        if let muscleCell = cell as? MuscleTableViewCell {
            muscleCell.muscleName = muscleName
        }
        return cell
    }
    
}
