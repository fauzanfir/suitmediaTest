import UIKit

class ScreenCViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let tableView = UITableView()
    private var users: [User] = []
    private var currentPage = 1
    private var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHeader()
        setupTableView()
        fetchData(page: currentPage)
    }
    
    private func setupHeader() {
        navigationItem.title = "Third Screen"
        
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .purple
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    private func setupTableView() {
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .singleLine
        tableView.allowsSelection = true
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Add pull-to-refresh
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    // UITableViewDataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserTableViewCell
        let user = users[indexPath.row]
        cell.configure(with: user)
        return cell
    }
    
    // UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        if let screenBVC = navigationController?.viewControllers.first(where: { $0 is ScreenBViewController }) as? ScreenBViewController {
            screenBVC.selectedUserLabel.text = "\(user.first_name) \(user.last_name)"
            navigationController?.popViewController(animated: true)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.frame.size.height - 100 {
            if !isLoading && currentPage < 2 { // 2 is the total number of pages in this example
                currentPage += 1
                fetchData(page: currentPage)
            }
        }
    }
    
    private func fetchData(page: Int) {
        isLoading = true
        let urlString = "https://reqres.in/api/users?page=\(page)&per_page=10"
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                self.isLoading = false
                return
            }
            
            do {
                let response = try JSONDecoder().decode(UserResponse.self, from: data)
                self.users.append(contentsOf: response.data)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.isLoading = false
                }
            } catch {
                print("Failed to decode JSON:", error)
                self.isLoading = false
            }
        }
        task.resume()
    }
    
    @objc private func refreshData() {
        currentPage = 1
        users.removeAll()
        fetchData(page: currentPage)
        tableView.refreshControl?.endRefreshing()
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

struct UserResponse: Codable {
    let data: [User]
}

struct User: Codable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}
