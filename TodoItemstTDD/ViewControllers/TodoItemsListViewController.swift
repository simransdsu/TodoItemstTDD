//
//  TodoItemsListViewController.swift
//  TodoItemstTDD
//
//  Created by Simran Preet Singh Narang on 2022-07-19.
//

import UIKit
import Combine

class TodoItemsListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var todoItemStore: TodoItemStoreProtocol?
    private var items: [TodoItem] = []
    private var token: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        token = todoItemStore?.itemPublisher
            .sink(receiveValue: { [weak self] items in
                self?.items = items
            })
    }

}

extension TodoItemsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
}
