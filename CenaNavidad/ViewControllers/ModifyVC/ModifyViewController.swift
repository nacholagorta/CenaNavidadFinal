

import UIKit



class ModifyViewController: UIViewController {
    internal var participantes: [Participantes] = []
    @IBOutlet weak var tablaModify: UITableView!
     internal var repository = LocalPeopleRepository()
     internal var task: Participantes!
    
    convenience init(task: [Participantes])
    {
        self.init()
        self.participantes = task
    }
    
    
    internal func registerCell()
    {
        let indentifier = "FilteredPayCell"
        let nib = UINib(nibName: indentifier, bundle: nil)
        tablaModify?.register(nib, forCellReuseIdentifier: "FilteredPayCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        title = "EDIT MODE"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension ModifyViewController: UITableViewDelegate,UITableViewDataSource
    
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return participantes.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 88.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: FilteredPayCell = (tableView.dequeueReusableCell(withIdentifier: "FilteredPayCell", for: indexPath) as? FilteredPayCell)!
        let person = participantes[indexPath.row]
        cell.lblFilteredName.text = person.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
        let participantes2 = participantes[indexPath.row]
        let vc = mdfAlertViewController(participante: participantes2)
        navigationController?.pushViewController(vc, animated: true)
       // present(vc, animated: true, completion: nil)
       
        
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
      
    }
    
}

extension ModifyViewController: mdfUserDelegate
{
    func mdfUserDelegate(_vc: mdfAlertViewController, didEditTask task: Participantes) {
        _vc.dismiss(animated: true, completion: nil)
        if repository.create(a: task) {
            participantes = repository.getAll()
            tablaModify?.reloadData()
        }
    }
}
