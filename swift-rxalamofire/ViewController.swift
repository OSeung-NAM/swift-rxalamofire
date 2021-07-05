//
//  ViewController.swift
//  swift-rxalamofire
//
//  Created by OSeung Nam on 2021/07/05.
//

import UIKit
import RxSwift

class ViewController: UIViewController{
  
    @IBOutlet weak var postListTV: UITableView!
  
    @Inject var postService: PostService

    let disposeBag: DisposeBag = DisposeBag()
    
    var postList: Array<PostRPModel> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postListTV.delegate = self
        postListTV.dataSource = self
        postListTV.backgroundColor = .white
    }
    
    override func viewDidAppear(_ animated: Bool) {
        postService.getPostList()?
            .subscribe(onNext:{ [weak self] result in
                self?.postList = result
                self?.postListTV.reloadData()
            }).disposed(by: disposeBag)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .white
        cell.textLabel?.textColor = .black
        cell.textLabel?.text = postList[indexPath.row].title
        return cell
    }
}

