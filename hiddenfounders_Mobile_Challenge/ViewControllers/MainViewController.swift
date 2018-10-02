//
//  MainViewController.swift
//  hiddenfounders_Mobile_Challenge
//
//  Created by Yassine EL HALAOUI on 02/10/2018.
//

import UIKit

class MainViewController: UITableViewController {

    let cellId = "repoCell"
    var repositories: Repositories?

    var currentPage = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(ReposCell.self, forCellReuseIdentifier: cellId)

        navigationItem.title = "Trending Repos"
        navigationController?.navigationBar.prefersLargeTitles = true


        // Get data from web service
        WSUtils.shared.getRepositories { (repos) in
            self.repositories = repos
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repositories?.items?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? ReposCell {

            cell.reposItmes = self.repositories?.items?[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }

    // Pagination Logic
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (repositories?.items?.count)! - 1 {

            currentPage += 1
            WSUtils.shared.getRepositories(withPage: currentPage, completion: { (repos) in

                for item in repos.items! {
                    self.repositories?.items?.append(item)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            })

        }
    }

}
